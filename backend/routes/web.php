<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RosterController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/get/students', [RosterController::class, 'get_students']);
//used GET instead of POST to not waste time with CSRF
Route::get('/save/roster', [RosterController::class, 'save_roster']);
