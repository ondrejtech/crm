<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Attendance extends Model
{
    use HasFactory;

    protected $fillable = [
        'subject',
        'date',
        'start',
        'end',
        'total',
        'note'
    ];

    protected $casts = [
        'date' => 'date',
        'start' => 'datetime',
        'end' => 'datetime'
    ];

    public static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            if ($model->{'start'} != null and $model->{'end'} != null) {
                $Minutes = $model->{'start'}->diffInMinutes($model->{'end'});
                $model->{'total'} = $model->{'total'} + $Minutes;
            }
        });
        static::updating(function ($model) {
            if ($model->{'start'} != null and $model->{'end'} != null) {
                $Minutes = $model->{'start'}->diffInMinutes($model->{'end'});
                $model->{'total'} = $model->{'total'} + $Minutes;
            }
        });
    }

    public function getHoursAttribute()
    {
        $minuten = $this->total;
        $uren = floor($minuten / 60); // The number of complete hours
        $resterendeMinuten = $minuten % 60; // The remaining minutes

        return sprintf('%02d:%02d', $uren, $resterendeMinuten);
    }

    public function companies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class,'attendance_company_relations');
    }

    public function projects(): BelongsToMany
    {
        return $this->belongsToMany(Project::class,'attendance_project_relations');
    }

    public function contacts(): BelongsToMany
    {
        return $this->belongsToMany(Contact::class,'attendance_contact_relations');
    }

    public function tasks(): BelongsToMany
    {
        return $this->belongsToMany(Task::class,'attendance_task_relations');
    }

    public function files(): BelongsToMany
    {
        return $this->belongsToMany(File::class,'attendance_file_relations');
    }

    public function employees(): BelongsToMany
    {
        return $this->belongsToMany(Employee::class,'attendance_employee_relations');
    }

    public function owner(): BelongsToMany
    {
        return $this->belongsToMany(User::class,'attendance_owner_relations');
    }
}
