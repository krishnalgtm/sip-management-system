@extends('layouts.app')

@section('content')
<style>
    .card-rounded {
        border-radius: 20px;
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.05);
    }

    .table thead th {
        vertical-align: middle;
        text-align: center;
    }

    .table td, .table th {
        vertical-align: middle;
        text-align: center;
    }

    .badge {
        font-size: 0.9rem;
        padding: 0.5em 1em;
        border-radius: 12px;
    }
</style>

<div class="container mt-5">
    <div class="card card-rounded p-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="mb-0">📈 Your SIPs</h3>
                <p class="text-muted">Here’s a summary of your current investments</p>
            </div>
            <a href="{{ route('sips.create') }}" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Create New SIP
            </a>
        </div>

        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        @if($sips->count())
            <div class="table-responsive">
                <table class="table table-bordered table-striped align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Amount</th>
                            <th>Frequency</th>
                            <th>SIP Day</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($sips as $sip)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>₹{{ number_format($sip->amount, 2) }}</td>
                            <td>{{ ucfirst($sip->frequency) }}</td>
                            <td>{{ $sip->frequency === 'monthly' ? $sip->sip_day : '-' }}</td>
                            <td>{{ \Carbon\Carbon::parse($sip->start_date)->format('d M Y') }}</td>
                            <td>{{ \Carbon\Carbon::parse($sip->end_date)->format('d M Y') }}</td>
                            <td>
                                <span class="badge bg-{{ $sip->status === 'active' ? 'success' : 'secondary' }}">
                                    {{ ucfirst($sip->status) }}
                                </span>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @else
            <div class="alert alert-info">
                No SIPs found. <a href="{{ route('sips.create') }}" class="btn btn-sm btn-outline-primary ms-2">Create one now</a>
            </div>
        @endif
    </div>
</div>
@endsection
