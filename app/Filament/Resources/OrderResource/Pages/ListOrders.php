<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use App\Models\Company;
use App\Models\Invoice;
use App\Models\Order;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Model;

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
                $data->status = 'COMPLETED';
                $data->save();

                $invoiceData = [
                    'company_id' => $data->company_id,
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
            });
        } elseif ($record instanceof \Illuminate\Database\Eloquent\Model) {
            $record->status = 'COMPLETED';
            $record->save();

            $invoiceData = [
                'company_id' => $record->company_id,
                'contact_id' => $record->contact_id,
                'status' => 'PAYMENT',
                'delivery_address' => $record->delivery_address,
                'delivery_city' => $record->delivery_city,
                'delivery_psc' => $record->delivery_psc,
                'delivery_state' => $record->delivery_state,
                'delivery_country' => $record->delivery_country,
                'note' => $record->note,
            ];

            // Získání objednávky
            $order = Order::find($record->id);

            // Přidání order_id do faktury
            $invoiceData['order_id'] = $order->id;

            Invoice::create($invoiceData);
        }
    }
}
