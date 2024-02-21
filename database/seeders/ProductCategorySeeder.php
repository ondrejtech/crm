<?php

namespace Database\Seeders;

use App\Models\ParentCategory;
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
        $xmlFile = file_get_contents(public_path('xml-data/category.xml'));
        $xmlObject = simplexml_load_string($xmlFile);

        $json = json_encode($xmlObject);
        $xml = json_decode($json,true);

        if(count($xml['data']) > 0){
            foreach ($xml['data'] as $index => $data) {
                $dataArray[] = $data;
            }

            for($i = 0; $i < count($data); $i++){
                foreach($dataArray[0][$i] as $item){
                    for($a = 0; $a < count($item);$a++){
                        $categoryArray[] = [
                            'CategoryCode' => $item[$a]['CategoryCode'],
                            'CategoryName' => $item[$a]['CategoryName'],
                        ];
                    }
                }
            }
            $chunk = array_chunk($categoryArray,100);
            foreach ($chunk as $result){
                ProductCategory::insert($result);
            }
        }
    }
}
