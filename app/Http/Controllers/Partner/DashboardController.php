<?php

namespace App\Http\Controllers\Partner;

use App\Http\Controllers\Controller;
use App\Repository\Partner\PartnerRepository;

class DashboardController extends Controller
{
    private PartnerRepository $partnerRepository;

    public function __construct(PartnerRepository $partnerRepository)
    {
        $this->partnerRepository = $partnerRepository;
    }

    public function index()
    {
        return $this->partnerRepository->getPartnersDashboard();
    }
}
