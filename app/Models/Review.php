<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;

    public function restaurantsOrCaffe()
    {
        return $this->belongsTo(Restaurants_or_caffe::class, 'restaurants_or_caffe_id ');
    }

}
