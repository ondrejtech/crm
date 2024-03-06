<?php

namespace App\Livewire;

use App\Models\Contact;
use App\Models\File;
use App\Models\Order;
use App\Models\OrderItem;
use Livewire\Component;

class InvoiceGenerator extends Component
{
    public $record;
    public function render()
    {
        $order = Order::find($this->id);
        $orderItems = OrderItem::where('order_id', $this->order_id)->get();
        $contact = Contact::find($order->contact_id);

        return view('livewire.invoice-generator', [
            'order' => $order,
            'orderItems' => $orderItems,
            'contact' => $contact,
        ]);
    }

    public function generateInvoice()
    {
        return redirect('admin');
    }

//    public function generateInvoice()
//    {
//        // Logika pro generování faktury a XML souboru
//        $invoiceData = [
//            // Data pro fakturu
//            'number' => 'INV-'.random_int(1111,99999),
//            'order_id' => $this->record->id,
//            'company_id' => $this->company->id,
//            'contact_id' =>$this->contact->id
//        ];

//        $xmlContent = $this->generateXML($invoiceData);
//
//        // Uložení XML souboru do veřejné složky
//        $xmlFilePath = public_path('money/invoice.xml');
//        File::put($xmlFilePath, $xmlContent);
//
//        // Odeslat fakturu zákazníkovi (implementace emailu)
//
//        // Případně můžete přidat logiku pro zobrazování notifikace atd.
//
//        // Aktualizace stavu objednávky na fakturováno
//        $order = Order::find($this->id);
//        $order->status = 'COMPLETED';
//        $order->save();
//
//        session()->flash('message', 'Invoice has been successfully generated and sent.');
//
//        return redirect()->to('admin'); // Upravte podle potřeby
//
//    }
}
