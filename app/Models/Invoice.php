<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Invoice extends Model
{
    use HasFactory;

    protected $fillable = [
        'number','order_id','order_number', 'company_id','contact_id','status','delivery_address','delivery_city','delivery_psc',
        'delivery_state_id','delivery_country_id','note',
    ];

    public function deliveryCountry(): BelongsTo
    {
        return $this->belongsTo(Country::class);
    }

    public function deliveryState(): BelongsTo
    {
        return $this->belongsTo(State::class);
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class);
    }

    public function contact(): BelongsTo
    {
        return $this->belongsTo(Contact::class);
    }

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }
}
