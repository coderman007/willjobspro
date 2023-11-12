<?php

namespace App\Http\Controllers\Partner;

use App\Http\Controllers\Controller;
use App\Http\Requests\EditPartnerRequest;
use App\Http\Requests\PartnerRequest;
use App\Models\Partner;
use App\Repository\Partner\PartnerRepository;
use App\Utils\Response;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;

/**
 * @purpose
 *
 * Provides a controller for performing actions on partners
 */
class PartnerController extends Controller
{
    use Response;

    private PartnerRepository $partnerRepository;

    public function __construct(PartnerRepository $partnerRepository)
    {
        $this->partnerRepository = $partnerRepository;
    }

    public function all()
    {
        return $this->partnerRepository->all();
    }

    public function index()
    {
        return $this->partnerRepository->index();
    }

    public function list()
    {
        return $this->partnerRepository->list();
    }

    public function store(PartnerRequest $request)
    {
        return $this->partnerRepository->store($request);
    }

    public function update(EditPartnerRequest $request, $id)
    {
        $partner = Partner::where('id', $id)->first();

        return $this->partnerRepository->update($request, $partner);
    }

    public function destroy($id)
    {
        $partner = Partner::find($id);

        return $this->partnerRepository->destroy($partner);
    }

    public function verifyEmail(Request $request)
    {
        return $this->partnerRepository->verifyEmail($request);
    }

    public function topPerformers()
    {
        return $this->partnerRepository->getTopPerformers();
    }

    public function reset(Request $request)
    {
        $request->validate(['email' => 'required|email']);

        $status = Password::broker('partners')->sendResetLink(
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

        $status = Password::broker('partners')->reset(
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
