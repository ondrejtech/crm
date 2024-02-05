<?php

namespace Database\Seeders;

use App\Models\AttendanceType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AttendanceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        AttendanceType::create(['name' => 'Work on Project']);
        AttendanceType::create(['name' => 'Communication']);
        AttendanceType::create(['name' => 'Management']);
        AttendanceType::create(['name' => 'Marketing']);
        AttendanceType::create(['name' => 'Business']);
        AttendanceType::create(['name' => 'Meeting']);
        AttendanceType::create(['name' => 'Others']);
    }
}
