<?php

namespace Database\Seeders;

use App\Models\ParentCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ParentCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $xmlFile = file_get_contents(public_path('xml-data/ParentCategory.xml'));
        $xmlFile1 = file_get_contents(public_path('category-data.xml'));
        $xmlObject = simplexml_load_string($xmlFile);
        $xmlObject1 = simplexml_load_string($xmlFile1);

        $json = json_encode($xmlObject);
        $json1 = json_encode($xmlObject1);
        $xml = json_decode($json, true);
        $xmlCategory = json_decode($json1,true);

        if(count($xml['ProductSuperCategoryList']) > 0){
            foreach ($xml['ProductSuperCategoryList'] as $index => $item){
                foreach ($item as $indesx => $data){
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
