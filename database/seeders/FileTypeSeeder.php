<?php

namespace Database\Seeders;

use App\Models\FileType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FileTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        FileType::create(['name' => 'Proposal']);
        FileType::create(['name' => 'RFI']);
        FileType::create(['name' => 'Contract']);
        FileType::create(['name' => 'Specification']);
        FileType::create(['name' => 'Acceptance Protocol']);
        FileType::create(['name' => 'Invoice Issued']);
        FileType::create(['name' => 'Invoice Received']);
        FileType::create(['name' => 'Meeting Minutes']);
        FileType::create(['name' => 'Complaint Protocol']);
        FileType::create(['name' => 'Others']);
    }
}
