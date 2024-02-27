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
            $table->string('Code');
            $table->string('Name');
            $table->string('YourPrice');
            $table->integer('YourPriceWithFees');
            $table->string('CommodityCode');
            $table->integer('GarbageFee');
            $table->integer('AuthorFee');
            $table->string('ValuePack');
            $table->string('ValuePackQty');
            $table->string('Warranty');
            $table->string('CommodityName');
            $table->integer('DealerPrice');
            $table->integer('EndUserPrice');
            $table->string('Vat');
            $table->string('PartNumber');
            $table->string('OnStock');
            $table->string('OnStockText');
            $table->string('Status');
            $table->string('ProducerName');
            $table->string('RateOfDutyCode');
            $table->string('EANCode');
            $table->string('NameB2C');
            $table->string('MultipleQuantity');
            $table->string('IsTop');
            $table->string('InfoCode');
            $table->string('IndexSort1');
            $table->string('IndexCode1');
            $table->string('IndexOrder1');
            $table->string('IndexImplicit1');
            $table->string('IndexSort2');
            $table->string('IndexCode2');
            $table->string('IndexOrder2');
            $table->string('IndexImplicit2');
            $table->string('WarrantyTerm');
            $table->string('WarrantyUnit');
            $table->string('PartNumber2');
            $table->string('DateAvailible');
            $table->string('DealerPrice1');
            $table->string('Unit');
            $table->string('OnStockCount');
            $table->string('ImgCount');
            $table->string('ImgLastChanged');
            $table->string('ProducerCode')->constrained()->cascadeOnDelete();
            $table->foreignId('product_category_id')->constrained()->cascadeOnDelete();
            $table->string('B2C');
            $table->string('B2FPrice');
            $table->string('RCStatus');
            $table->string('RCCode');
            $table->string('IsPremium');
            $table->string('ExtInfoCodes');
            $table->string('EndUserPriceDPH');
            $table->integer('Discount')->default(30);
            $table->string('PriceDiscount');
            $table->mediumText('DescriptionShort');
            $table->mediumText('Description');
            $table->mediumText('SmallImage')->nullable();
            $table->mediumText('BigImage')->nullable();
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
