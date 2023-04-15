<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pricings extends Model
{
    use HasFactory;

    protected $fillable = [
        'Plan_title',
        'Plan_tag_line',
        'Plan_price',
        'Plan_description',
        'image',
        
    ];
}
