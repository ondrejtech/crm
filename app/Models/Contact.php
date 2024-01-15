<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

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


    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class);
    }

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function companies(): HasMany
    {
        return $this->hasMany(Company::class);
    }
}
