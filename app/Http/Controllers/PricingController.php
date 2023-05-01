<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\TokenRepository;
use Laravel\Passport\RefreshTokenRepository;
use Illuminate\Http\Request;
use App\Models\Pricings;

class PricingController extends Controller
{
    public function addPricing(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'Plan_title' => 'required|string',
            'Plan_tag_line' => 'required|string',
            'Plan_price' => 'required|string',
            'Plan_description' => 'required|string',
            'image' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }

        $pricing = new Pricings();
        $pricing->Plan_title = $request->Plan_title;
        $pricing->Plan_tag_line = $request->Plan_tag_line;
        $pricing->Plan_price = $request->Plan_price;
        $pricing->Plan_description = $request->Plan_description;
        $pricing->image = $request->image;

        $pricing->save();



        return response()->json([
            'success' => true,
            'message' => 'Pricings Added Successfully Done'
        ], 200);
    }

    public function allPricing()
    {
        $pricing = Pricings::all();
        if ($pricing->isEmpty()) {
            return response()->json([
                'success' => true,
                'message' => 'Pricing Not Found Done.',
                // 'data' => $Items

            ], 404);
        }
        return response()->json([
            'success' => true,
            'message' => 'Pricing Fetch Successfully Done.',
            'data' => $pricing

        ], 200);
    }

    public function update_pricing(Request $request, $id)
    {

        $pricing = new Pricings();
        $pricing = Pricings::find($id);
        $pricing->Plan_title = $request->Plan_title;
        $pricing->Plan_tag_line = $request->Plan_tag_line;
        $pricing->Plan_price = $request->Plan_price;
        $pricing->Plan_description = $request->Plan_description;
        $pricing->image = $request->image;

        $pricing->save();

        return response()->json([
            'success' => true,
            'message' => 'Pricings Number -> ' . $id . ' ->Details Updated Successfully.'
        ], 200);
    }

    public function destroy_pricing($id)
    {
        $delete_Pricing = Pricings::find($id);

        $delete_Pricing->delete();

        return response()->json([
            'success' => true,
            'message' => 'Pricing Number->' . $id . '->Remove Successfully Done.'
        ], 200);
    }

    public function show_single_pricing(Request $request, $id)
    {
        $pricing = Pricings::where('id', $id)->get();
        // $ids = $request->input('ids', []); // via injected instance of Request
        // $items1 = items::whereIn('id', explode(',', $id))->get();
        // $items1 = items::whereIn('id', explode(',', $id->$request->get()));

        if ($pricing->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'Pricings Details Not Found'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Pricings Details Found',
            'Pricing' => $pricing
        ], 200);
    }
}
