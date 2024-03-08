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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('number');
            $table->foreignId('company_id')->nullable()->constrained();
            $table->foreignId('contact_id')->constrained();
            $table->string('status');
            $table->string('delivery_address');
            $table->string('delivery_city');
            $table->string('delivery_psc');
            $table->foreignId('delivery_country_id')->constrained('countries','id')->cascadeOnDelete();
            $table->foreignId('delivery_state_id')->constrained('states','id')->cascadeOnDelete();
            $table->mediumText('note')->nullable();
            $table->timestamps();
        });

        Schema::create('order_item', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->integer('quantity');
            $table->integer('unit_price');
            $table->integer('total_price')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('orders');
        Schema::dropIfExists('order_item');
    }
};
