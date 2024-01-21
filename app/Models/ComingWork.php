<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class ComingWork extends Model
{
    use HasFactory;

    protected $fillable = [
        'subject',
        'date',
        'from',
        'to'
    ];

    public function projects(): BelongsToMany
    {
        return $this->belongsToMany(Project::class, 'coming_work_projects');
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'coming_work_tasks');
    }

    public function employees(): BelongsToMany
    {
        return $this->belongsToMany(Employee::class,'coming_work_employees');
    }
}