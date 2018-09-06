<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\User;
use Hash;
use DB;
use Validator;
use Auth;

class UserController extends Controller
{

    public function __construct() {
        
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $userRequest = $request->input();

        $perPage = !empty($userRequest['perPage']) ? $request['perPage'] : false;
        $orderBy = !empty($userRequest['orderBy']) ? $userRequest['orderBy'] : 'name';
        $order = !empty($userRequest['order']) ? $userRequest['order'] : 'ASC';
        $page =  !empty($userRequest['page']) ? $userRequest['page'] : false;

        $users = User::select('*');

        if(isset($userRequest['q'])) {

            $binding = '%'.$userRequest['q'].'%';

            $users = $users->where(function($query) {
                $query->where('name', 'LIKE', '%'.$binding.'%')
                      ->orWhere('username', 'LIKE', '%'.$userRequest['q'].'%');
            });
            
        }

        $count = $users->count();

        if($perPage)
            $users = $users->take($perPage);

        if($page)
            $users = $users->skip(($page - 1) * $perPage);

        if($orderBy)
            $users = $users->orderBy($orderBy, $order);

        $users = $users->get();

        $response = array('success' => true, 'users' => $users, 'count' => $count);

        return response()->json($response);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $userData = $request->input();

        $validator = Validator::make($userData, [
            'name' => 'required',
            'username' => 'required|unique:users',
            'password' => 'required',
            //'usertype' => 'required',
        ]);

        if ($validator->fails())
            return response()->json(['errors' => $validator->errors()->all()], 422);

        $userData['password'] = Hash::make($userData['password']);

        $user = User::create($userData);

        if($user) {
            $response = array('success' => true, 'user' => $user);
        } else {
            $response = array('success' => false, 'errors' => array('error in creating user'));
        }

        return response()->json($response);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);

        if($user) {
            $response = array('success' => true, 'user' => $user);
        } else {
            $response = array('success' => false, 'errors' => array('User not found'));
        }

        return response()->json($response);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $userData = $request->input();

        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required',
            'username' => 'required|unique:users,username,' . $userData['id'],
            //'usertype' => 'required',
        ]);

        if ($validator->fails())
            return response()->json(['errors' => $validator->errors()->all()], 422);

        $user = User::find($id);

        if($user) {

            if(!empty($userData['password']))
                $userData['password'] = Hash::make($userData['password']);

            if($user->update($userData)) {
                $response = array('success' => true, 'user' => $user);
            } else {
                $response = array('success' => false, 'errors' => array('unable to update user'));
            }
        } else {
            $response = array('success' => false, 'errors' => array('User not found'));
        }

        return response()->json($response, $response['success'] ? 200 : 422);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);

        if($user->delete()) {
            $response = array('success' => true);
        } else {
            $response = array('success' => false, 'errors' => array('Error in deleting user'));
        }

        return response()->json($response);

    }

    public function hash() {

        $users = User::get();

        foreach($users as $user) {
            $user->password = Hash::make($user->password);
            $user->save();
        }
    }

}
