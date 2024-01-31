<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Category::create(['name' => 'Security of object']);
        Category::create(['name' => 'Security of person']);
        Category::create(['name' => 'Security and transport of valuables']);
        Category::create(['name' => 'PHP project']);
    }
}
