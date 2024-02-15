<?php

namespace Database\Seeders;

use App\Models\Commodity;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CommoditySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $xmlFile = file_get_contents(public_path('xml-data/telefony-tablety.xml'));
        $xmlObject = simplexml_load_string($xmlFile);

        $json = json_encode($xmlObject);
        $xml = json_decode($json, true);

        if(count($xml['ProductComplete']) > 0){
            foreach($xml['ProductComplete'] as $index => $data){
                $dataArray[] = [
                    'CommodityCode' => $data['CommodityCode'],
                    'CommodityName' => $data['CommodityName'],
                ];

                $chunk = array_chunk($dataArray,100);
                foreach($chunk as $item){
                    Commodity::insert($item);
                }
            }
        }
    }
}
