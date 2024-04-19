<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\PurchaseOrder as Orders;

class PurchaseOrderController extends Controller
{
    //

    public function AccountDepartmentRequests(){

        $purchase_orders = Orders::orderBy('created_at','desc')->get();
       return view('accountants_requests', compact('purchase_orders'));
    }
}
