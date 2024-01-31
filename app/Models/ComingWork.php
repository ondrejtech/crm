<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class ComingWork extends Model
{
    use HasFactory;

    protected $fillable = [
        'subject',
        'date',
        'from',
        'to'
    ];

    public function types(): BelongsToMany
    {
        return $this->belongsToMany(ComingWorkType::class,'attendance_attendance_types');
    }

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

    public function files(): BelongsToMany
    {
        return $this->belongsToMany(File::class,'file_attendances');
    }

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'company_attendances');
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'attendance_users');
    }

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class,'attendance_categories');
    }
}
