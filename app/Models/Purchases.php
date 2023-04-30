<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchases extends Model
{
    use HasFactory;

 protected $fillable = [
        'First_name',
        'Last_name',
        'Email',
        'Paymode',
        'Referid',
        'Referby',
        'Amount',
        'Product_ids',
        'Total',
        'Remaining_Amount',
    ];
}
