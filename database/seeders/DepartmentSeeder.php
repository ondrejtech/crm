<?php

namespace Database\Seeders;

use App\Models\Department;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DepartmentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Department::create(['name' => 'Management of the company']);
        Department::create(['name' => 'Project Office']);
        Department::create(['name' => 'Quality and audit']);
        Department::create(['name' => 'Management staff']);
        Department::create(['name' => 'Store']);
        Department::create(['name' => 'IT operation and development']);
        Department::create(['name' => 'IT Security']);
        Department::create(['name' => 'Administration']);
        Department::create(['name' => 'HR']);
        Department::create(['name' => 'Legal Department']);
        Department::create(['name' => 'Finance']);
        Department::create(['name' => 'Accounting']);
    }
}
