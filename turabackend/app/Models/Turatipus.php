<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Turatipus extends Model
{
    use HasFactory;

    protected  $primaryKey = 'tipus';
    protected $fillable = [
        'turanev',
        'tajegyseg',
        'nehezseg',
        'tavolsag',
        'szintkulonbseg',
        'kerekpar',
        'indulashelye',
        'erkezeshelye',
        'leiras',
    ];
}
