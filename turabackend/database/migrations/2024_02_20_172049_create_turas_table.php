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
        Schema::create('turas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('tipus')->references('tipus')->on('turatipuses');
            $table->date('idopont');
            $table->integer('turavezeto');
            $table->integer('ar'); 
            $table->integer('min_letszam'); 
            $table->integer('max_letszam');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('turas');
    }
};
