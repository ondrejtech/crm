<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

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

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'contact_companies');
    }
}
