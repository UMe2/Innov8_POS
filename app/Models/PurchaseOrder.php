<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends Model
{
    use HasFactory;

    public function items()
    {
        return $this->hasMany(purchase_order_items::class);

    }

    public function category()
    {
        return  $this->belongsTo('App\Models\ProductCategory', 'product_category_id');

        

    }


    // public function toUser()
    // {
    //     if($this->to_user=='3,4')
    //     return 'eeeeeeeeeeeeee';
    //     return  $this->belongsTo('App\Models\Team', 'to_user');

    // }


    public function toUser()
    {
     
       
        return  $this->belongsTo('App\Models\User', 'to_user');

        
    }

    public function fromUser()
    {
     
       
        return  $this->belongsTo('App\Models\User', 'from_user');

        
    }


    public function vendor()
    {
        return  $this->belongsTo(Vendor::class);

        

    }
}
