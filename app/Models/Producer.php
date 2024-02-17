<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Producer extends Model
{
    use HasFactory;

    protected $fillable = [
        'ProducerId',
        'producer_code',
        'ProducerName'
    ];
}
