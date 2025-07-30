<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Invoice;
use Carbon\Carbon;

class ProcessInvoices extends Command
{
    protected $signature = 'sip:process-invoices';
    protected $description = 'Process pending invoices older than 25 hours';

    public function handle()
    {
        $cutoff = now()->subHours(25);

        $invoices = Invoice::where('status', 'pending')
            ->where('created_at', '<=', $cutoff)
            ->get();

        foreach ($invoices as $invoice) {
            // Simulate fake API response
            $success = rand(0, 1); // randomly 0 or 1

            $invoice->status = $success ? 'paid' : 'failed';
            $invoice->save();

            $this->info("Invoice #{$invoice->id} marked as {$invoice->status}");
        }

        $this->info("Processed " . count($invoices) . " invoices.");
    }
}
