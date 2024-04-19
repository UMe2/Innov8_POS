<?php

namespace App\Livewire;

use Livewire\Component;

use Livewire\Attributes\On; 
use App\Models\PurchaseOrder as POrders;
use Auth;


class Myrequests extends Component
{
    public $purchase_orders;


    #[On('approve-request')]
    public function approve($id){

        POrders::where('id',$id)->update(array('status' => 'approved'));

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
       
        $this->purchase_orders = POrders::where('from_user', Auth::id())->orderby('created_at', 'desc')->get();
        
        return view('livewire.myrequests');
    }
}
