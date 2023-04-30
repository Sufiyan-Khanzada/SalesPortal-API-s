<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchases;

class CustomersController extends Controller
{
    //
     public function show_single_customer_record(Request $request , $id)
    {
         $pricing = Purchases::where('user_id',$id)->get();
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
                'Purchase' => $pricing
            ], 200);

      
    }

}
