<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

class Company extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'phone',
        'email',
        'www',
        'IC',
        'DIC',
        'subscriber',
        'supplier',
        'competition',
        'address',
        'city',
        'zip_code',
        'state',
        'country',
        'note'
    ];

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class);
    }

    public function project(): BelongsToMany
    {
        return $this->BelongsToMany(Project::class, 'project_companies');
    }

    public function contact(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class, 'contact_companies');
    }

    public function contacts(): HasMany
    {
        return $this->hasMany(Contact::class);
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'task_companies');
    }

    public function files(): BelongsToMany
    {
        return $this->belongsToMany(File::class,'file_companies');
    }

    public function attendances(): BelongsToMany
    {
        return $this->belongsToMany(Attendance::class,'company_attendances');
    }

    public function comingWorks(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'id','id');
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class,'company_users');
    }

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class,'company_categories');
    }
}
