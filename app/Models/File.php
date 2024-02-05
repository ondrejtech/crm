<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class File extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'priority',
        'document'
    ];

    protected $casts = [
        'document' => 'array',
    ];

    public function projects(): BelongsToMany
    {
        return $this->belongsToMany(Project::class,'file_projects');
    }

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'file_companies');
    }

    public function contacts(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class,'file_contacts');
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class, 'file_tasks');
    }

    public function attendances(): BelongsToMany
    {
        return $this->belongsToMany(Attendance::class,'file_attendances');
    }

    public function absences(): BelongsToMany
    {
        return $this->belongsToMany(Absence::class,'file_absences');
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class,'file_users');
    }

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class,'file_categories');
    }
}
