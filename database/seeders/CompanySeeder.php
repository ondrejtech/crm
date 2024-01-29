<?php

namespace Database\Seeders;

use App\Models\Company;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Company::create([
            'name' => 'Ondrej Zelina',
            'phone' => '732127410',
            'email' => 'ondrej.web@gmail.com',
            'www' => 'binapi.tech',
            'ic' => '02453681',
            'dic' => '',
            'address' => 'Horni namesti 3',
            'city' => 'Vsetin',
            'zip_code' => '75603',
            'state' => 'Zlinsky kraj',
            'country' => 'Czech republic'
        ]);

        Company::create([
            'name' => 'Millenium international s.r.o.',
            'phone' => '732127410',
            'email' => 'ondrej.web@gmail.com',
            'www' => 'binapi.tech',
            'ic' => '02239221',
            'dic' => 'CZ02239221',
            'address' => 'Kosicka 63/30',
            'city' => 'Praha',
            'zip_code' => '10100',
            'state' => 'Hlavni mesto Praha',
            'country' => 'Czech republic'
        ]);

        Company::create([
            'name' => 'Nabah Solutions s.r.o.',
            'phone' => ' 605776170',
            'email' => 'ondrej.web@gmail.com',
            'www' => 'binapi.tech',
            'ic' => '05832144',
            'dic' => 'CZ05832144',
            'address' => 'Horova 1298/5A',
            'city' => 'Olomouc',
            'zip_code' => '77900',
            'state' => 'Olomoucky kraj',
            'country' => 'Czech republic'
        ]);
    }
}
