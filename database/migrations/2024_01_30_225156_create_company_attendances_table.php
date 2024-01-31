<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('company_attendances', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained('companies', 'id')->cascadeOnDelete();
            $table->foreignId('coming_work_id')->constrained('coming_works','id')->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('company_attendances');
    }
};
