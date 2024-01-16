<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'subject',
        'solver',
        'start_task',
        'end_task',
    ];

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'task_companies');
    }
}
