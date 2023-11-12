<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Repository\API\V1\ActivityLog\UserActivityLogRepository;
use Illuminate\Http\Request;

class ActivityLogController extends Controller
{
    private UserActivityLogRepository $userActivityLogRepository;

    public function __construct(UserActivityLogRepository $userActivityLogRepository)
    {
        $this->userActivityLogRepository = $userActivityLogRepository;
    }

    public function saveAppOpen(Request $request)
    {
        $user = User::find($request->user_id);

        return $this->userActivityLogRepository->saveAppOpeningActivity($user);
    }
}
