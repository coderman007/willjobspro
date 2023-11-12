<?php

namespace App\Http\Controllers\User\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Utils\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class GoogleController extends Controller
{
    use Response;

    /**
     * Handle Google Signin with Token
     *
     * @return void
     */
    public function handleGoogleSignIn(Request $request)
    {
        try {
            $providerUser = Socialite::driver('google')->userFromToken($request->token);
       
            $finduser = User::where('email', $providerUser->email)->first();
       
            if($finduser){
       
                Auth::login($finduser);

                $token_name = ($request->device_name) ? $request->device_name : 'API TOKEN';
      
                return $this->responseData([
                    'status' => true,
                    'token' => $finduser->createToken($token_name)->plainTextToken,
                ], 'User Login Successful.');
            } else {
                return $this->responseError(['msg' => __('Please create an account before logging in with Google.')], 401);
            }
      
        } catch (\Throwable $th) {
            return $this->responseError(['msg' => __('There was a problem with logging you in, try again.'), 'exception' => strval($th)], 500);
        }
    }
}
