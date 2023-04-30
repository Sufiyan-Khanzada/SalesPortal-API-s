<?php

namespace App\Http\Controllers;


use Validator;
use Illuminate\Http\Request;
use App\Models\Purchases;

class SalesController extends Controller
{
    //
     public function show_single_sale_record(Request $request , $id)
    {
         $pricing = Purchases::where('referby',$id)->get();
      // $ids = $request->input('ids', []); // via injected instance of Request
      // $items1 = items::whereIn('id', explode(',', $id))->get();
      // $items1 = items::whereIn('id', explode(',', $id->$request->get()));
        
        if ($pricing->isEmpty()){
            return response()->json([
                'success' => false,
                'message' => 'Purchasing Details Not Found'
            ], 404);
        }

        return response()->json([
                'success' => true,
                'message' => 'Purchasing Details Found',
                'Pricing' => $pricing
            ], 200);

      
    }
}
