<?php

use App\Http\Controllers\Component\GameController;
use App\Http\Controllers\Component\GameGenreController;
use App\Http\Controllers\Component\StudioDevController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::resource('games', GameController::class)->only([
    'index', 'store', 'show', 'update', 'destroy'
]);
Route::resource('developers', StudioDevController::class)->only([
    'index', 'store', 'show', 'update', 'destroy'
]);
Route::resource('genres', GameGenreController::class)->only([
    'index', 'store', 'show', 'update', 'destroy'
]);
