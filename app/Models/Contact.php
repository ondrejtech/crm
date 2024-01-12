<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    protected $fillable = [
        'company_id',
        'department_id',
        'full_name',
        'company',
        'department',
        'email',
        'newsletter',
        'landline',
        'mobile',
        'next_phone',
        'address',
        'city',
        'zip_code',
        'state',
        'country',
        'note',
    ];
}
