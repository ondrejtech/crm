<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\ComingWorkType;
use App\Models\Department;
use App\Models\Product;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        $this->call([
            AbsenceSeeder::class,
            CompanySeeder::class,
            ContactSeeder::class,
            DepartmentSeeder::class,
            ProjectTypeSeeder::class,
            EmployeeSeeders::class,
            AttendanceSeeder::class,
            FileTypeSeeder::class,
            CategorySeeder::class,
            ParentCategorySeeder::class,
            ProductCategorySeeder::class,
            ProductSeeder::class,
            ProducerSeeder::class,
            CountrySeeder::class,
            StateSeeder::class,
        ]);
    }
}
