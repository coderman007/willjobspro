<?php

namespace App\Http\Controllers\User\Auth;

use App\Http\Controllers\Controller;
use App\Repository\Authentication\UserLoginRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * @purpose
 *
 * Provides a login controller for authenticating the user on the app
 */
class LoginController extends Controller
{
    private UserLoginRepository $loginRepository;

    public function __construct(UserLoginRepository $loginRepository)
    {
        $this->loginRepository = $loginRepository;
    }

    public function login(Request $request): JsonResponse
    {
        return $this->loginRepository->login($request);
    }

    public function logout(Request $request): JsonResponse
    {
        return $this->loginRepository->logout($request);
    }

    public function details(Request $request)
    {
        return $this->loginRepository->details($request);
    }
}
