<?php

namespace Database\Seeders;

use App\Models\ParentCategory;
use App\Models\ProductCategory;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $xmlFile = file_get_contents(public_path('xml-data/ParentCategory.xml'));
        $xmlObject = simplexml_load_string($xmlFile);

        $json = json_encode($xmlObject);
        $xml = json_decode($json,true);

        if(count($xml['ProductSuperCategoryList']) > 0){
            foreach ($xml['ProductSuperCategoryList'] as $item) {
                foreach ($item as $data){
                    foreach ($data['ProductCategoryList'] as $parent){
                        for($i = 0; $i < count($parent); $i++){
                            $GLOBALS['dataArray'][] = [
                                'id' => $parent[$i]['CategoryCode'],
                                'product_category_id' => $parent[$i]['CategoryCode'],
                                'CategoryName' => $parent[$i]['CategoryName'],
                                'ParentCategoryCode' => $data['SuperCategoryCode'],
                                'created_at' => Carbon::now(),
                                'updated_at' => Carbon::now()
                            ];
                        }
                    }
                }
            }
        }
        echo '<pre>';
        $chunk = array_chunk($GLOBALS['dataArray'],100);
        foreach ($chunk as $result){
            ProductCategory::insert($result);
        }
    }
}
