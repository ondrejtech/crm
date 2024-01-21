<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Absence extends Model
{
    use HasFactory;

    protected $fillable = [
        'start_date',
        'start_time',
        'finish_date',
        'finish_time',
        'all_day',
        'description',
        'note'
    ];

    public function employees(): BelongsToMany
    {
        return $this->belongsToMany(Employee::class,'absence_employees');
    }


    public function absence_types():BelongsToMany
    {
        return $this->belongsToMany(AbsenceType::class, 'absence_relation_types');
    }
}
