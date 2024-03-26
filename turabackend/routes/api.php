<?php

use App\Http\Controllers\JelentkezesController;
use App\Http\Controllers\TuraController;
use App\Http\Controllers\TuratipusController;
use App\Http\Controllers\TuravezetoController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth.basic')->group(function () {
    //bejelentkezett felhasználó láthatja
    Route::middleware(['admin'])->group(function () {
        //admin útvonalai itt lesznek, pl.
        Route::apiResource('/users', UserController::class);
    });

    Route::get('/turak', [TuraController::class, 'index']);
    Route::get('/turak/{tipus_id}', [TuraController::class, 'show']);
    Route::post('/turak', [TuraController::class, 'store']);
    Route::put('/turak/{id}', [TuraController::class, 'update']);
    Route::delete('/turak/{id}', [TuraController::class, 'destroy']);

    Route::get('/turavezetok', [TuravezetoController::class, 'index']);
    Route::get('/turavezetok/{id}', [TuravezetoController::class, 'show']);
    Route::post('/turavezetok', [TuravezetoController::class, 'store']);
    Route::put('/turavezetok/{id}', [TuravezetoController::class, 'update']);
    Route::delete('/turavezetok/{id}', [TuravezetoController::class, 'destroy']);

    Route::get('/turatipusok', [TuratipusController::class, 'index']);
    Route::get('/turatipusok/{id}', [TuratipusController::class, 'show']);
    Route::post('/turatipusok', [TuratipusController::class, 'store']);
    Route::put('/turatipusok/{id}', [TuratipusController::class, 'update']);
    Route::delete('/turatipusok/{id}', [TuratipusController::class, 'destroy']);

    Route::get('/jelentkezesek', [JelentkezesController::class, 'index']);
    Route::get('/jelentkezesek/{user_id}/{tura_id}', [JelentkezesController::class, 'show']);
    Route::post('/jelentkezesek', [JelentkezesController::class, 'store']);
    Route::put('/jelentkezesek/{id}', [JelentkezesController::class, 'update']);
    Route::delete('/jelentkezesek/{id}', [JelentkezesController::class, 'destroy']);

    Route::get('/users', [UserController::class, 'index']);
    Route::get('/users/{user_id}', [UserController::class, 'show']);
    Route::post('/users', [UserController::class, 'store']);
    Route::put('/users/{id}', [UserController::class, 'update']);
    Route::delete('/users/{id}', [UserController::class, 'destroy']);


    Route::get('/jelentkezesek/{user_id}', [JelentkezesController::class, 'userJelentkezesek']);
    Route::get('/indulotura', [TuraController::class, 'induloTura']);
    Route::get('/indulotura_b', [TuraController::class, 'induloTura_b']);
});
