<?php

namespace App\Livewire;

use Livewire\Component;

use App\Models\ProductCategory as categories;

class ProductCategories extends Component
{

    public $categories = [];
    public $total = '';

    public $body  = [


        'name' => '',
        'code' => ''

    ];

    public function addCategory(){

        categories::insert([
                "name" => $this->body['name'],
                "code" => $this->body['code'],

            ]);

    }



    public function render()
    {
        $this->categories = categories::orderby('created_at','desc')->get();
        return view('livewire.product-categories');
    }
}
