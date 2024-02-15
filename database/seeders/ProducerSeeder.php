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
        $xml = json_decode($json, true);

        if (count($xml['ProductProducerList']) > 0) {

            foreach ($xml['ProductProducerList'] as $index => $data) {

                foreach($data as $index => $producer){
                    $dataArray[] = [
                        'ProducerId' => $producer['ProducerId'],
                        'ProducerCode' => $producer['ProducerCode'],
                        'ProducerName' => $producer['ProducerName']
                    ];
                }
            }

            $chunk = array_chunk($dataArray, 100);
            foreach ($chunk as $result) {
                Producer::insert($result);
            }
        }
    }
}
