<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'Code',
        'Name',
        'YourPrice',
        'YourPriceWithFees',
        'CommodityCode',
        'GarbageFee',
        'AuthorFee',
        'ValuePack',
        'ValuePackQty',
        'Warranty',
        'CommodityName',
        'DealerPrice',
        'EndUserPrice',
        'Vat',
        'PartNumber',
        'OnStock',
        'OnStockText',
        'Status',
        'ProducerName',
        'RateOfDutyCode',
        'EANCode',
        'NameB2C',
        'DescriptionShort',
        'MultipleQuantity',
        'Description',
        'IsTop',
        'InfoCode',
        'IndexSort1',
        'IndexCode1',
        'IndexOrder1',
        'IndexImplicit1',
        'IndexSort2',
        'IndexCode2',
        'IndexOrder2',
        'IndexImplicit2',
        'WarrantyTerm',
        'WarrantyUnit',
        'PartNumber2',
        'DateAvailible',
        'DealerPrice1',
        'Unit',
        'OnStockCount',
        'ImgCount',
        'ImgLastChanged',
        'ProducerCode',
        'category_id',
        'B2C',
        'B2FPrice',
        'RCStatus',
        'RCCode',
        'IsPremium',
        'ExtInfoCodes',
        'PriceDiscount',
        'EndUserPriceDPH',
        'DescriptionShort',
        'Description',
        'SmallImage',
        'BigImage'
    ];

    public function product_category(): BelongsTo
    {
        return $this->belongsTo(ProductCategory::class);
    }

    public function order(): BelongsToMany
    {
        return $this->belongsToMany(Order::class, 'order_product_relations');
    }
}
