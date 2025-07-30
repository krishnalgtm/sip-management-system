<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;
use App\Models\Sip;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class InvoiceController extends Controller
{
    // 👁 Show all invoices for logged-in user
    public function index()
    {
        $invoices = Invoice::where('user_id', Auth::id())->latest()->get();
        return view('invoices.index', compact('invoices'));
    }

    // 🧾 Generate invoices when user clicks "Generate Invoice" button
    public function generateFromButton(Request $request)
    {
        $user = Auth::user();
        $targetTime = now()->addHours(25);

        $sips = Sip::where('user_id', $user->id)
                    ->where('status', 'active')
                    ->get();

        $count = 0;

        foreach ($sips as $sip) {
            $already = Invoice::where('sip_id', $sip->id)
                ->whereDate('scheduled_for', $targetTime->toDateString())
                ->exists();

            if (!$already) {
                Invoice::create([
                    'sip_id'        => $sip->id,
                    'user_id'       => $user->id,
                    'scheduled_for' => $targetTime,
                    'amount'        => $sip->amount,
                    'status'        => 'pending',
                ]);
                $count++;
            }
        }

        return redirect()->back()->with('success', "$count invoice(s) generated successfully.");
    }
}
