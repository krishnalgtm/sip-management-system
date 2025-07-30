@extends('layouts.app')

@section('content')
<style>
    .dashboard-card {
        border: none;
        border-radius: 20px;
        transition: all 0.3s ease-in-out;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
    }

    .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.1);
    }

    .icon-circle {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 28px;
        margin: 0 auto 10px;
    }

    .gradient-bg {
        background: linear-gradient(135deg, #5ec6b8, #1c6dd0);
        color: white;
    }

    .gradient-bg-green {
        background: linear-gradient(135deg, #28a745, #218838);
        color: white;
    }

    .gradient-bg-orange {
        background: linear-gradient(135deg, #ffc107, #fd7e14);
        color: white;
    }
</style>

<div class="container mt-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold">Welcome, {{ Auth::user()->name }} </h2>
        <p class="text-muted">Manage your SIPs and invoices with ease</p>
    </div>

    <div class="row g-4">
        <!-- Create SIP -->
        <div class="col-md-4">
            <div class="card dashboard-card text-center p-4">
                <div class="icon-circle gradient-bg">
                    <i class="bi bi-plus-circle"></i>
                </div>
                <h5 class="fw-semibold mt-3">Create New SIP</h5>
                <p class="text-muted">Start a fresh SIP plan now.</p>
                <a href="{{ route('sips.create') }}" class="btn btn-outline-primary w-100">Create SIP</a>
            </div>
        </div>

        <!-- View SIPs -->
        <div class="col-md-4">
            <div class="card dashboard-card text-center p-4">
                <div class="icon-circle gradient-bg-green">
                    <i class="bi bi-wallet2"></i>
                </div>
                <h5 class="fw-semibold mt-3">My SIPs</h5>
                <p class="text-muted">Review your existing SIPs.</p>
                <a href="{{ route('sips.index') }}" class="btn btn-outline-success w-100"> View SIPs</a>
            </div>
        </div>

        <!-- View Invoices -->
        <div class="col-md-4">
            <div class="card dashboard-card text-center p-4">
                <div class="icon-circle gradient-bg-orange">
                    <i class="bi bi-receipt-cutoff"></i>
                </div>
                <h5 class="fw-semibold mt-3">My Invoices</h5>
                <p class="text-muted">Track all your invoice history.</p>
                <a href="{{ route('invoices.index') }}" class="btn btn-outline-warning w-100 text-dark"> View Invoices</a>
            </div>
        </div>
    </div>
</div>
@endsection
