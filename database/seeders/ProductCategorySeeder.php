<?php

namespace Database\Seeders;

use App\Models\ProductCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $xmlFile = file_get_contents(public_path('xml-data/ProductCategoryList.xml'));
        $xmlData = simplexml_load_string($xmlFile);

        $json  = json_encode($xmlData);
        $xml = json_decode($json, true);
        $inc = 0;

        if (count($xml['ProductSuperCategory']) > 0) {
            foreach ($xml['ProductSuperCategory'] as $index => $data){
                foreach($data as $index => $item){
                    foreach ($item as $index => $category){
                        foreach ($category as $subData){
                            $dataArray[] = [
                                'CategoryCode' => $subData['CategoryCode'],
                                'CategoryName' => $subData['CategoryName'],
                            ];
                        }
                    }
                }
            }
            $chunk = array_chunk($dataArray, 100);
            foreach($chunk as $result){
                ProductCategory::insert($result);
            }
        }
    }
}
