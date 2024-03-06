<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;

    protected $fillable = [
        'number','order_id', 'company_id','contact_id','status','delivery_address','delivery_city','delivery_psc','delivery_state','delivery_country','note',
    ];


}
