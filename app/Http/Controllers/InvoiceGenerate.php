<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Contact;
use App\Models\Order;
use App\Models\OrderItem;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InvoiceGenerate extends Controller
{
    public function generate(Order $record)
    {
        $header[] = [
            'company' => 'Millenium International s.r.o.',
            'address' => 'Kosicka 63/30',
            'town' => 'Praha',
            'state' => 'Czech republic',
            'tel' => '721 178 847',
            'fax' => '',
            'IC' => '022 39 221',
            'DIC' => 'CZ02239221',
            'created_at' => $record->created_at
        ];
        echo "<pre>";
//        print_r($header);
        $company = Company::find($record->company_id)->first();
        $contact = Contact::find($record->contact_id)->first();
        $order = Order::find($record->id)->first();
        $orderItem = OrderItem::all()->where('order_id',$record->id);
        return view('PDF.order-pdf',compact('company','contact','order','orderItem','header'));
    }
}
