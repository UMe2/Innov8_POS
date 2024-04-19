<?php

namespace App\Livewire;


use Livewire\Component;
use Livewire\Attributes\On; 

use App\Models\PurchaseOrder as POrders;

use App\Models\notification;

class Requests extends Component
{

    public $purchase_orders;


    #[On('approve-request')]
    public function approve($id){

        $purchase_order = POrders::find($id);
    
        POrders::where('id',$id)->update(array('status' => 'approved'));
        
        $notification = new notification;
        $notification->user_id =   Auth::id();
        $notification->recipient =  $purchase_order->to_user;
        $notification->message =  'Your purchase order has been approved';
        $notification->type =  'purchased apprived';
        $notification->save();


    }

    #[On('paid-request')]
    public function paid($id){

        dd('dd');dd('dd');dd('dd');dd('dd');dd('dd');dd('dd');
        POrders::where('id',$id)->update(array('status' => 'paid'));

    }

    #[On('decline-request')]
    public function decline($id){

        POrders::where('id',$id)->update(array('status' => 'declined'));

    }

    public function render()
    {
        
        $this->purchase_orders = POrders::orderby('created_at', 'desc')->get();
        return view('livewire.requests');
    }
}
