<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
    'sip_id', 'user_id', 'scheduled_for', 'amount', 'status',
];
protected $casts = [
    'scheduled_for' => 'datetime',
];
    public function sip()
    {
        return $this->belongsTo(Sip::class);
    }
}

