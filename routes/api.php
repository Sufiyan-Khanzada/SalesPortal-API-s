<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PassportController;
use App\Http\Controllers\RefererController;
use App\Http\Controllers\PricingController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\SalesController;
use App\Http\Controllers\CustomersController;





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

Route::get('allpricingcut/{id}', [RefererController::class, 'allPricing_after_Cuting']);





///Sales Routes////
Route::post('salesperson/register', [PassportController::class, 'salesregister']);
Route::post('salesperson/login', [PassportController::class, 'login']);
Route::get('salesperson/showsales', [PassportController::class, 'showallsales']);
Route::post('salesperson/updatesales/{id}', [PassportController::class, 'update_sales']);
Route::post('salesperson/salesref/{id}', [RefererController::class, 'check_ref_sale']);




/////Clients ////////////
Route::post('clients/register', [PassportController::class, 'Usersregister']);
Route::get('clients/showclients', [PassportController::class, 'showallclients']);
Route::post('clients/login', [PassportController::class, 'login']);
Route::post('clients/updatecustomer/{id}', [PassportController::class, 'UsersUpdate']);
Route::get('salesperson/show/{id}', [PassportController::class, 'show']);

Route::get('salesperson/showsales/{id}', [SalesController::class, 'show_single_sale_record']);

Route::post('clients/allpurchasings/{id}', [CustomersController::class, 'show_single_customer_record']);
Route::get('clients/all', [CustomersController::class, 'allCustomer']);

Route::get('clients/customer/{id}', [CustomersController::class, 'show_single_customer']);

///////////Purchase API's///////////////////
Route::post('addorder', [PurchaseController::class, 'add']);
Route::get('allorders', [PurchaseController::class, 'allPurchases']);
Route::get('user-orders/{id}', [PurchaseController::class, 'userPurchases']);
Route::get('seller-orders/{id}', [PurchaseController::class, 'sellerPurchases']);
Route::post('delete-order/{id}', [PurchaseController::class, 'destroy_Purchases']);
Route::post('update-order/{id}', [PurchaseController::class, 'update_Purchases']);






// put all api protected routes here
Route::middleware('auth:api')->group(function () {
    Route::get('user-detail', [PassportController::class, 'userDetail']);
    Route::post('logout', [PassportController::class, 'logout']);

    Route::get('salesperson/user-detail', [PassportController::class, 'userDetail']);
    Route::post('salesperson/logout', [PassportController::class, 'logout']);

    Route::get('clients/user-detail', [PassportController::class, 'userDetail']);
    Route::post('clients/logout', [PassportController::class, 'logout']);
});

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
