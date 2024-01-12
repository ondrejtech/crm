<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'phone',
        'email',
        'www',
        'IC',
        'DIC',
        'subscriber',
        'supplier',
        'competition',
        'address',
        'city',
        'zip_code',
        'state',
        'country',
        'note'
    ];
}
