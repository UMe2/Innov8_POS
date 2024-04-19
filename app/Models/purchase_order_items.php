<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class purchase_order_items extends Model
{
    use HasFactory;


    public function PurchaseOrder()
    {
        return $this->belongsTo(PurchaseOrder::class);
    }
}
