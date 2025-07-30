<?php
namespace App\Http\Controllers;

use App\Models\Sip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class SipController extends Controller
{
    public function create()
    {
        return view('sips.create');
    }

    public function store(Request $request)
{
    // Validate SIP form input
    $request->validate([
        'amount' => 'required|numeric|min:1',
        'frequency' => 'required|in:daily,monthly',
        'start_date' => 'required|date|after_or_equal:today',
        'end_date' => 'required|date|after:start_date',
    ]);

        // Create new SIP
    Sip::create([
        'user_id' => Auth::id(), // associate with logged in user
        'amount' => $request->amount,
        'frequency' => $request->frequency,
        'start_date' => $request->start_date,
        'end_date' => $request->end_date,
        'status' => 'active',
    ]);

    return redirect()->route('sips.index')->with('success', 'SIP created successfully');
}

    public function index()
    {
        $sips = Sip::where('user_id', Auth::id())->latest()->get();
        return view('sips.index', compact('sips'));
    }
}