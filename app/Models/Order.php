<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'number',
        'contact_id',
        'company_id',
        'product_id',
        'quantity',
        'status',
        'note',
        'unit_price'
    ];

    public function contacts(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class);
    }

    public function company(): BelongsToMany
    {
        return $this->belongsToMany(Company::class, 'order_company_relations');
    }

    public function items():BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'order_product_relations');
    }
}
