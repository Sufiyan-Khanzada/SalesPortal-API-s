<?php

namespace App\Http\Controllers;

use Validator;
use App\Models\User;
use App\Models\Customers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Laravel\Passport\TokenRepository;
use Laravel\Passport\RefreshTokenRepository;

class PassportController extends Controller
{
    /**
     * Register user.
     *
     * @return json
     */



    public function showall()
    {
        $users = User::all();
        if ($users == "") {
            return response()->json([
                'success' => true,
                'message' => 'Users Not Found Done.',
                // 'data' => $Items

            ], 404);
        } else {
            return response()->json([
                'success' => true,
                'message' => 'Users Fetch Successfully Done.',
                'data' => $users

            ], 200);
        }
    }



    public function showallsales()
    {
        $users = User::all()->where('role', 'SalesPerson');
        if ($users == "") {
            return response()->json([
                'success' => true,
                'message' => 'Users Not Found Done.',
                // 'data' => $Items

            ], 404);
        } else {
            return response()->json([
                'success' => true,
                'message' => 'Users Fetch Successfully Done.',
                'data' => $users

            ], 200);
        }
    }

    public function showallclients()
    {
        $users = $users = User::all()->where('role', 'Client');
        if ($users == "") {
            return response()->json([
                'success' => true,
                'message' => 'Users Not Found Done.',
                // 'data' => $Items

            ], 404);
        } else {
            return response()->json([
                'success' => true,
                'message' => 'Users Fetch Successfully Done.',
                'data' => $users

            ], 200);
        }
    }




    public function register(Request $request)
    {
        $input = $request->only(['name', 'email', 'password', 'confirm_password', 'role', 'DOB', 'cnic']);

        $validate_data = [
            'name' => 'required|string|min:4',
            'email' => 'required|email',
            'password' => 'required|min:8',
            'confirm_password' => 'same:password|required',
            'role'  => 'required',
            'DOB'  => 'required',
            'cnic'  => 'required',

        ];

        $validator = Validator::make($input, $validate_data);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }

        $user = User::create([
            'name' => $input['name'],
            'email' => $input['email'],
            'password' => Hash::make($input['password']),
            'confirm_password' => Hash::make($input['confirm_password']),
            'role'  => $input['role'],
            'DOB'  => $input['DOB'],
            'cnic'  => $input['cnic'],

        ]);

        return response()->json([
            'success' => true,
            'message' => 'User registered succesfully, Use Login method to receive token.'
        ], 200);
    }



    public function salesregister(Request $request)
    {
        $input = $request->only(['name', 'email', 'password', 'confirm_password', 'role', 'DOB', 'cnic']);

        $validate_data = [
            'name' => 'required|string|min:4',
            'email' => 'required|email',
            'password' => 'required|min:8',
            //'confirm_password' => 'same:password|required',
            // 'role'  => 'required',
            'DOB'  => 'required',
            'cnic'  => 'required',

        ];

        $validator = Validator::make($input, $validate_data);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }

        $user = User::create([
            'name' => $input['name'],
            'email' => $input['email'],
            'password' => Hash::make($input['password']),
            'confirm_password' => Hash::make($input['confirm_password']),
            'role'  => $input['role'] = "SalesPerson",
            'DOB'  => $input['DOB'],
            'cnic'  => $input['cnic'],

        ]);

        return response()->json([
            'success' => true,
            'message' => 'User registered succesfully, Use Login method to receive token.'
        ], 200);
    }


    public function update_sales(Request $request, $id)
    {
        $sales = User::find($id);
        if ($sales) {

            $sales->name = $request->name;
            $sales->email = $request->email;
            if (isset($request->password)) {

                $sales->password = Hash::make($request->password);
                $sales->confirm_password = Hash::make($request->confirm_password);
            }
            $sales->DOB = $request->DOB;
            $sales->cnic = $request->cnic;
            $sales->save();

            return response()->json([
                'success' => true,
                'message' => 'Sales -> ' . $id . ' ->Details Updated Successfully.'
            ], 200);
        }
    }



    public function update_admin(Request $request, $id)
    {

        $sales = new User();
        $sales = User::find($id);

        if ($sales) {
            $sales->name = $request->name;
            $sales->email = $request->email;
            $sales->password = Hash::make($request->password);
            $sales->confirm_password = Hash::make($request->confirm_password);
            $sales->DOB = $request->DOB;
            $sales->cnic = $request->cnic;
            $sales->save();

            return response()->json([
                'success' => true,
                'message' => 'Admin Details Updated Successfully.'
            ], 200);
        }
    }


    public function Usersregister(Request $request)
    {
        try {
            $input = $request->only(['name', 'email', 'password', 'confirm_password', 'role', 'DOB', 'referby']);

            $validate_data = [
                'name' => 'required|string|min:4',
                'email' => 'required|email|unique:users',
                'password' => 'required|min:8',
                // 'confirm_password' => 'same:password|required',
                'DOB'  => 'required',
                //'referal' => 'required',
                'role' =>  'required',

            ];

            $validator = Validator::make($input, $validate_data);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Please see errors parameter for all errors. (UsersAuth Validator Error)',
                    'errors' => $validator->errors()->first()
                ]);
            }

            $user = User::create([
                'name' => $input['name'],
                'email' => $input['email'],
                'password' => Hash::make($input['password']),
                'confirm_password' => Hash::make($input['confirm_password']),
                'DOB'  => $input['DOB'],
                'referal' => $input['referby'],
                'role' => $input['role']


            ]);


            //////second Validotor////
            $input1 = $request->only(['firstname', 'lastname', 'email', 'DOB', 'gender', 'referby', 'referprice', 'profilepic']);

            $validate_data1 = [
                'firstname' => 'required|string|min:4',
                'lastname' => 'required|string|min:4',
                'email' => 'required|email',
                'DOB' => 'required|min:8',
                'gender' => 'required',
                'referby'  => 'required',
                'referprice'  => 'required',
                'profilepic' => 'sometimes',


            ];

            $validator1 = Validator::make($input1, $validate_data1);

            if ($validator1->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Please see errors parameter for all errors. (UsersValidator Error)',
                    'errors' => $validator1->errors()
                ]);
            }
            $clients = new Customers();
            $lastId = User::latest('id')->pluck('id')->first();
            // $newId = $lastId + 1;
            $clients->client_id = $lastId;
            $clients->firstname = $request->firstname;
            $clients->lastname = $request->lastname;
            $clients->email = $request->email;
            $clients->DOB = $request->DOB;
            $clients->gender = $request->gender;
            $clients->referby = $request->referby;
            $clients->referprice = $request->referprice;
            $clients->profilepic = $request->profilepic;
            $clients->save();


            //////second validator end////

            return response()->json([
                'success' => true,
                'message' => 'User registered succesfully, Use Login method to receive token.'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' =>  $e->getMessage()
            ]);
        }
    }


    public function UsersUpdate(Request $request,$id)
    {

            $clients = new Customers();
            $clients = Customers::find($id);
            $clients->firstname = $request->firstname;
            $clients->lastname = $request->lastname;
            $clients->email = $request->email;
            $clients->DOB = $request->DOB;
            $clients->gender = $request->gender;
            $clients->referby = $request->referby;
            $clients->referprice = $request->referprice;
            $clients->profilepic = $request->profilepic;
            $clients->save();


            //////second validator end////

            return response()->json([
                'success' => true,
                'message' => 'User Updated succesfully.'
            ], 200);
        }   
























    public function show($id)
    {
        $user = User::where('id', $id)->get();

        if ($user->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'User Details Not Found'
            ], 404);
        }
        return response()->json([
            'success' => true,
            'message' => 'User Details Found',
            'data' => $user
        ], 200);
    }


    // public function customerregister(Request $request)
    // {
    //     $input = $request->only(['name', 'email', 'password','confirm_password','role','DOB','cnic']);

    //     $validate_data = [
    //         'name' => 'required|string|min:4',
    //         'email' => 'required|email',
    //         'password' => 'required|min:8',
    //         'confirm_password' => 'same:password|required',
    //         'role'  => 'required',
    //         'DOB'  => 'required',
    //         'cnic'  => 'required',

    //     ];

    //     $validator = Validator::make($input, $validate_data);

    //     if ($validator->fails()) {
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'Please see errors parameter for all errors.',
    //             'errors' => $validator->errors()
    //         ]);
    //     }

    //     $user = User::create([
    //         'name' => $input['name'],
    //         'email' => $input['email'],
    //         'password' => Hash::make($input['password']),
    //         'confirm_password' => Hash::make($input['confirm_password']),
    //         'role'  => "Customer",
    //         'DOB'  => $input['DOB'],
    //         'cnic'  => $input['cnic'],

    //     ]);

    //     return response()->json([
    //         'success' => true,
    //         'message' => 'User registered succesfully, Use Login method to receive token.'
    //     ], 200);
    // }





    /**
     * Login user.
     *
     * @return json
     */
    public function login(Request $request)
    {
        $input = $request->only(['email', 'password']);

        $validate_data = [
            'email' => 'required|email',
            'password' => 'required|min:8',
        ];

        $validator = Validator::make($input, $validate_data);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please see errors parameter for all errors.',
                'errors' => $validator->errors()
            ]);
        }

        // authentication attempt
        if (auth()->attempt($input)) {
            $token = auth()->user()->createToken('passport_token')->accessToken;

            return response()->json([
                'success' => true,
                'message' => 'User login succesfully, Use token to authenticate.',
                'token' => $token
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'User authentication failed.'
            ], 401);
        }
    }

    /**
     * Access method to authenticate.
     *
     * @return json
     */
    public function userDetail()
    {
        return response()->json([
            'success' => true,
            'message' => 'Data fetched successfully.',
            'data' => auth()->user()
        ], 200);
    }

    /**
     * Logout user.
     *
     * @return json
     */
    public function logout()
    {
        $access_token = auth()->user()->token();

        // logout from only current device
        $tokenRepository = app(TokenRepository::class);
        $tokenRepository->revokeAccessToken($access_token->id);

        // use this method to logout from all devices
        // $refreshTokenRepository = app(RefreshTokenRepository::class);
        // $refreshTokenRepository->revokeRefreshTokensByAccessTokenId($$access_token->id);

        return response()->json([
            'success' => true,
            'message' => 'User logout successfully.'
        ], 200);
    }
}
