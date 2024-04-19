<?php

namespace App\Livewire;

use Livewire\Component;

use App\Models\PurchaseOrder as POrders;

use App\Models\Payment;

use App\Models\notification;

use Auth;

class ViewPurchaseOrder extends Component
{

    public $order = [
       
        "inv_no"=>null,
        "vendor"=>"null",
    ];

    public $total =0;

    public $comment_mode = false;
    public $comment_button ='Make Comment';

    public $CC =  null;




    public function mount($id){

        $this->order=POrders::find($id);
       
        // $total = 0;
        foreach($this->order->items as $item){

            $this->total +=$item->quantity * $item->price;

        }


        $user = $this->order->from_user; //Team::where('name', $order->from_user)->user->name;
        if($user=='Impact Lab' || $user== 'Admin (Eve)'){

            $this->CC = ['Accountants', 'GM', 'Deputy GM'];

        }

        else if($user=='HR'){

            $this->CC = ['Accountants', 'Deputy GM', 'GM'];
            
        }

        else if($user=='Deputy GM'){

            $this->CC = ['Accountants', 'HR'];

        }

        else if($user=='GM'){

            $this->CC = ['Deputy GM', 'HR'];
            
        }

        else{

            $this->CC = [];
        }
    }
 
    public function approve($id)
    {
        // ...
      
        $this->dispatch('approve-request',  id : $id )->to(Requests::class);
        
    }

    public function ttt()
    {
        // ...
        dd('ss');    
    }

    public function decline($id)
    {
        // ...
 
        $this->dispatch('decline-request',  id : $id )->to(Requests::class);
     dd(   $this->dispatch('paid-request',  id : $id )->to(Requests::class));

    }

    public function paid($id)
    {
        // ...
        $order = POrders::find($id);
        POrders::where('id',$id)->update(array('status' => 'paid'));

        $payment = new Payment;

        $payment->purchase_order_id = $id;
        $payment->amount = $order->amount_paid;



        $notification = new notification;
        $notification->user_id =   Auth::id();
        $notification->recipient =  $receivers;
        $notification->message =  'Your purchase order has been paid';
        $notification->type =  'paid';
        $notification->save();
 
       // $this->dispatch('paid-request',  id : $id )->to(Requests::class);
      //  POrders::where('id',$id)->update(array('status' => 'paid'));

    }


    public function comment()
    {
        // ...
 
        $this->comment_mode = !$this->comment_mode;

        if($this->comment_mode)
            $this->comment_button='Submit';
        else
            $this->comment_button ='Make Comment';

    }



    public function render()
    {
        
        $user = $this->order->from_user; //Team::where('name', $order->from_user)->user->name;
        if($user=='Impact Lab' || $user== 'Admin (Eve)'){

            $this->CC = ['Accountants', 'GM', 'Deputy GM'];
    
        }

        else if($user=='HR'){
            
            $this->CC = ['Accountants'];
            
        }

        else if($user=='Deputy GM'){
            $this->CC = ['Accountants', 'HR'];
            

        }

        else if($user=='GM'){
            $this->CC = ['Deputy GM', 'HR'];
            
        }

        else{
            $this->CC = [];
        }


        return view('livewire.view-purchase-order');
    }
}
