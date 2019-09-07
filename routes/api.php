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
// Route::group([
//     'middleware' => 'api'
// ], function () {
//     Route::get('login', 'Api\AuthController@login');
//     Route::get('logout', 'Api\AuthController@logout');
//     Route::get('user', 'Api\AuthController@user');
// });

Route::group([
    'prefix' => 'auth'
], function () {
    Route::post('login', 'Api\AuthController@login')->name('login');

    // Route::post('register', 'Api\AuthController@register');
    Route::group([
      'middleware' => 'auth:api'
    ], function() {
        Route::get('logout', 'Api\AuthController@logout');
        Route::get('user', 'Api\AuthController@user');
        Route::post('/student/scan', 'Api\StudentController@scan');
        Route::post('/drivers/get-available-buses', 'Api\DriverController@getAvailableBuses');
        Route::post('/drivers/engage-bus', 'Api\DriverController@engageBus');   
        Route::post('/drivers/disengage-bus', 'Api\DriverController@disengageBus');
        Route::post("/register-notification","Api\StudentController@addParentsNotification");
        Route::post("/get-student-attendance","Api\StudentController@getStudentAttendance");
    });
});
