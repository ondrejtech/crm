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
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->string('number');
            $table->foreignId('order_id')->constrained()->cascadeOnDelete();
            $table->string('order_number');
            $table->foreignId('company_id')->constrained();
            $table->foreignId('contact_id')->constrained();
            $table->string('status')->default('PAYMENT');
            $table->string('delivery_address');
            $table->string('delivery_city');
            $table->string('delivery_psc');
            $table->foreignId('delivery_country_id')->constrained('countries','id')->cascadeOnDelete();
            $table->foreignId('delivery_state_id')->constrained('states','id')->cascadeOnDelete();
            $table->foreignId('note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('invoices');
    }
};
