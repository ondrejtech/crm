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

    public function projects(): BelongsToMany
    {
        return $this->belongsToMany(Project::class,'task_projects');
    }

    public function contacts(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class,'task_contacts');
    }

    public function employees(): BelongsToMany
    {
        return $this->belongsToMany(Employee::class,'employee_tasks');
    }

    public function coming_works(): BelongsToMany
    {
        return $this->belongsToMany(ComingWork::class, 'coming_work_tasks');
    }

    public function files(): BelongsToMany
    {
        return $this->belongsToMany(File::class,'file_tasks');
    }
}
