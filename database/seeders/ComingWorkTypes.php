<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\ComingWorkType;

class ComingWorkTypes extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ComingWorkType::create(['name' => 'Work on the project',]);
//        ComingWorkType::create(['name' => 'Communication',]);
//        ComingWorkType::create(['name' => 'Management',]);
//        ComingWorkType::create(['name' => 'Marketing',]);
//        ComingWorkType::create(['name' => 'Schop',]);
//        ComingWorkType::create(['name' => 'meeting',]);
//        ComingWorkType::create(['name' => 'Others']);






//        dd($data);

    }
}
