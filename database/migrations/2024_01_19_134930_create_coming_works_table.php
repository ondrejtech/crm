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
        Schema::create('coming_works', function (Blueprint $table) {
            $table->id();
            $table->string('subject');
            $table->date('date');
            $table->time('from');
            $table->time('to');
            $table->foreignId('user_id')->nullable()->constrained()->cascadeOnDelete();
            $table->mediumText('note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('coming_works');
    }
};
