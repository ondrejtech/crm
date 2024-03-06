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
            $table->foreignId('order_id')->constrained();
            $table->foreignId('company_id')->constrained();
            $table->foreignId('contact_id')->constrained();
            $table->string('status')->default('PAYMENT');
            $table->string('delivery_address');
            $table->string('delivery_city');
            $table->string('delivery_psc');
            $table->string('delivery_state');
            $table->string('delivery_country');
            $table->foreignId('note')->nullable()->constrained();
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
