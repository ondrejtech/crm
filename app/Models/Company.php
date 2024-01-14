<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

    public function contact(): BelongsTo
    {
        return $this->belongsTo(Contact::class);
    }

    public function contacts(): HasMany
    {
        return $this->hasMany(Contact::class);
    }
}