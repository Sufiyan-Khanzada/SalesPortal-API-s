<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customers extends Model
{
    use HasFactory;
    //
    protected $fillable = [
        'firstname',
        'lastname',
        'email',
        'DOB',
        'gender',
        'referby',
        'referid',
        'profilepic',

    ];
}
