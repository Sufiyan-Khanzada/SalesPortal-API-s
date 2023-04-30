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
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
             $table->string('First_name')->nullable();
             $table->string('Last_name')->nullable();
             $table->string('Email')->nullable();
             $table->string('Paymode')->nullable();
             $table->string('Referid')->nullable();
             $table->string('Referby')->nullable();
             $table->string('Amount')->nullable();
             $table->string('Product_ids')->nullable();
             $table->string('Total')->nullable();


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchases');
    }
};
