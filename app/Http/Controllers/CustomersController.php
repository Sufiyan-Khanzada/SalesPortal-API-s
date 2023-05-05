<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchases;
use App\Models\Customers;


class CustomersController extends Controller
{
    //
    public function show_single_customer_record(Request $request, $id)
    {
        $pricing = Purchases::where('user_id', $id)->get();
        // $ids = $request->input('ids', []); // via injected instance of Request
        // $items1 = items::whereIn('id', explode(',', $id))->get();
        // $items1 = items::whereIn('id', explode(',', $id->$request->get()));

        if ($pricing->isEmpty()) {
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

    public function allCustomer()
    {
        try {
            $customers = Customers::join('users', 'users.id', '=', 'customers.referby')
                ->leftJoin('referers', 'referers.id', '=', 'customers.referprice')
                ->select('customers.*', 'users.name as refer_by_name', 'referers.refer_name')
                ->get();
            if (!$customers) {
                return response()->json([
                    'success' => false,
                    'message' => 'Purchasing Details Not Found'
                ], 200);
            }

            return response()->json([
                'success' => true,
                'message' => 'Purchasing Details Found',
                'data' => $customers
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'messagse' => $e->getmessage()
            ]);
        }
    }


    public function show_single_customer($id)
    {
        $pricing = Customers::where('client_id', $id)->get();

        if ($pricing->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'Customer Details Not Found'
            ]);
        }

        return response()->json([
            'success' => true,
            'message' => 'Customer Details Found',
            'data' => $pricing
        ], 200);
    }
}
