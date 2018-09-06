<?php

use Illuminate\Http\Request;

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

Route::post('auth', 'AuthController@authenticate');

Route::middleware('auth:api')->group(function () {
    Route::resource('product', 'ProductController');
    Route::resource('category', 'CategoryController');
    Route::resource('user', 'UserController');
});