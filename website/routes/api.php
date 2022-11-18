<?php

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Uasoft\Badaso\Facades\Badaso;
use Uasoft\Badaso\Middleware\ApiRequest;
use Uasoft\Badaso\Middleware\BadasoAuthenticate;
use Uasoft\Badaso\Middleware\BadasoCheckPermissions;
use Uasoft\Badaso\Middleware\BadasoCheckPermissionsForCRUD;
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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['namespace' => 'App\Http\Controllers', 'as' => 'badaso.', 'middleware' => [ApiRequest::class]], function () {
    Route::group(['prefix' => 'v1'], function () {
        Route::group(['prefix' => 'custom'], function () {
            Route::get('/dashboard', 'CustomController@dashboard')->middleware(BadasoCheckPermissions::class.':custom_dashboard');
            Route::get('/browse', 'CustomController@browsePasien')->middleware(BadasoCheckPermissions::class.':custom_pasien_browse');
            Route::get('/search', 'CustomController@searchPasien')->middleware(BadasoCheckPermissions::class.':custom_pasien_search');
        });
    });
});
