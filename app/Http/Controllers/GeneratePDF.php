<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class GeneratePDF extends Controller
{
    public function orderPDF()
    {
//        dd($record);
        $pdf = Filament::makePdf()
            ->addText('Objednávka', ['bold' => true])
            ->addText('Zákazník: ' . $order->customer_name)
            // další informace o objednávce
            ->output();
    }
}
