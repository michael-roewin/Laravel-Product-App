<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\User;
use Auth;
use Hash;
use GuzzleHttp\Exception\BadResponseException;

class AuthController extends Controller
{

    public function __construct() {
        $this->middleware('jwt.auth', ['except' => ['authenticate']]);
    }

    public function authenticate(Request $request) {

        $credentials = $request->only('username', 'password');

        $http = new \GuzzleHttp\Client;

        try {
            $response = $http->post(url('/oauth/token'), [
                'form_params' => [
                    'grant_type' => 'password',
                    'client_id' => '2',
                    'client_secret' => '6oXfASbuxoSStwSlh9XYtc0g9EYTrttKYyNIOz3y',
                    'username' => $credentials['username'],
                    'password' => $credentials['password'],
                ],

            ]);
            $statusCode = $response->getStatusCode();
            $response = json_decode((string) $response->getBody(), true);
            $response['token'] = $response['access_token'];
                
            Auth::once($credentials);
            $response['user'] = Auth::getUser();

        } catch (BadResponseException $e) {
            $statusCode = $e->getResponse()->getStatusCode();
            $response = json_decode((string)$e->getResponse()->getBody(), true);
            unset($response['user']);
        }

        

        return response()->json($response, $statusCode);


    }
}
