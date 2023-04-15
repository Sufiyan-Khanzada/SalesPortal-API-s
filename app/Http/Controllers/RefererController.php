<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Referers;
use Validator;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\TokenRepository;
use Laravel\Passport\RefreshTokenRepository;

class RefererController extends Controller
{
    
      public function add(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'Refer_name' => 'required|string',
            'Refer_value' => 'required|string',
            'Refer_status' => 'required|string',
  ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }  
            
            $refers = new Referers();
            $refers->Refer_name=$request->Refer_name;
            $refers->Refer_value=$request->Refer_value;
            $refers->Refer_status=$request->Refer_status;
            $refers->save();


         
        return response()->json([
            'success' => true,
            'message' => 'Referer Added Successfully Done'
        ], 200);
    }

      public function allrefers()
    {
        $refers = Referers::all();
        if($refers->isEmpty()){
        return response()->json([
            'success' => true,
            'message' => 'Refers Not Found Done.',
            // 'data' => $Items

        ], 404);        
        }
        return response()->json([
            'success' => true,
            'message' => 'Refers Fetch Successfully Done.',
            'data' => $refers

        ], 200);
        
    }

        public function update_ref(Request $request , $id)
    {

            $refers = new Referers();
            $refers = Referers::find($id);
            $refers->Refer_name=$request->Refer_name;
            $refers->Refer_value=$request->Refer_value;
            $refers->Refer_status=$request->Refer_status;
             $refers->save();

            return response()->json([
            'success' => true,
            'message' => 'Referer Number -> '.$id.' ->Details Updated Successfully.'
        ], 200);

            
         } 

        public function destroy_ref($id)
          {
        $delete_refers = Referers::find($id);
    
        $delete_refers->delete();
 
        return response()->json([
            'success' => true,
            'message' => 'Referer Number->'.$id.'->Remove Successfully Done.'
        ], 200);
    

        }

         public function show_single_ref(Request $request , $id)
    {
         $refers = Referers::where('id',$id)->get();
      // $ids = $request->input('ids', []); // via injected instance of Request
      // $items1 = items::whereIn('id', explode(',', $id))->get();
      // $items1 = items::whereIn('id', explode(',', $id->$request->get()));
        
        if ($refers->isEmpty()){
            return response()->json([
                'success' => false,
                'message' => 'Referers Details Not Found'
            ], 404);
        }

        return response()->json([
                'success' => true,
                'message' => 'Referers Details Found',
                'Referer' => $refers
            ], 200);

      
    }


   public function check_ref_sale(Request $request , $id)
    {
         $refers = Referers::where('Refer_name',$id)
                 ->count();
      // $ids = $request->input('ids', []); // via injected instance of Request
      // $items1 = items::whereIn('id', explode(',', $id))->get();
      // $items1 = items::whereIn('id', explode(',', $id->$request->get()));
        
        if ($refers==null){
            return response()->json([
                'success' => false,
                'message' => 'Referers Sales Details Not Found'
            ], 404);
        }

        return response()->json([
                'success' => true,
                'message' => 'Referers Sales Details Found',
                'Referer' => $refers
            ], 200);

      
    }



    


}
