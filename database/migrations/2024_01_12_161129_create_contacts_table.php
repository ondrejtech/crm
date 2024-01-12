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
        Schema::create('contacts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->nullable()->constrained()->cascadeOnDelete();
            $table->foreignId('department_id')->nullable()->constrained()->cascadeOnDelete();
            $table->string('full_name');
            $table->string('email')->unique();
            $table->boolean('newsletter')->default(0);

            //Phone numbers
            $table->integer('landline')->nullable();
            $table->integer('mobile');
            $table->integer('next_phone')->nullable();

            //Address

            $table->string('address');
            $table->string('city');
            $table->string('zip_code');
            $table->string('state');
            $table->string('country');

            //note
            $table->mediumText('note')->nullable();

            //Create and update time
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('contacts');
    }
};
