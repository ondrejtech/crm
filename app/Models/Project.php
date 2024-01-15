<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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
        'note'
    ];

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class);
    }

    public function contact(): BelongsTo
    {
        return $this->belongsTo(Contact::class);
    }

    public function project_type(): BelongsTo
    {
        return $this->belongsTo(ProjectType::class);
    }
}
