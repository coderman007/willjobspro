<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserRequest;
use App\Models\User;
use App\Repository\User\UserRepository;
use App\Utils\Response;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;

/**
 * @purpose
 *
 * Provides a controller for performing actions on users
 */
class UserController extends Controller
{
    use Response;

    private UserRepository $userRepository;

    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    public function index()
    {
        return $this->userRepository->index();
    }

    public function store(UserRequest $request)
    {
        return $this->userRepository->store($request);
    }

    public function update(UserRequest $request, $id)
    {
        $user = User::find($id);

        return $this->userRepository->update($request, $user);
    }

    public function destroy($id)
    {
        $user = User::find($id);

        return $this->userRepository->destroy($user);
    }

    public function verifyEmail(Request $request)
    {
        return $this->userRepository->verifyEmail($request);
    }

    public function block($id)
    {
        $user = User::find($id);

        return $this->userRepository->blockUser($user);
    }

    public function unblock($id)
    {
        $user = User::find($id);

        return $this->userRepository->unBlockUser($user);
    }

    public function reset(Request $request)
    {
        $request->validate(['email' => 'required|email']);

        $status = Password::sendResetLink(
            $request->only('email')
        );

        return $status === Password::RESET_LINK_SENT
                ? $this->responseData(__('Password Reset link sent.')) : $this->responseError(__('Password Reset link sending failed.'), 500);
    }

    public function resetSubmission(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password),
                ])->setRememberToken(Str::random(60));
                $user->save();

                event(new PasswordReset($user));
            }
        );

        return $this->responseData(['status' => $status === Password::PASSWORD_RESET
        ? true : false, ]);
    }
}
