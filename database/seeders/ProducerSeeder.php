<?php

namespace Database\Seeders;

use App\Models\Producer;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProducerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $xmlFile = file_get_contents(public_path('xml-data/producer.xml'));
        $xmlObject = simplexml_load_string($xmlFile);

        $json = json_encode($xmlObject);
        $xml = json_decode($json,true);

        if(count($xml['ProductProducerList']) > 0){
            foreach ($xml['ProductProducerList'] as $index => $item){
                $dataArray[] = $item;
            }
        }
        $chunk = array_chunk($dataArray,100);
        foreach ($chunk as $result){
//            print_r($result);
            Producer::insert($result[0]);
        }
    }
}
