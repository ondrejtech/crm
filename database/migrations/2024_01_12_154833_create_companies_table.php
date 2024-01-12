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
        Schema::create('companies', function (Blueprint $table) {
	    $table->id();
	    $table->string('name');
            $table->string('phone');
            $table->string('email')->unique();
            $table->string('www')->nullable();
            $table->string('IC')->unique();
            $table->string('DIC')->nullable();
            $table->boolean('subscriber')->default(0);
            $table->boolean('supplier')->default(0);
            $table->boolean('competition')->default(0);

            //Address

            $table->string('address');
            $table->string('city')->nullable();
            $table->string('zip_code')->nullable();
            $table->string('state')->nullable();
            $table->string('country')->nullable();

            //create note
            $table->mediumText('note')->nullable();

            //create and update time
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('companies');
    }
};
