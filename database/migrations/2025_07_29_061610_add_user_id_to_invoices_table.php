<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
public function up(): void
{
    Schema::table('invoices', function (Blueprint $table) {
        $table->unsignedBigInteger('user_id')->nullable()->after('id');
        // ❌ foreign key line hata di
    });
}

public function down(): void
{
    Schema::table('invoices', function (Blueprint $table) {
        $table->dropColumn('user_id');
    });
}

};
