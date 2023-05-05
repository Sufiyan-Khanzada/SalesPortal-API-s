<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Referers;
use App\Models\Pricings;
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
        $refers->Refer_name = $request->Refer_name;
        $refers->Refer_value = $request->Refer_value;
        $refers->Refer_status = $request->Refer_status;
        $refers->save();



        return response()->json([
            'success' => true,
            'message' => 'Referer Added Successfully Done'
        ], 200);
    }

    public function allrefers()
    {
        $refers = Referers::where('Refer_status', 'enabled')->get();
        return response()->json([
            'success' => true,
            'message' => 'Refers Fetch Successfully Done.',
            'data' => $refers

        ], 200);
    }

    public function update_ref(Request $request, $id)
    {

        $refers = new Referers();
        $refers = Referers::find($id);
        $refers->Refer_name = $request->Refer_name;
        $refers->Refer_value = $request->Refer_value;
        $refers->Refer_status = $request->Refer_status;
        $refers->save();

        return response()->json([
            'success' => true,
            'message' => 'Referer Number -> ' . $id . ' ->Details Updated Successfully.'
        ], 200);
    }

    public function destroy_ref($id)
    {
        $delete_refers = Referers::find($id);

        $delete_refers->delete();

        return response()->json([
            'success' => true,
            'message' => 'Referer Number->' . $id . '->Remove Successfully Done.'
        ], 200);
    }

    public function show_single_ref(Request $request, $id)
    {
        $refers = Referers::where('id', $id)->get();
        // $ids = $request->input('ids', []); // via injected instance of Request
        // $items1 = items::whereIn('id', explode(',', $id))->get();
        // $items1 = items::whereIn('id', explode(',', $id->$request->get()));

        if ($refers->isEmpty()) {
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


    public function check_ref_sale(Request $request, $id)
    {
        $refers = Referers::where('Refer_name', $id)
            ->count();
        // $ids = $request->input('ids', []); // via injected instance of Request
        // $items1 = items::whereIn('id', explode(',', $id))->get();
        // $items1 = items::whereIn('id', explode(',', $id->$request->get()));

        if ($refers == null) {
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


    public function allPricing_after_Cuting(Request $request, $id)
    {
        $pricing = Pricings::all();

        // $pricing1 = Referers::select('Refer_value')->where('id',$id)->get();

        // return response()->json([
        //        'success' => true,
        //        'message' => 'Referers Sales Details Found',
        //        'Referer' => $pricing1
        //    ], 200);


        if ($pricing->isEmpty()) {
            return response()->json([
                'success' => true,
                'message' => 'Pricing Not Found Done.',
                // 'data' => $Items

            ], 404);
        }

        foreach ($pricing as $user) {
            // echo $user->plan_price - $pricing1;
            $discount = Referers::where('id', $id)->value('Refer_value');
            $price = intval($user->Plan_price) - (intval($user->Plan_price) * intval($discount)) / 100;
            $status = Referers::where('id', $id)->value('Refer_status');
            $data[] = [
                'id' => $user->id,
                'Plan_image' => $user->image,
                'Plan_Name' => $user->Plan_title,
                'Plan_tag_line' => $user->Plan_tag_line,
                'Plan_description' => $user->Plan_description,
                'Plan_price' => "$" . $user->Plan_price,
                'Referer_Discount' => "$" . $discount,
                'Plan_price_after_discount' => "$" . $price,
                'Referer_Status' => $status,


            ];


            // echo "Price: " . $price . "<br><br>";
        }
        return response()->json([
            'success' => true,
            'message' => 'Referers Sales Details Found',
            'data' => $data
        ], 200);
    }
}
