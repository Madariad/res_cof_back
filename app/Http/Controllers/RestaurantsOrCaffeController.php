<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Restaurants_or_caffe;
use App\Models\Image;

class RestaurantsOrCaffeController extends Controller
{
    public function index()
    {

        // foreach (Restaurants_or_caffe::all() as $key => $value) {
        //    return ;
        // }
  
        // return  Restaurants_or_caffe::all();
        // return response()->json(['imageUrl' => asset('storage/' . $image->path)], 200);


        $restaurantsAndCafes = Restaurants_or_caffe::all();

       $data = [];

    foreach ($restaurantsAndCafes as $restaurantOrCaffe) {
        $reviews = $restaurantOrCaffe->reviews;
        $images = $restaurantOrCaffe->images;
        $rating = 0;
        

        $restaurantOrCaffeData = [
            'id' => $restaurantOrCaffe->id,
            'name' => $restaurantOrCaffe->name,
            'price' => $restaurantOrCaffe->price,
            'type' =>  $restaurantOrCaffe->type,
            // 'location' => $restaurantOrCaffe->location,

            'reviews' => $reviews->map(function ($review) use (&$rating) {
                $rating +=  $review->rating;
                return [

                    'rating' =>  $review->rating,
                    'comment' => $review->comment,
                ];
            }),

            'about' =>  $restaurantOrCaffe->about,

            'rating' => ceil($rating / 5),

            'images' => $images->map(function ($image) {
                
                return [
                    'path' =>  $image->path,
                
                ];
            }),
        ];

        $data[] = $restaurantOrCaffeData;
    }

    return response()->json($data);
    }

    public function show($id)
    {

        $restaurantOrCaffe = Restaurants_or_caffe::find($id);
        $reviews = $restaurantOrCaffe->reviews;
        $images = $restaurantOrCaffe->images;
        $rating = 0;

        $restaurantOrCaffeData = [
            'id' => $restaurantOrCaffe->id,
            'name' => $restaurantOrCaffe->name,
            'price' => $restaurantOrCaffe->price,
            'type' =>  $restaurantOrCaffe->type,
            // 'location' => $restaurantOrCaffe->location,


            'reviews' => $reviews->map(function ($review) use (&$rating) {
                $rating +=  $review->rating;
                return [

                    'rating' =>  $review->rating,
                    'comment' => $review->comment,
                    
                ];
            }),
            'rating' => ceil($rating / 5),
            'about' =>  $restaurantOrCaffe->about,

            'images' => $images->map(function ($image) {
                return [
                    'path' =>  $image->path,
                    
                ];
            }),
        ];

        $data[] = $restaurantOrCaffeData;

        return response()->json($data);
    }

    // public function store(Request $request)
    // {
    //     return Restaurants_and_cafe::create($request->all());
    // }

    // public function update(Request $request, $id)
    // {
    //     $Restaurants_and_cafe = Restaurants_and_cafe::findOrFail($id);
    //     $Restaurants_and_cafe->update($request->all());

    //     return $Restaurants_and_cafe;
    // }

    // public function destroy($id)
    // {
    //     $Restaurants_and_cafe = Restaurants_and_cafe::findOrFail($id);
    //     $Restaurants_and_cafe->delete();

    //     return 204; // No content
    // }
}
