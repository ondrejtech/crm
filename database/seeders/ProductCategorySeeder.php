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

        if (count($xml['ProductCategoryList']) > 0) {
            foreach ($xml['ProductCategoryList'] as $index => $data){
                foreach($data as $index => $item){
                    foreach ($item as $index => $category){
                        if(isset($category['ProductAttributeList'])){
                            $category['ProductAttributeList'] = '';
                        }
                        $dataArray[] = $category;
//                        foreach ($category as $subData){
//                            if(isset($subData['ProductAttributeList'])){
//                                $subData['ProductAttributeList'] = '';
//                            }
//                            $dataArray[] = $subData;
//                        }
                    }
                }
            }
            $chunk = array_chunk($dataArray,100);
            foreach($chunk as $result){
                for($i = 0; $i < count($result) - 1; $i++);
                ProductCategory::insert([
                    'id' => $result[$i]['CategoryCode'],
                    'category_code' => $result[$i]['CategoryCode'],
                    'CategoryName' => $result[$i]['CategoryName'],
                    'ProductAttributeList' => $result[$i]['ProductAttributeList'],
                ]);
            }
        }
    }
}
