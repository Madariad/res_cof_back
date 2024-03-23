<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    protected $fillable = ['path'];

    public function restaurantOrCaffe()
    {
        return $this->belongsTo(Restaurants_or_caffe::class, 'restaurant_or_caffe_id');
    }


   
}
