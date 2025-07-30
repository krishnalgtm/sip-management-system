<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Sip;
use App\Models\Invoice;
use Carbon\Carbon;

class GenerateInvoices extends Command
{
    protected $signature = 'sip:generate-invoices';
    protected $description = 'Generate pending invoices 25 hours in advance';

    public function handle()
    {
        // Target time: 25 hours from now
        $targetTime = now()->addHours(25);

        // Get all active SIPs
        $sips = Sip::where('status', 'active')->get();

        foreach ($sips as $sip) {
            // Check if an invoice already exists for this sip and date
            $already = Invoice::where('sip_id', $sip->id)
                ->whereDate('scheduled_for', $targetTime->toDateString()) // ✅ corrected here
                ->exists();

            if (!$already) {
                Invoice::create([
                    'sip_id' => $sip->id,
                    'user_id' => $sip->user_id, // ✅ correctly added
                    'scheduled_for' => $targetTime,
                    'amount' => $sip->amount,
                    'status' => 'pending',
                ]);
            }
        }

        $this->info('Invoices generated successfully.');
    }
}
