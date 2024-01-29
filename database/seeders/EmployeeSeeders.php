<?php

namespace Database\Seeders;

use App\Models\Employee;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class EmployeeSeeders extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Employee::create([
            'full_name' => 'Ondrej Zelina',
            'email' => 'ondrej.web@gmail.com',
            'mobile' => '732127410',
            'address' => 'Halenkov 655',
            'city' => 'Halenkov',
            'zip_code' => '75603',
            'state' => 'Zlinsky kraj',
            'country' => 'Czech republic'
        ]);

        Employee::create([
            'full_name' => 'Pavel Burda',
            'email' => 'paul@example.com',
            'mobile' => ' 605776170',
            'address' => 'Schweitzerova 798/99a',
            'city' => 'Olomouc',
            'zip_code' => '77900',
            'state' => 'Olomocky kraj',
            'country' => 'Czech republic'
        ]);

        Employee::create([
            'full_name' => 'Aneta Kabelikova',
            'email' => 'kabelikova@example.com',
            'mobile' => ' 605776170',
            'address' => 'Schweitzerova 798/99a',
            'city' => 'Olomouc',
            'zip_code' => '77900',
            'state' => 'Olomocky kraj',
            'country' => 'Czech republic'
        ]);
    }
}
