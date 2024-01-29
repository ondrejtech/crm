<?php

namespace Database\Seeders;

use App\Models\Contact;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ContactSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Contact::create([
            'full_name' => 'Ondrej Zelina',
            'email' => 'ondrej.web@gmail.com',
            'mobile' => '732127410',
            'address' => 'Halenkov 655',
            'city' => 'Halenkov',
            'zip_code' => '75603',
            'state' => 'Zlinsky kraj',
            'country' => 'Czech republic'
        ]);

        Contact::create([
            'full_name' => 'Lukas Haban',
            'email' => 'info@nabah.cz',
            'mobile' => ' 605776170',
            'address' => 'Schweitzerova 798/99a',
            'city' => 'Olomouc',
            'zip_code' => '77900',
            'state' => 'Olomocky kraj',
            'country' => 'Czech republic'
        ]);

        Contact::create([
            'full_name' => 'Aneta Kabelikova',
            'email' => 'kabelikova@nabah.cz',
            'mobile' => ' 605776170',
            'address' => 'Schweitzerova 798/99a',
            'city' => 'Olomouc',
            'zip_code' => '77900',
            'state' => 'Olomocky kraj',
            'country' => 'Czech republic'
        ]);
    }
}
