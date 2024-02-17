<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $xmlFile = file_get_contents(public_path('xml-data/telefony-tablety.xml'));
        $xmlObject = simplexml_load_string($xmlFile);

        $json = json_encode($xmlObject);
        $xml = json_decode($json,true);

        if(count($xml['ProductComplete']) > 0){
            foreach ($xml['ProductComplete'] as $index => $data){
                if(empty($data['ProId'])){
                    $data['ProId'] = '';
                }
                if(empty($data['Code'])){
                    $data['Code'] = '';
                }
                if(empty($data['Name'])){
                    $data['Name'] = '';
                }
                if(empty($data['GarbageFee'])){
                    $data['GarbageFee'] = '';
                }
                if(empty($data['AuthorFee'])){
                    $data['AuthorFee'] = '';
                }
                if(empty($data['YourPrice'])){
                    $data['YourPrice'] = '';
                }
                if(empty($data['YourPriceWithFees'])){
                    $data['YourPriceWithFees'] = '';
                }
                if(empty($data['EndUserPrice'])){
                    $data['EndUserPrice'] = '';
                }
                if(empty($data['Warranty'])){
                    $data['Warranty'] = '';
                }
                if(empty($data['PartNumber'])){
                    $data['PartNumber'] = '';
                }
                if(empty($data['OnStockText'])){
                    $data['OnStockText'] = '';
                }
                if(empty($data['Unit'])){
                    $data['Unit'] = '';
                }
                if(empty($data['Status'])){
                    $data['Status'] = '';
                }
                if(empty($data['EANCode'])){
                    $data['EANCode'] = '';
                }
                if(empty($data['product_category_id'])){
                    $data['product_category_id'] = '';
                }
                if(empty($data['IsPremium'])){
                    $data['IsPremium'] = '';
                }
                $dataArray[] = [
                    'ProId' => $data['ProId'],
                    'Code' => $data['Code'],
                    'Name' => $data['Name'],
                    'GarbageFee' => $data['GarbageFee'],
                    'AuthorFee' => $data['AuthorFee'],
                    'YourPrice' => $data['YourPrice'],
                    'YourPriceWithFees' => $data['YourPriceWithFees'],
                    'EndUserPrice' => $data['EndUserPrice'],
                    'Warranty' => $data['Warranty'],
                    'PartNumber' => $data['PartNumber'],
                    'OnStockText' => $data['OnStockText'],
                    'Unit' => $data['Unit'],
                    'Status' => $data['Status'],
                    'EANCode' => $data['EANCode'],
                    'IsPremium' => $data['IsPremium'],
                ];
            }
            $chunk = array_chunk($dataArray,100);
            foreach($chunk as $index => $item){
                Product::insert($item);
            }

        }

    }
}
