<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use App\Models\Company;
use App\Models\Invoice;
use App\Models\Order;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Model;
use Filament\Notifications\Notification;
use Spatie\FlareClient\View;
use Spatie\LaravelPdf\Facades\Pdf;

class ListOrders extends ListRecords
{
    protected static string $resource = OrderResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    public function generateInvoice(?Model $record)
    {
        if ($record instanceof \Illuminate\Database\Eloquent\Collection) {
            $record->each(function ($data) {
                if($data->status !== 'COMPLETED'){
                    $data->status = 'COMPLETED';
                    $data->save();

                    $invoiceData = [
                        'number' => 'INV-' . random_int(1111, 99999),
                        'company_id' => $data->company_id,
                        'order_number' => $data->number,
                        'contact_id' => $data->contact_id,
                        'status' => 'PAYMENT',
                        'delivery_address' => $data->delivery_address,
                        'delivery_city' => $data->delivery_city,
                        'delivery_psc' => $data->delivery_psc,
                        'delivery_state' => $data->delivery_state,
                        'delivery_country' => $data->delivery_country,
                        'note' => $data->note,
                    ];

                    // Získání objednávky
                    $order = Order::find($data->id);

                    // Přidání order_id do faktury
                    $invoiceData['order_id'] = $order->id;

                    Invoice::create($invoiceData);
                    Notification::make()
                        ->title('Invoice has been successfully created')
                        ->success()
                        ->send();

                    return redirect('admin/invoices');
                }else{
                    redirect()->back();
                    Notification::make()
                        ->title('Invoice already exists')
                        ->danger()
                        ->send();
                }
            });
        } elseif ($record instanceof \Illuminate\Database\Eloquent\Model) {
            if ($record->status !== 'COMPLETED') {
                $record->status = 'COMPLETED';
                $record->save();

                $invoiceData = [
                    'number' => 'INV-' . random_int(1111, 99999),
                    'order_number' => $record->number,
                    'company_id' => $record->company_id,
                    'contact_id' => $record->contact_id,
                    'status' => 'PAYMENT',
                    'delivery_address' => $record->delivery_address,
                    'delivery_city' => $record->delivery_city,
                    'delivery_psc' => $record->delivery_psc,
                    'delivery_state_id' => $record->delivery_state_id,
                    'delivery_country_id' => $record->delivery_country_id,
                    'note' => $record->note,
                ];

                // Získání objednávky
                $order = Order::find($record->id);

                // Přidání order_id do faktury
                $invoiceData['order_id'] = $order->id;

                Invoice::create($invoiceData);

                Notification::make()
                    ->title('Invoice has been successfully created')
                    ->success()
                    ->send();
                return redirect('admin/invoices');
            } else {
                redirect()->back();
                Notification::make()
                    ->title('Invoice already exists')
                    ->danger()
                    ->send();
            }
        }
    }

    public function generatePDF(Order $order)
    {
//        $pdf = PDF::loadHTML(view('pdf.order', ['order' => $order])->render());
        $pdf = Pdf::view('pdf.order', ['order' => $order]);
        return $pdf->download('order_'.$order->number.'.pdf');
    }
}
