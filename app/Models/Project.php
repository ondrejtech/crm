<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'company_id',
        'contact_id',
        'project_types_id',
        'start_project',
        'planned_project_end',
        'end_project',
        'finish_price',
        'note',
        'employee_id'
    ];

    public function company(): BelongsToMany
    {
        return $this->belongsToMany(Company::class, 'project_companies');
    }

    public function contact(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class, 'project_contacts');
    }

    public function project_types(): BelongsTo
    {
        return $this->belongsTo(ProjectType::class);
    }

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class);
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'task_projects');
    }

    public function coming_works(): BelongsToMany
    {
        return $this->belongsToMany(ComingWork::class,'coming_work_projects');
    }
}
