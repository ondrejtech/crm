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
        'type',
        'date',
        'from',
        'to'
    ];

    public function coming_work_types(): BelongsToMany
    {
        return $this->belongsToMany(AttendanceType::class, 'coming_attendance_types');
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class, 'task_coming_works');
    }

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class, 'coming_work_companies');
    }
}
