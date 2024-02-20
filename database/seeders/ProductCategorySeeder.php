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
        $xmlFile = file_get_contents(public_path('category-data.xml'));
        $xmlObject = simplexml_load_string($xmlFile);

        $json = json_encode($xmlObject);
        $xml = json_decode($json, true);

        if(count($xml['ProductSuperCategoryList']) > 0){
            foreach ($xml['ProductSuperCategoryList'] as $index => $item){
                foreach ($item as $indesx => $data){
                    print_r($data);
                    $dataArray[] = [
                        'SuperCategoryCode' => $data['SuperCategoryCode'],
                        'SuperCategoryName' => $data['SuperCategoryName'],
                        'ParentSuperCategoryCode' => $data['ParentSuperCategoryCode']
                    ];
                }

            }

            $chunkCategory = array_chunk($dataArray,100);
            foreach($chunkCategory as $catetegory){
                ParentCategory::insert($catetegory);
            }
        }
    }
}
