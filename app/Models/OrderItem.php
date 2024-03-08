<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\Pivot;

class OrderItem extends Pivot
{
    use HasFactory;

    protected $fillable = [
        'product_id','quantity','unit_price','total_price',
    ];

    protected static function boot()
    {
        parent::boot();

        static::saving(function ($orderItem) {
            $orderItem->total_price = $orderItem->unit_price * $orderItem->quantity;
        });
    }

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }
}
