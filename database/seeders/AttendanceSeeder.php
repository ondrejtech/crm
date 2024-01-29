<?php

namespace Database\Seeders;

use App\Models\ComingWorkType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AttendanceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ComingWorkType::create(['name' => 'Work on Project']);
        ComingWorkType::create(['name' => 'Communication']);
        ComingWorkType::create(['name' => 'Management']);
        ComingWorkType::create(['name' => 'Marketing']);
        ComingWorkType::create(['name' => 'Business']);
        ComingWorkType::create(['name' => 'Meeting']);
        ComingWorkType::create(['name' => 'Others']);
    }
}
