<?php

namespace App\Livewire;

use Livewire\Component;

class Product extends Component
{

    public $categories= [];

    public $total =0;


    public function render()
    {
        return view('livewire.product');
    }
}
