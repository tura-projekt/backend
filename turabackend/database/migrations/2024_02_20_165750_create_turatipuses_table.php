<?php

use App\Models\Turatipus;
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
        Schema::create('turatipuses', function (Blueprint $table) {
            $table->id('tipus_id');
            $table->string('turanev');
            $table->string('tajegyseg');
            $table->string('nehezseg');
            $table->integer('tavolsag');
            $table->integer('szintkulonbseg');
            $table->boolean('kerekpar');
            $table->string('indulashelye');
            $table->string('erkezeshelye');
            $table->string('leiras');
            $table->timestamps();
        });

        Turatipus::create([
            'tipus_id' => 1,
            'turanev' => "Lankás",
            'tajegyseg' => "Balaton felvidék",
            'nehezseg' => "közepes",
            'tavolsag' => "20",
            'szintkulonbseg' => "500",
            'kerekpar' => "1",
            'indulashelye' => "Balatonszemes",
            'erkezeshelye' => "Tihany",
            'leiras' => "üres",
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('turatipuses');
    }
};
