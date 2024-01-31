<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use BezhanSalleh\FilamentShield\Traits\HasPanelShield;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, HasPanelShield;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function projects(): BelongsToMany
    {
        return $this->belongsToMany(Project::class,'project_users');
    }

    public function comingWorks(): BelongsTo
    {
        return $this->belongsTo(ComingWork::class, 'name');
    }

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'company_users');
    }

    public function contacts(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class,'contact_users');
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'task_users');
    }

    public function absences(): BelongsToMany
    {
        return $this->belongsToMany(Absence::class,'absence_users');
    }

    public function files(): BelongsToMany
    {
        return $this->belongsToMany(File::class,'file_users');
    }
}
