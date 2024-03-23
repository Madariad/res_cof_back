<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RestaurantsOrCaffeController;
use App\Models\Restaurants_or_caffe;
use App\Models\Review;
use Illuminate\Support\Facades\Validator;


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


// Маршруты для ресторанов
Route::get('/restaurants', [RestaurantsOrCaffeController::class, 'index']);
Route::get('/restaurants/{id}', [RestaurantsOrCaffeController::class, 'show']);

Route::post('/restaurants/star/add', function (Request $request) {
    // $validatedData = $request->validate([
    //     'restaurant_id' => 'required|exists:restaurants_or_caffes,id',
    //     'rating' => 'required|integer|min:1|max:5',
    // ]);
    // // echo  Review::all();
   
    

    // if ($validatedData->fails()) {
    //     return response()->json(['errors' => $validatedData->errors()], Response::HTTP_UNPROCESSABLE_ENTITY);
    // }

    $review = new Review();
    $review->restaurants_or_caffe_id = $request->restaurant_id;
    $review->rating = $request->rating;
    $review->comment = $request->comment;
    // $review->created_at = now();
    $review->save();


    return response()->json(['message' => 'Review created successfully'], 200);
});

// Route::post('/restaurants', [RestaurantController::class, 'store']); // Создать новый ресторан
// Route::put('/restaurants/{id}', [RestaurantController::class, 'update']); // Обновить информацию о ресторане по id
// Route::delete('/restaurants/{id}', [RestaurantController::class, 'destroy']); // Удалить ресторан по id

