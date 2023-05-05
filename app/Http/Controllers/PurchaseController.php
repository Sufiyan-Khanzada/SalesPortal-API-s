<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Customers;
use App\Models\Pricings;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Purchases;
use App\Models\Referers;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    //
    public function allPurchases()
    {
        try {
            $order = Purchases::select('purchases.*', DB::raw('GROUP_CONCAT(DISTINCT pricings.Plan_title) as plan_titles'))
                ->join('pricings', function ($join) {
                    $join->whereRaw('FIND_IN_SET(pricings.id, purchases.Product_ids)');
                })
                ->groupBy('purchases.id')
                ->get();



            return response()->json([
                'success' => true,
                'message' => 'Purchases Fetch Successfully Done.',
                'data' => $order

            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'messagse' => $e->getmessage()
            ]);
        }
    }
    public function userPurchases($id)
    {
        $purchases = Purchases::where('user_id', $id)->get();

        foreach ($purchases as $purchase) {
            $productIds = explode(',', $purchase->Product_ids);

            $order = Pricings::whereIn('id', $productIds)
                ->get()->toArray();
            $order = array_column($order, 'Plan_title');

            $data[] = [
                'name' => $order,
                'purchase' => $purchase

            ];
            // do something with $order, such as adding it to an array or displaying it on the page
        }
        if ($purchases->isEmpty()) {
            return response()->json([
                'success' => true,
                'message' => 'Purchases Not Found Done.',
                // 'data' => $Items

            ]);
        }
        return response()->json([
            'success' => true,
            'message' => 'Purchases Fetch Successfully Done.',
            'data' => $data

        ]);
    }

    public function sellerPurchases($id)
    {
        try {
            $users = Customers::selectRaw('customers.*, referers.refer_name, referers.refer_value, (SELECT SUM(amount) FROM purchases WHERE purchases.user_id = customers.client_id) AS total_purchase_amount')
                ->join('referers', 'referers.id', '=', 'customers.referprice')
                ->where('referby', $id)
                ->get();
            return response()->json([
                'success' => true,
                'data' => $users

            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'messagse' => $e->getmessage()
            ]);
        }
    }
    public function update_Purchases(Request $request, $id)
    {

        $order = new Purchases();
        $order = Purchases::find($id);
        $order->First_name = $request->First_name;
        $order->Last_name = $request->Last_name;
        $order->Email = $request->Email;
        $order->Paymode = $request->Paymode;
        $order->referid = $request->referid;
        $order->referby = $request->referby;
        $order->amount = $request->amount;
        $order->Remaining_Amount = $request->Remaining_Amount;
        $order->user_id = $request->user_id;
        $order->Total = $request->Total;
        $ids = $request->Product_ids;
        $string = implode(",", $request->Product_ids);
        // $result = explode(",", $string);
        $order->Product_ids = $string;
        $order->Total = $request->Total;
        $order->save();




        return response()->json([
            'success' => true,
            'message' => 'Order Number -> ' . $id . ' ->Details Updated Successfully.'
        ], 200);
    }



    public function add(Request $request)
    {
        try {
            $input = $request->all();
            $validator = Validator::make($input, [
                'method' => 'required',
                'id' => 'required',
                'user' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Please see errors parameter for all errors.',
                    'errors' => $validator->errors()
                ]);
            }
            $user = $request->user;
            $userData = Customers::where('client_id', $user['id'])->get()->first()->toArray();
            $referer = Referers::where('id', $userData['referprice'])->where('Refer_status', 'enabled')->get()->first()->toArray();
            $products = Pricings::whereIn('id', $request->id)->get()->toArray();
            $total = 0;
            foreach ($products as $product) {
                $discount = $referer['Refer_value'];
                $price = intval($product['Plan_price']) - (intval($product['Plan_price']) * intval($discount)) / 100;
                $total += $price;
            }
            if ($request->method == "half") {
                $amount = $remain = $total / 2;
            } else {
                $amount = $total;
                $remain = 0;
            }


            $order = new Purchases();
            $order->First_name = $userData['firstname'];
            $order->Last_name = $userData['lastname'];
            $order->Email = $userData['email'];
            $order->Paymode = $request->method;
            $order->referid = $userData['referprice'];
            $order->referby = $userData['referby'];
            $order->amount = $amount;
            $order->Remaining_Amount = $remain;
            $order->user_id = $user['id'];
            $order->Total = $total;
            $order->Product_ids = implode(",", $request->id);
            $order->save();



            return response()->json([
                'success' => true,
                'message' => 'Items Added to Cart'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => true,
                'messagse' => $e->getmessage()
            ]);
        }
    }




    public function destroy_order($id)
    {
        $delete_pro = Purchases::find($id);

        $delete_pro->delete();

        return response()->json([
            'success' => true,
            'message' => 'Order Number->' . $id . '->Remove Successfully Done.'
        ], 200);
    }
}
