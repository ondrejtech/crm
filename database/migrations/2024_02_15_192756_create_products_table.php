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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('ProId');
            $table->string('Code')->nullable();
            $table->string('Name');
            $table->integer('GarbageFee')->nullable();
            $table->integer('AuthorFee')->nullable();
            $table->integer('YourPrice');
            $table->integer('YourPriceWithFees');
            $table->integer('EndUserPrice');
            $table->string('Warranty')->nullable();
            $table->string('PartNumber')->nullable();
            $table->string('OnStockText');
            $table->string('Unit');
            $table->string('Status')->nullable();
            $table->string('EANCode')->nullable();
            $table->foreignId('producer_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_category_id')->constrained()->cascadeOnDelete();
            $table->foreignId('commodity_id')->constrained()->cascadeOnDelete();
            $table->string('IsPremium')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('products');
    }
};
