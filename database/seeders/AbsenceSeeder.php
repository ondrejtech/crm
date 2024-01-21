<?php

namespace Database\Seeders;

use App\Models\AbsenceType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AbsenceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    protected $absenceType = [
        [
            'name' => 'Paid Vacation'
        ],
        [
            'name' => 'Compensatory Time Off'
        ],
        [
            'name' => 'Sickness'
        ],
        [
            'name' => "Doctor's Visit"
        ],
        [
            'name' => 'Home Office'
        ],
        [
            'name' => 'Sick Day'
        ],
        [
            'name' => 'Maternity / Paternity Leave'
        ],
        [
            'name' => 'Approved Absence'
        ],
        [
            'name' => 'Disapproved Absence'
        ],
        [
            'name' => 'Treatment of a Family Member'
        ],
    ];

    public function run(): void
    {
        foreach($this->absenceType as $item){
            AbsenceType::create($item);
        }
    }
}
