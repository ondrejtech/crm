<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $country = [
            ['state_id' => 1, 'name' => 'Hlavní město Praha'],
            ['state_id' => 1, 'name' => 'Středočeský kraj'],
            ['state_id' => 1, 'name' => 'Jihočeský kraj'],
            ['state_id' => 1, 'name' => 'Plzeňský kraj'],
            ['state_id' => 1, 'name' => 'Karlovarský kraj'],
            ['state_id' => 1, 'name' => 'Ústecký kraj'],
            ['state_id' => 1, 'name' => 'Liberecký kraj'],
            ['state_id' => 1, 'name' => 'Královéhradecký kraj'],
            ['state_id' => 1, 'name' => 'Pardubický kraj'],
            ['state_id' => 1, 'name' => 'Kraj Vysočina'],
            ['state_id' => 1, 'name' => 'Jihomoravský kraj'],
            ['state_id' => 1, 'name' => 'Olomoucký kraj'],
            ['state_id' => 1, 'name' => 'Zlínský kraj'],
            ['state_id' => 1, 'name' => 'Moravskoslezský kraj'],
        ];

        // Vložení dat do databáze
        DB::table('countries')->insert($country);
    }
}
