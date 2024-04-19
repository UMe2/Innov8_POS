<?php

namespace App\Livewire;

use Livewire\Component;

use App\Models\PurchaseOrder as POrders;

use App\Models\purchase_order_items as Items;

use App\Models\Product;

use App\Models\Vendor;

use App\Models\notification;

use App\Models\ProductCategory as Categories;

use Auth;



class PurchaseOrder extends Component
{

    public $body =  [

        "invoice_no"=>'',
        "vendor"=>'',
        "title"=>'',
        "to_user"=>'HR',
        "category"=>'',
        "due_date"=>10,   
        "amount_due"=>0,
        "advance_fee"=>0,
        "payment_type"=>null

    ];

    public function resett(){


        $this->body =  [

            "invoice_no"=>'',
            "vendor"=>'',
            "title"=>'',
            "to_user"=>'HR',
            "category"=>'',
            "due_date"=>10,   
            "advance_fee"=>0,
            "amount_due"=>0,
            "payment_type"=>null
    
        ];

        $this->items =  [
            "product"=>'',
            "unit_price"=>null,
            "quantity"=>null,
            "total"=>''
            
        ];

        $this->items = [];
    }


    public function mount(){

        $this->products =  Product::all();
        $this->purchase_orders = POrders::where('from_user', Auth::id())->orderBy('created_at', 'desc')->take(5)->get();
        $this->categories = Categories::all();
        $this->vendors = Vendor::all();
        
    }

    public $products; 
    public $categories; 
    public $inputsearchproductcodes;

    public $rrr;

    public $productcodessearchresult=[];

    public $item =  [
        "product"=>'',
        "unit_price"=>null,
        "quantity"=>null,
        "total"=>''
        
    ];

    public $payment_type =  [
        "full", 
        "refund",
        "advance",
    ];


    public $items=[];


    public $vendors = [
       
    ];

    public $purchase_orders;

    public function addItem(){

      //  $this->item['total'] = $this->item['unit_price'] * $this->item['quantity'];
        $this->body['amount_due'] += $this->item['total'];
        array_push($this->items, (object)$this->item);
         $this->item =  [
            "product"=>'',
            "unit_price"=>null,
            "quantity"=>null,
            "total"=>0
            
        ];

    }


    public function selectPaymentType(){

        return 0;
    }
    public function deleteItem($index){

        $this->body['amount_due'] -= $this->items[$index-1]->total;
        if($index != 0)
            unset($this->items[$index-1]);
        else
        unset($this->items[0]);


    }

    public function calculateTotal(){

        $this->item['total'] = $this->item['unit_price'] * $this->item['quantity'];
    }

    public function submit(){

        $insert = new POrders();

        $notification = new Notification();

        $receivers=null;
        $privilege = null;

        if(Auth::id()<=4){
           $receivers = 6;
           $privilege = 3;
        }

        elseif(Auth::id()==6){
            $receivers = 5;

            $privilege = 3;

        }

        elseif(Auth::id()==7){
            $receivers = 5;
            $privilege = 4;
        }

        elseif(Auth::id()==5){
           $receivers = 5;
           $privilege = 5;

        }
     //   dd(json_encode($receivers));

        $insert->title = $this->body['title'];
        $insert->from_user =  Auth::id();
        $insert->to_user =  json_encode($receivers);
        $insert->type =  $this->body['payment_type'];;
        if(Auth::user()->privilege>4)
            $insert->status =  'approved';
        else
            $insert->status =  'pending';
            $insert->vendor_id =  $this->body['vendor'];
            $insert->inv_no =  $this->body['invoice_no'];
            $insert->privilege =  $privilege;
            $insert->amount_paid =  $this->body['advance_fee'];;
            $insert->product_category_id =  $this->body['category'];

            $insert->save();

            $purchase_order = $insert;

        foreach($this->items as $item){

            $insert = new Items();
            $insert->purchase_order_id = $purchase_order->id;
            $insert->item = $item->product;
            $insert->price = $item->unit_price;
            $insert->quantity = $item->quantity;
            $insert->save();
            
        }

        if(Auth::user()->privilege<5)
       { 
        $notification->user_id =   Auth::id();
        $notification->recipient =  $receivers;
        $notification->message =  'You have a purchase order awaiting your approval';
        $notification->type =  'Purchase Order';
        $notification->save();
        }

        else{

            $notification->user_id =   Auth::id();
            $notification->recipient =  $receivers;
            $notification->message =  'your purchase order is pending payment from the Account department';
            $notification->type =  'Purchase Order';
            $notification->save();
        }
       // $this->resett();
   
    }


    public function render()
    {
        $searchsuppliers = [];
      

            if(strlen($this->inputsearchproductcodes)>=2){
             
                $searchsuppliers = Categories::where('name', 'LIKE' , '%'.$this->inputsearchproductcodes.'%')
                                            ->orWhere('code', 'LIKE' , '%'.$this->inputsearchproductcodes.'%')
                                            ->get();

                                          
            }


        return view('livewire.purchase-order')->with(['searchsuppliers' => $searchsuppliers]);;
    }

}
