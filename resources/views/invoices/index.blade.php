@extends('layouts.app')

@section('content')
<style>
    .card-rounded {
        border-radius: 20px;
        box-shadow: 0 10px 24px rgba(0, 0, 0, 0.05);
    }

    .badge {
        font-size: 0.85rem;
        padding: 0.4em 0.8em;
        border-radius: 12px;
    }

    .btn-generate {
        border-radius: 30px;
        padding: 8px 25px;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .table td, .table th {
        vertical-align: middle;
        text-align: center;
    }
</style>

<div class="container py-5">
    <div class="card card-rounded p-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="mb-1">🧾 My Invoices</h2>
                <p class="text-muted mb-0">View and track your SIP invoice records</p>
            </div>
            <form action="{{ route('invoices.generate') }}" method="POST">
                @csrf
                <button type="submit" class="btn btn-primary btn-generate">
                    <i class="bi bi-file-earmark-plus"></i> Generate Invoice
                </button>
            </form>
        </div>

        {{-- Success Message --}}
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        {{-- Invoice Table --}}
        @if($invoices->count() > 0)
            <div class="table-responsive">
                <table class="table table-striped table-bordered align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>SIP ID</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Scheduled For</th>
                            <th>Created At</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($invoices as $invoice)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $invoice->sip_id }}</td>
                                <td>₹{{ number_format($invoice->amount, 2) }}</td>
                                <td>
                                    <span class="badge bg-{{ 
                                        $invoice->status === 'success' ? 'success' : 
                                        ($invoice->status === 'failed' ? 'danger' : 'warning text-dark')
                                    }}">
                                        {{ ucfirst($invoice->status) }}
                                    </span>
                                </td>
                                <td>{{ \Carbon\Carbon::parse($invoice->scheduled_for)->format('d M Y h:i A') }}</td>
                                <td>{{ $invoice->created_at->format('d M Y') }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @else
            <div class="alert alert-info">
                No invoices found. Try generating one.
            </div>
        @endif
    </div>
</div>
@endsection
