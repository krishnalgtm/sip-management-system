@extends('layouts.app')

@section('title', 'Create SIP')

@section('content')
<style>
    .form-container {
        max-width: 700px;
        margin: auto;
        background: #fff;
        border-radius: 20px;
        padding: 30px;
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.05);
    }

    .form-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .form-header h3 {
        font-weight: bold;
        color: #1c6dd0;
    }

    .btn-custom {
        border-radius: 30px;
        padding: 10px 30px;
        font-weight: 600;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }

    .alert ul {
        margin-bottom: 0;
    }
</style>

<div class="form-container">
    <div class="form-header">
        <h3><i class="bi bi-plus-circle"></i> Create a New SIP</h3>
        <p class="text-muted">Fill the form to start a new SIP investment</p>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if($errors->any())
        <div class="alert alert-danger">
            <strong>Form has errors:</strong>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form method="POST" action="{{ route('sips.store') }}">
        @csrf

        <div class="mb-3">
            <label class="form-label">Amount <span class="text-danger">*</span></label>
            <input type="number" name="amount" class="form-control" placeholder="Enter amount" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Frequency <span class="text-danger">*</span></label>
            <select name="frequency" class="form-select" id="frequencySelect" required>
                <option value="">-- Select Frequency --</option>
                <option value="daily">Daily</option>
                <option value="monthly">Monthly</option>
            </select>
        </div>

        <div class="mb-3" id="sipDayInput" style="display: none;">
            <label class="form-label">SIP Day (for Monthly)</label>
            <input type="number" name="sip_day" class="form-control" min="1" max="30" placeholder="Enter SIP day">
        </div>

        <div class="mb-3">
            <label class="form-label">Start Date <span class="text-danger">*</span></label>
            <input type="date" name="start_date" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">End Date <span class="text-danger">*</span></label>
            <input type="date" name="end_date" class="form-control" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary btn-custom">
                <i class="bi bi-check2-circle"></i> Submit & Create SIP
            </button>
        </div>
    </form>
</div>

<script>
    document.getElementById('frequencySelect').addEventListener('change', function () {
        document.getElementById('sipDayInput').style.display = this.value === 'monthly' ? 'block' : 'none';
    });
</script>
@endsection
