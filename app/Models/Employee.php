<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        'department_id',
        'full_name',
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
        return $this->BelongsTo(Department::class);
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'employee_tasks');
    }

    public function coming_works(): BelongsToMany
    {
        return $this->belongsToMany(ComingWork::class, 'coming_work_employees');
    }

    public function absences(): BelongsToMany
    {
        return $this->belongsToMany(Absence::class, 'absence_employees');
    }
}
