<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

class Contact extends Model
{
    use HasFactory;

    protected $fillable = [
        'company_id',
        'department_id',
        'full_name',
        'company',
        'department',
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
        return $this->belongsTo(Department::class);
    }

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'contact_companies');
    }

    public function project(): BelongsToMany
    {
        return $this->belongsToMany(Project::class,'project_contacts');
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'task_contacts');
    }

    public function files(): BelongsToMany
    {
        return $this->belongsToMany(File::class,'file_contacts');
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class,'contact_users');
    }

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class,'contact_categories');
    }
}
