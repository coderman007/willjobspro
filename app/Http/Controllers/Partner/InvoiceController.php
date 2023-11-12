<?php

namespace App\Http\Controllers\Partner;

use App\Http\Controllers\Controller;
use App\Http\Requests\InvoiceRequest;
use App\Repository\API\V1\InvoiceRepository;

class InvoiceController extends Controller
{
    private InvoiceRepository $invoiceRepository;

    public function __construct(InvoiceRepository $invoiceRepository)
    {
        $this->invoiceRepository = $invoiceRepository;
    }

    public function createInvoice(InvoiceRequest $invoice)
    {
        return $this->invoiceRepository->createInvoice($invoice);
    }

    public function updateInvoice($invoicePaid)
    {
        return $this->invoiceRepository->invoicePaid($invoicePaid);
    }
}
