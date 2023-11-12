<?php

namespace App\Repository\Authentication;

use App\Http\Resources\UserResource;
use App\Models\User;
use App\Utils\Response;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class UserLoginRepository extends LoginRepository
{
    use Response;

    /**
     * User Login method
     *
     * @param  Request  $request
     * @return JSONResponse
     */
    public function login(Request $request)
    {
        try {
            $validatedUser = Validator::make($request->all(), [
                'email' => 'required|email',
                'password' => 'required',
                'device_name' => 'string',
            ]);

            if ($validatedUser->fails()) {
                return $this->responseError(__('Invalid input, please check.'), 401);
            }

            $unverified = DB::table('password_resets')
            ->where('email', $request->email)->first();

            if ($unverified) {
                return $this->responseError(__('Your account is unverified, please verify.'), 401);
            }

            if (! Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
                return $this->responseError(__('Invalid credentials, please try again.'), 401);
            }

            $user = User::where('email', $request->email)->first();

            $token_name = ($request->device_name) ? $request->device_name : 'API TOKEN';

            return $this->responseData([
                'status' => true,
                'token' => $user->createToken($token_name)->plainTextToken,
            ], 'User Login Successful.');
        } catch (\Throwable $th) {
            return $this->responseError(['msg' => __('There was a problem with logging you in, try again.'), 'exception' => $th], 500);
        }
    }

    /**
     * User Details method
     *
     * @return JSONResponse
     */
    public function details(Request $request)
    {
        $user = $request->user();

        return new UserResource($user);
    }

    /**
     * User Logout method
     *
     * @return JSONResponse
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return $this->responseData([
            'message' => __('User logged out succesfully.'),
        ]);
    }
}
