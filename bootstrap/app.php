<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Console\Commands\GenerateInvoices;
use Illuminate\Console\Scheduling\Schedule;
use App\Console\Commands\ProcessInvoices;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        //
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })
    ->withCommands([
            GenerateInvoices::class,
        ])
        ->withSchedule(function (Schedule $schedule) {
            $schedule->command('sip:generate-invoices')->hourly();
        })
    ->withCommands([
    GenerateInvoices::class,
    ProcessInvoices::class, // ✅ Add this
])
->withSchedule(function (Schedule $schedule) {
    $schedule->command('sip:generate-invoices')->hourly();
    $schedule->command('sip:process-invoices')->hourly(); // ✅ add this
})
    ->create();
