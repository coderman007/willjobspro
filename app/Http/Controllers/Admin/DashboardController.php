<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Repository\API\V1\Dashboard\StatsRepository;

class DashboardController extends Controller
{
    private StatsRepository $statsRepository;

    public function __construct(StatsRepository $statsRepository)
    {
        $this->statsRepository = $statsRepository;
    }

    public function insights()
    {
        return $this->statsRepository->dashboardInsightsStats();
    }

    public function conversionMetrics()
    {
        return $this->statsRepository->dashboardConversionMetrics();
    }
}
