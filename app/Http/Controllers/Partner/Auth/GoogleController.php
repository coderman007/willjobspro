<?php

namespace App\Http\Controllers\Partner\Auth;

use App\Http\Controllers\Controller;
use App\Models\Partner;
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
       
            $findpartner = Partner::where('email', $providerUser->email)->first();
       
            if($findpartner){
       
                Auth::login($findpartner);

                $token_name = ($request->device_name) ? $request->device_name : 'API TOKEN';
      
                return $this->responseData([
                    'status' => true,
                    'token' => $findpartner->createToken($token_name)->plainTextToken,
                ], 'Partner Login Successful.');
            } else {
                return $this->responseError(['msg' => __('Please create an account before logging in with Google.')], 401);
            }
      
        } catch (\Throwable $th) {
            return $this->responseError(['msg' => __('There was a problem with logging you in, try again.'), 'exception' => strval($th)], 500);
        }
    }
}
