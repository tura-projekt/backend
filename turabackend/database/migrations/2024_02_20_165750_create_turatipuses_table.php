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

        /*Turatipus::create([
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
        ]); */
        Turatipus::create([
            'tipus_id' => 1,
            'turanev' => "Nagybörzsönyi_kör",
            'tajegyseg' => "Börzsöny",
            'nehezseg' => "nehéz",
            'tavolsag' => "51",
            'szintkulonbseg' => "900",
            'kerekpar' => "1",
            'indulashelye' => "Szob",
            'erkezeshelye' => "Szob",
            'leiras' => "Szob-Ipolynádasd-Letkés-Ipolytölgyes-Nagybörzsöny--Farkas-völgy--Nagyírtás-Kisinóczi th.-Kóspallag-Márianosztra-Szob",
        ]); 
        
        Turatipus::create([
            'tipus_id' => 2,
            'turanev' => "Pilis_kör",
            'tajegyseg' => "Pilis",
            'nehezseg' => "nehéz",
            'tavolsag' => "42",
            'szintkulonbseg' => "800",
            'kerekpar' => "1",
            'indulashelye' => "Dorog",
            'erkezeshelye' => "Dorog",
            'leiras' => "Dorog-Kesztölc-Klastrompuszta-PilisSzántó-Pilisszentkereszt--Két-bükkfa-nyereg--Pilisszentlélek--Esztergom-Kertváros--Dorog",
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
