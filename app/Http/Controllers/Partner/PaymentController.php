<?php

namespace App\Http\Controllers\Partner;

use App\Http\Controllers\Controller;
use App\Http\Requests\Payments\InvoiceCardPaymentRequest;
use App\Repository\API\V1\Payments\PaymentRepository;

class PaymentController extends Controller
{
    private PaymentRepository $paymentRepository;

    public function __construct(PaymentRepository $paymentRepository)
    {
        $this->paymentRepository = $paymentRepository;
    }

    public function payCardInvoice(InvoiceCardPaymentRequest $invoicePayment)
    {
        return $this->paymentRepository->partnerCardInvoicePayment($invoicePayment);
    }
}
