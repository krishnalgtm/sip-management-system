<?php

namespace App\Console\Schedule;

use Illuminate\Console\Scheduling\Schedule;
use LaravelZero\Framework\Commands\Command;

class ListensForScheduling
{
    public function __invoke(Schedule $schedule): void
    {
        // Invoice generate 25 hours pehle
        $schedule->command('sip:generate-invoices')->everyMinute();

        // Process old pending invoices
        $schedule->command('sip:process-invoices')->everyMinute();
    }
}
