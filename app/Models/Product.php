<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'ProId',
        'Code',
        'Name',
        'GarbageFee',
        'AuthorFee',
        'YourPrice',
        'YourPriceWithFees',
        'EndUserPrice',
        'Warranty',
        'PartNumber',
        'OnStockText',
        'Unit',
        'Status',
        'EANCode',
        'producer_id',
        'product_category_id',
        'commodity_id',
        'IsPremium',
    ];
}
