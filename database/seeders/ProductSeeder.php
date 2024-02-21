<?php

namespace Database\Seeders;

use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $xmlFile = file_get_contents(public_path('xml-data/multifunkce-tiskarny.xml'));
        $xmlObject = simplexml_load_string($xmlFile);

        $json = json_encode($xmlObject);
        $xml = json_decode($json,true);

        if(count($xml['ProductComplete']) > 0){
            foreach ($xml['ProductComplete'] as $index => $data){
                foreach ($data['ImageList'] as $value){
                    if(isset($value['URL'])){
                        $image = $value['URL'];
                    }else{
                        $image = $value[0]['URL'];
                    }
                }
                if(empty($data['ProId'])){
                    $data['ProId'] = 'NULL';
                }

                if(empty($data['Code'])){
                    $data['Code'] = 'NULL';
                }

                if(empty($data['Name'])){
                    $data['Name'] = 'NULL';
                }

                if(empty($data['YourPrice'])){
                    $data['YourPrice'] = 'NULL';
                }

                if(empty($data['YourPriceWithFees'])){
                    $data['YourPriceWithFees'] = 'NULL';
                }

                if(empty($data['CommodityCode'])){
                    $data['CommodityCode'] = 'NULL';
                }

                if(empty($data['GarbageFee'])){
                    $data['GarbageFee'] = 'NULL';
                }

                if(empty($data['AuthorFee'])){
                    $data['AuthorFee'] = 'NULL';
                }

                if(empty($data['ValuePack'])){
                    $data['ValuePack'] = 'NULL';
                }

                if(empty($data['ValuePackQty'])){
                    $data['ValuePackQty'] = 'NULL';
                }

                if(empty($data['Warranty'])){
                    $data['Warranty'] = 'NULL';
                }

                if(empty($data['CommodityName'])){
                    $data['CommodityName'] = 'NULL';
                }

                if(empty($data['DealerPrice'])){
                    $data['DealerPrice'] = 'NULL';
                }

                if(empty($data['EndUserPrice'])){
                    $data['EndUserPrice'] = 'NULL';
                }

                if(empty($data['Vat'])){
                    $data['Vat'] = 'NULL';
                }

                if(empty($data['PartNumber'])){
                    $data['PartNumber'] = 'NULL';
                }

                if(empty($data['OnStock'])){
                    $data['OnStock'] = 'NULL';
                }

                if(empty($data['OnStockText'])){
                    $data['OnStockText'] = 'NULL';
                }

                if(empty($data['Status'])){
                    $data['Status'] = 'NULL';
                }

                if(empty($data['ProducerName'])){
                    $data['ProducerName'] = 'NULL';
                }

                if(empty($data['RateOfDutyCode'])){
                    $data['RateOfDutyCode'] = 'NULL';
                }

                if(empty($data['EANCode'])){
                    $data['EANCode'] = 'NULL';
                }

                if(empty($data['NameB2C'])){
                    $data['NameB2C'] = 'NULL';
                }

                if(empty($data['MultipleQuantity'])){
                    $data['MultipleQuantity'] = 'NULL';
                }

                if(empty($data['IsTop'])){
                    $data['IsTop'] = 'NULL';
                }

                if(empty($data['InfoCode'])){
                    $data['InfoCode'] = 'NULL';
                }

                if(empty($data['IndexSort1'])){
                    $data['IndexSort1'] = 'NULL';
                }

                if(empty($data['IndexCode1'])){
                    $data['IndexCode1'] = 'NULL';
                }

                if(empty($data['IndexOrder1'])){
                    $data['IndexOrder1'] = 'NULL';
                }

                if(empty($data['IndexImplicit1'])){
                    $data['IndexImplicit1'] = 'NULL';
                }

                if(empty($data['IndexSort2'])){
                    $data['IndexSort2'] = 'NULL';
                }

                if(empty($data['IndexCode2'])){
                    $data['IndexCode2'] = 'NULL';
                }

                if(empty($data['IndexOrder2'])){
                    $data['IndexOrder2'] = 'NULL';
                }

                if(empty($data['IndexImplicit2'])){
                    $data['IndexImplicit2'] = 'NULL';
                }

                if(empty($data['WarrantyTerm'])){
                    $data['WarrantyTerm'] = 'NULL';
                }

                if(empty($data['WarrantyUnit'])){
                    $data['WarrantyUnit'] = 'NULL';
                }

                if(empty($data['PartNumber2'])){
                    $data['PartNumber2'] = 'NULL';
                }

                if(empty($data['DateAvailible'])){
                    $data['DateAvailible'] = 'NULL';
                }

                if(empty($data['DealerPrice1'])){
                    $data['DealerPrice1'] = 'NULL';
                }

                if(empty($data['Unit'])){
                    $data['Unit'] = 'NULL';
                }

                if(empty($data['OnStockCount'])){
                    $data['OnStockCount'] = 'NULL';
                }

                if(empty($data['ImgCount'])){
                    $data['ImgCount'] = 'NULL';
                }

                if(empty($data['ImgLastChanged'])){
                    $data['ImgLastChanged'] = 'NULL';
                }

                if(empty($data['ProducerCode'])){
                    $data['ProducerCode'] = 'NULL';
                }

                if(empty($data['CategoryCode'])){
                    $data['CategoryCode'] = 'NULL';
                }

                if(empty($data['B2C'])){
                    $data['B2C'] = 'NULL';
                }

                if(empty($data['B2FPrice'])){
                    $data['B2FPrice'] = 'NULL';
                }

                if(empty($data['RCStatus'])){
                    $data['RCStatus'] = 'NULL';
                }

                if(empty($data['RCCode'])){
                    $data['RCCode'] = 'NULL';
                }

                if(empty($data['IsPremium'])){
                    $data['IsPremium'] = 'NULL';
                }
                if(empty($data['ExtInfoCodes'])){
                    $data['ExtInfoCodes'] = 'NULL';
                }

                if(empty($data['DescriptionShort'])){
                    $data['DescriptionShort'] = '';
                }

                if(empty($data['Description'])){
                    $data['Description'] = '';
                }


                $subPrice = $data['EndUserPrice'];
                $price = $subPrice * 1.21;
                $vat = 0.21;
                $percent = 0.30;
                $subDiscount = ($price * $percent);
                $discount = $price - $subDiscount;

                $dataArray[] = [
                    'ProId' => $data['ProId'],
                    'Code' => $data['Code'],
                    'Name' => $data['Name'],
                    'YourPrice' => number_format($data['YourPrice']),
                    'YourPriceWithFees' => $data['YourPriceWithFees'],
                    'CommodityCode' => $data['CommodityCode'],
                    'GarbageFee' => $data['GarbageFee'],
                    'AuthorFee' => $data['AuthorFee'],
                    'ValuePack' => $data['ValuePack'],
                    'ValuePackQty' => $data['ValuePackQty'],
                    'Warranty' => $data['Warranty'],
                    'CommodityName' => $data['CommodityName'],
                    'DealerPrice' => $data['DealerPrice'],
                    'EndUserPrice' => $data['EndUserPrice'],
                    'Vat' => $data['Vat'],
                    'PartNumber' => $data['PartNumber'],
                    'OnStock' => $data['OnStock'],
                    'OnStockText' => $data['OnStockText'],
                    'Status' => $data['Status'],
                    'ProducerName' => $data['ProducerName'],
                    'RateOfDutyCode' => $data['RateOfDutyCode'],
                    'EANCode' => $data['EANCode'],
                    'NameB2C' => $data['NameB2C'],
                    'MultipleQuantity' => $data['MultipleQuantity'],
                    'IsTop' => $data['IsTop'],
                    'InfoCode' => $data['InfoCode'],
                    'IndexSort1' => $data['IndexSort1'],
                    'IndexCode1' => $data['IndexCode1'],
                    'IndexOrder1' => $data['IndexOrder1'],
                    'IndexImplicit1' => $data['IndexImplicit1'],
                    'IndexSort2' => $data['IndexSort2'],
                    'IndexCode2' => $data['IndexCode2'],
                    'IndexOrder2' => $data['IndexOrder2'],
                    'IndexImplicit2' => $data['IndexImplicit2'],
                    'WarrantyTerm' => $data['WarrantyTerm'],
                    'WarrantyUnit' => $data['WarrantyUnit'],
                    'PartNumber2' => $data['PartNumber2'],
                    'DateAvailible' => $data['DateAvailible'],
                    'DealerPrice1' => $data['DealerPrice1'],
                    'Unit' => $data['Unit'],
                    'OnStockCount' => $data['OnStockCount'],
                    'ImgCount' => $data['ImgCount'],
                    'ImgLastChanged' => $data['ImgLastChanged'],
                    'ProducerCode' => $data['ProducerCode'],
                    'product_category_id' => $data['CategoryCode'],
                    'B2C' => $data['B2C'],
                    'B2FPrice' => $data['B2FPrice'],
                    'RCStatus' => $data['RCStatus'],
                    'RCCode' => $data['RCCode'],
                    'IsPremium' => $data['IsPremium'],
                    'ExtInfoCodes' => $data['ExtInfoCodes'],
                    'EndUserPriceDPH' => number_format($price),
                    'PriceDiscount' => number_format($discount),
                    'DescriptionShort' =>$data['DescriptionShort'],
                    'Description' => $data['Description'],
                    'SmallImage' => $image,
                    'BigImage' => $image,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                ];
            }
        }
        $chunk = array_chunk($dataArray,100);
        foreach ($chunk as $result){
            Product::insert($result);
        }
    }
}
