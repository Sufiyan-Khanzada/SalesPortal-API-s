<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PassportController;
use App\Http\Controllers\RefererController;
use App\Http\Controllers\PricingController;


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

Route::post('register', [PassportController::class, 'register']);
Route::post('login', [PassportController::class, 'login']);
Route::get('showadmin', [PassportController::class, 'showall']);
Route::post('updateadmin/{id}', [PassportController::class, 'update_admin']);

///Referers Routes///////
Route::get('allref', [RefererController::class, 'allrefers']);
Route::post('addref', [RefererController::class, 'add']);
Route::post('updateref/{id}', [RefererController::class, 'update_ref']);
Route::post('deleteref/{id}', [RefererController::class, 'destroy_ref']);
Route::get('singleref/{id}', [RefererController::class, 'show_single_ref']);

///Pricing Routes///////
Route::get('allpricing', [PricingController::class, 'allPricing']);
Route::post('addpricing', [PricingController::class, 'addPricing']);
Route::post('updatepricing/{id}', [PricingController::class, 'update_pricing']);
Route::post('deletepricing/{id}', [PricingController::class, 'destroy_pricing']);
Route::get('singlepricing/{id}', [PricingController::class, 'show_single_pricing']);


///Sales Routes////
Route::post('salesperson/register', [PassportController::class, 'salesregister']);
Route::post('salesperson/login', [PassportController::class, 'login']);
Route::get('salesperson/showsales', [PassportController::class, 'showallsales']);
Route::post('salesperson/updatesales/{id}', [PassportController::class, 'update_sales']);




// put all api protected routes here
Route::middleware('auth:api')->group(function () {
    Route::post('user-detail', [PassportController::class, 'userDetail']);
    Route::post('logout', [PassportController::class, 'logout']);

     Route::post('salesperson/user-detail', [PassportController::class, 'userDetail']);
    Route::post('salesperson/logout', [PassportController::class, 'logout']);
});

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
