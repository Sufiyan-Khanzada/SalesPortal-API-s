<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchases;


class PurhcaseController extends Controller
{
    //
      public function allPurchases()
    {
        $order = Purchases::all();
        if($order->isEmpty()){
        return response()->json([
            'success' => true,
            'message' => 'Purchases Not Found Done.',
            // 'data' => $Items

        ], 404);        
        }
        return response()->json([
            'success' => true,
            'message' => 'Purchases Fetch Successfully Done.',
            'data' => $order

        ], 200);
        
    }



    public function update_Purchases(Request $request , $id)
    {

            $order = new Purchases();
            $order = Purchases::find($id);
            $order->First_name=$request->First_name;
            $order->Last_name=$request->Last_name;
            $order->Email=$request->Email;
            $order->Paymode=$request->Paymode;
            $order->referid=$request->referid;
            $order->referby=$request->referby;
            $order->amount=$request->amount;
            $ids=$request->Product_ids; 
            $string = implode(",", $request->Product_ids); 
            // $result = explode(",", $string); 
            $order->Product_ids=$string; 
            $order->Total=$request->Total;
            $order->save();


            
            
            return response()->json([
            'success' => true,
            'message' => 'Order Number -> '.$id.' ->Details Updated Successfully.'
        ], 200);

            
         } 



      public function add(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'First_name' => 'required|string|min:4',
            'Last_name' => 'required|string',
            'Email' => 'required|email',
            'Paymode' => 'required|string',
            'referid' => 'required|string',
            'referby' => 'required|string',
            'amount' => 'required|string',
            'Product_ids' => 'array|required',
           

    ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }  
            
            $order = new Purchases();
            $order->First_name=$request->First_name;
            $order->Last_name=$request->Last_name;
            $order->Email=$request->Email;
            $order->Paymode=$request->Paymode;
            $order->referid=$request->referid;
            $order->referby=$request->referby;
            $order->amount=$request->amount;
            $ids=$request->Product_ids; 

            $string = implode(",", $request->Product_ids); 
            // $result = explode(",", $string); 
            $order->Product_ids=$string; 
            $order->save();


         
        return response()->json([
            'success' => true,
            'message' => 'Items Added to Cart'
        ], 200);
    }




 public function destroy_order($id)
          {
        $delete_pro = Purchases::find($id);
    
        $delete_pro->delete();
 
        return response()->json([
            'success' => true,
            'message' => 'Order Number->'.$id.'->Remove Successfully Done.'
        ], 200);
    

}
}
