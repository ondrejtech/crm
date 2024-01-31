<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'name'
    ];

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'company_categories');
    }

    public function contacts(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class , 'contact_categories');
    }

    public function projects(): BelongsToMany
    {
        return $this->belongsToMany(Project::class, 'project_categories');
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'task_categories');
    }

    public function comingWorks(): BelongsToMany
    {
        return $this->belongsToMany(ComingWork::class,'attendance_categories');
    }

    public function absences(): BelongsToMany
    {
        return $this->belongsToMany(Absence::class,'absence_categories');
    }

    public function files(): BelongsToMany
    {
        return $this->belongsToMany(File::class,'file_categories');
    }
}
