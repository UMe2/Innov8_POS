<?php

namespace App\Livewire;

use Livewire\Component;

use App\Models\Vendor as V;

class Vendors extends Component
{

    public $vendors;
    public $body = [
        "name" => '',
        "address"=>''
    ];


    public function add(){

        V::insert([
            "name" => $this->body['name'],
            "address" => $this->body['address'],

        ]);

    }


    public function render()
    {

        $this->vendors = V::all();

        return view('livewire.vendors');
    }
}
