<div>
    {{-- In work, do what you enjoy. --}}
    <div class="container mx-auto py-8">
	
        <h2 class="text-2xl font-semibold mb-4">Purchase Order Form</h2>
       
    </div>
    



    <div class="antialiased sans-serif min-h-screen bg-white" style="min-height: 900px">

	<style>
		[x-cloak] {
			display: none;
		}

		@media print {
			.no-printme  {
				display: none;
			}
			.printme  {
				display: block;
			}
			body {
				line-height: 1.2;
			}
		}

		@page {
			size: A4 portrait;
			counter-increment: page;
		}

		/* Datepicker */
		.date-input {
			background-color: #fff;
			border-radius: 10px;
			padding: 0.5rem 1rem;
			z-index: 2000;
			margin: 3px 0 0 0;
			border-top: 1px solid #eee;
			box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1),
				0 4px 6px -2px rgba(0, 0, 0, 0.05);
		}
		.date-input.is-hidden {
			display: none;
		}
		.date-input .pika-title {
			padding: 0.5rem;
			width: 100%;
			text-align: center;
		}
		.date-input .pika-prev,
		.date-input .pika-next {
			margin-top: 0;
			/* margin-top: 0.5rem; */
			padding: 0.2rem 0;
			cursor: pointer;
			color: #4299e1;
			text-transform: uppercase;
			font-size: 0.85rem;
		}
		.date-input .pika-prev:hover,
		.date-input .pika-next:hover {
			text-decoration: underline;
		}
		.date-input .pika-prev {
			float: left;
		}
		.date-input .pika-next {
			float: right;
		}
		.date-input .pika-label {
			display: inline-block;
			font-size: 0;
		}
		.date-input .pika-select-month,
		.date-input .pika-select-year {
			display: inline-block;
			border: 1px solid #ddd;
			color: #444;
			background-color: #fff;
			border-radius: 10px;
			font-size: 0.9rem;
			padding-left: 0.5em;
			padding-right: 0.5em;
			padding-top: 0.25em;
			padding-bottom: 0.25em;
			appearance: none;
		}
		.date-input .pika-select-month:focus,
		.date-input .pika-select-year:focus {
			border-color: #cbd5e0;
			outline: none;
		}
		.date-input .pika-select-month {
			margin-right: 0.25em;
		}
		.date-input table {
			width: 100%;
			border-collapse: collapse;
			margin-bottom: 0.2rem;
		}
		.date-input table th {
			width: 2em;
			height: 2em;
			font-weight: normal;
			color: #718096;
			text-align: center;
		}
		.date-input table th abbr {
			text-decoration: none;
		}
		.date-input table td {
			padding: 2px;
		}
		.date-input table td button {
			/* border: 1px solid #e2e8f0; */
			width: 1.8em;
			height: 1.8em;
			text-align: center;
			color: #555;
			border-radius: 10px;
		}
		.date-input table td button:hover {
			background-color: #bee3f8;
		}
		.date-input table td.is-today button {
			background-color: #ebf8ff;
		}
		.date-input table td.is-selected button {
			background-color: #3182ce;
		}
		.date-input table td.is-selected button {
			color: white;
		}
		.date-input table td.is-selected button:hover {
			color: white;
		}
	</style>

	<div class="border-t-8 border-gray-700 h-2"></div>
	<div 
		class="container mx-auto py-6 px-4"
		x-data="invoices()"
		x-init="generateInvoiceNumber(111111, 999999);"
		x-cloak
	>
		<div class="flex justify-between">
			<!-- <h2 class="text-2xl font-bold mb-6 pb-2 tracking-wider uppercase">Purchase Order</h2> -->
			<div>
				<div class="relative mr-4 inline-block">
					<div class="text-gray-500 cursor-pointer w-10 h-10 rounded-full bg-gray-100 hover:bg-gray-300 inline-flex items-center justify-center" @mouseenter="showTooltip = true" @mouseleave="showTooltip = false" @click="printInvoice()">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-printer" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<rect x="0" y="0" width="24" height="24" stroke="none"></rect>
							<path d="M17 17h2a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-14a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h2" />
							<path d="M17 9v-4a2 2 0 0 0 -2 -2h-6a2 2 0 0 0 -2 2v4" />
							<rect x="7" y="13" width="10" height="8" rx="2" />
						</svg>				  
					</div>
					<div x-show.transition="showTooltip" class="z-40 shadow-lg text-center w-32 block absolute right-0 top-0 p-2 mt-12 rounded-lg bg-gray-800 text-white text-xs">
						Print this invoice!
					</div>
				</div>
				
				<div class="relative inline-block">
					<div class="text-gray-500 cursor-pointer w-10 h-10 rounded-full bg-gray-100 hover:bg-gray-300 inline-flex items-center justify-center" @mouseenter="showTooltip2 = true" @mouseleave="showTooltip2 = false" @click="window.location.reload()">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-refresh" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<rect x="0" y="0" width="24" height="24" stroke="none"></rect>
							<path d="M20 11a8.1 8.1 0 0 0 -15.5 -2m-.5 -5v5h5" />
							<path d="M4 13a8.1 8.1 0 0 0 15.5 2m.5 5v-5h-5" />
						</svg>	  
					</div>
					<div x-show.transition="showTooltip2" class="z-40 shadow-lg text-center w-32 block absolute right-0 top-0 p-2 mt-12 rounded-lg bg-gray-800 text-white text-xs">
						Reload Page
					</div>
				</div>
			</div>
		</div>

		<div class="flex mb-8 justify-between">
			<div class="w-2/4">
				<div class="mb-2 md:mb-1 md:flex items-center">
					<label class="w-32 text-gray-800 block font-bold text-sm uppercase tracking-wide">Invoice No.</label>
					<span class="mr-4 inline-block hidden md:block">:</span>
					<div class="flex-1">
					<input wire:model='body.invoice_no' class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-48 py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" placeholder="eg. #INV-100001">
					</div>
				</div>

				<div class="mb-2 md:mb-1 md:flex items-center">
					<label class="w-32 text-gray-800 block font-bold text-sm uppercase tracking-wide">Invoice Date</label>
					<span class="mr-4 inline-block hidden md:block">:</span>
					<div class="flex-1">
					<input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-48 py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500 js-datepicker" type="text" id="datepicker1" placeholder="eg. 17 Feb, 2020" x-model="invoiceDate" x-on:change="invoiceDate = document.getElementById('datepicker1').value" autocomplete="off" readonly>
					</div>
				</div>

				<div class="mb-2 md:mb-1 md:flex items-center">
					<label class="w-32 text-gray-800 block font-bold text-sm uppercase tracking-wide">Due date</label>
					<span class="mr-4 inline-block hidden md:block">:</span>
					<div class="flex-1">
					<input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-48 py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500 js-datepicker-2" id="datepicker2" type="text" placeholder="eg. 17 Mar, 2020" x-model="invoiceDueDate" x-on:change="invoiceDueDate = document.getElementById('datepicker2').value" autocomplete="off" readonly>
					</div>
				</div>
			</div>
			<div>
				<div class="w-32 h-32 mb-1 border rounded-lg overflow-hidden relative bg-gray-100">
					<img id="image" class="object-cover w-full h-32" src="https://placehold.co/300x300/e2e8f0/e2e8f0" />
					
					<div class="absolute top-0 left-0 right-0 bottom-0 w-full block cursor-pointer flex items-center justify-center" onClick="document.getElementById('fileInput').click()">
						<button type="button"
							style="background-color: rgba(255, 255, 255, 0.65)"
							class="hover:bg-gray-100 text-gray-700 font-semibold py-2 px-4 text-sm border border-gray-300 rounded-lg shadow-sm"
						>
							<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-camera" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
								<rect x="0" y="0" width="24" height="24" stroke="none"></rect>
								<path d="M5 7h1a2 2 0 0 0 2 -2a1 1 0 0 1 1 -1h6a1 1 0 0 1 1 1a2 2 0 0 0 2 2h1a2 2 0 0 1 2 2v9a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-9a2 2 0 0 1 2 -2" />
								<circle cx="12" cy="13" r="3" />
							</svg>							  
						</button>
					</div>
				</div>
				<input name="photo" id="fileInput" accept="image/*" class="hidden" type="file" onChange="let file = this.files[0]; 
					var reader = new FileReader();

					reader.onload = function (e) {
						document.getElementById('image').src = e.target.result;
						document.getElementById('image2').src = e.target.result;
					};
				
					reader.readAsDataURL(file);
				">
			</div>
		</div>
  <div style="position:relative">
							
						</div>
					
		<div class="flex flex-wrap justify-between mb-8">
            
			<div class="w-full md:w-1/3 mb-2 md:mb-0">
			
						
                <div class="mb-4">
                    <label for="supplier" class="block mb-1">Category</label>
						<input wire:model.live="inputsearchproductcodes" class="form-control relative rounded" type="text" placeholder="search..."/>

					  
						<div style="position:absolute; z-index:100">
							@if(strlen($inputsearchproductcodes)>2)
							@if(count($searchsuppliers)>0)
								<ul class="list-group">
								@foreach($searchsuppliers as $productcode)
								<li class="list-group-item list-group-item-action"><span wire:click="selectsupplier({{$productcode->id}}}})">{{$productcode->name}} : {{$productcode->code}}</span></li>
								@endforeach
								</ul>
							@else
								<li class="list-group-item">Found nothing...</li>
							@endif
							@endif
          				</div>











					<input type="text" wire:model='body.category' placeholder="search" class="input-group-text rounded-0 rounded-circle" hidden>
                    <select wire:model="body.category" id="supplier" name="supplier" required
                            class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                        <option value="" disabled selected>Product Codes</option>
                        @foreach($categories as $category)
                            <option value="{{$category->id}}">{{$category->name}}</option>
                        @endforeach
                        <!-- Add more options as needed -->
                    </select>
                   
                </div>

                <div class="mb-4">
                    <label for="supplier" class="block mb-1">Vendor:</label>
                    <input type="hidden" hidden  type="text" id="product_name" name="product_name" required
                        class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                    <select wire:model="body.vendor" id="supplier" name="supplier" required
                            class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                        <option value="" disabled selected>Select Supplier</option>
                        @foreach($vendors as $vendor)
                            <option value="{{$vendor->id}}">{{$vendor->name}}</option>
                        @endforeach
                        <!-- Add more options as needed -->
                    </select>
                </div>
			</div>
			<div class="w-full md:w-1/3">
		<div class="max-w-md bg-white rounded-lg shadow-md p-8 mx-auto">
            <div class="mb-4">
                <label for="supplier" class="block mb-1">Item:</label>
                <input wire:model="item.product" type="text" id="product_name" name="product_name" 
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                <select wire:model="item.product" id="supplier" name="supplier" required 
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500" hidden>
                    <option value="" disabled selected>Select Product</option>
                    @foreach($products as $product)
                        <option value="{{$product}}">{{$product}}</option>
                    @endforeach
                   
                    <!-- Add more options as needed -->
                </select>
            </div>
           
            <div class="mb-4">
                <label  for="quantity" class="block mb-1">Quantity:</label>
                <input wire:model="item.quantity" type="number" id="quantity" name="quantity" required
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="unit_price" class="block mb-1">Unit Price:</label>
                <input  wire:model="item.unit_price" type="number" id="unit_price" name="unit_price" required
                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="total_price" class="block mb-1">Total Price:</label>
                <input wire:click="calculateTotal" wire:model="item.total" type="text" id="total_price" name="total_price" readonly
                    class="w-full px-4 py-2 border rounded-md focus:outline-none bg-gray-100">
            </div>

            <button wire:click="addItem()"
                    class="w-full bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600 focus:outline-none focus:bg-green-600">
                  add
            </button>
        </div>
				{{-- <label class="text-gray-800 block mb-1 font-bold text-sm uppercase tracking-wide">Shipment:</label>
				<input class="mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" placeholder="Ship To" x-model="from.name">

				<input class="mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" placeholder="Ship Via" x-model="from.address">

				<input class="mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" placeholder="Additional info" x-model="from.extra"> --}}
			</div>
		</div>

		

		<div class="flex -mx-1 border-b py-2 items-start">
			<div class="flex-1 px-1">
				<p class="text-gray-800 uppercase tracking-wide text-sm font-bold">Description</p>
			</div>

			<div class="px-1 w-20 text-right">
				<p class="text-gray-800 uppercase tracking-wide text-sm font-bold">Units</p>
			</div>

			<div class="px-1 w-32 text-right">
				<p class="leading-none">
					<span class="block uppercase tracking-wide text-sm font-bold text-gray-800">Unit Price</span>
					<span class="font-medium text-xs text-gray-500">(Incl. GST)</span>
				</p>
			</div>

			<div class="px-1 w-32 text-right">
				<p class="leading-none">
					<span class="block uppercase tracking-wide text-sm font-bold text-gray-800">Total </span>
					<span class="font-medium text-xs text-gray-500">(Incl. GST)</span>
				</p>
			</div>

			<div class="px-1 w-20 text-center">
			</div>
		</div>
	    <div>
            @foreach($items as $item)
                <div class="flex -mx-1 py-2 border-b">
                    <div class="flex-1 px-1">
                        <p class="text-gray-800">{{$item->product}}</p>
                    </div>
                    <div class="px-1 w-20 text-right">
                        <p class="text-gray-800" >{{$item->unit_price}}</p>
                    </div>

                    <div class="px-1 w-32 text-right">
                        <p class="text-gray-800" >{{$item->quantity}}</p>
                    </div>

                    <div class="px-1 w-32 text-right">
                        <p class="text-gray-800" >{{$item->total}}</p>
                    </div>

                    <div class="px-1 w-20 text-right">
						<button class="text-red-500 hover:text-red-600 text-sm font-semibold" wire:click="deleteItem({{$loop->iteration}})">Delete </button>
                    </div>
                </div>
            @endforeach
        </div>
		
    <div id="default-modal" tabindex="1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
        <div class="relative p-4 w-full max-w-2xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
				<div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
					<h3 class="text-xl font-semibold text-gray-900 dark:text-white">
						Terms of Service
					</h3>
					<button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal">
						<svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
							<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
						</svg>
						<span class="sr-only">Close modal</span>
					</button>
				</div>
            <!-- Modal body -->
				<div class="p-4 md:p-5 space-y-4">
					<p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
					</p>
					<p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
						 Union. It requires organizations to notify users as soon as possible of high-risk data breaches that could personally affect them.
					</p>
				</div>
            <!-- Modal footer -->
				<div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
					<button data-modal-hide="default-modal" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">I accept</button>
					<button data-modal-hide="default-modal" type="button" class="ms-3 text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">Decline</button>
				</div>
        	</div>
        </div>          
    </div>



		<div class="py-2 ml-auto mt-5 w-full sm:w-2/4 lg:w-1/4">
			<div class="flex justify-between mb-3">
				<div class="text-gray-800 text-right flex-1">Total </div>
				<div class="text-right w-40">
					<div class="text-gray-800 font-medium">{{$body["amount_due"]}}</div>
				</div>
			</div>
            <div class="flex justify-between mb-3">
				<div class="text-gray-800 text-right flex-1">Total (Shipping & Handling) </div>
				<div class="text-right w-40">
					<div class="text-gray-800 font-medium" ></div>
				</div>
			</div>
			<div class="flex justify-between mb-4">
            <div class="text-sm text-gray-600 text-right flex-1">Total (Tax incl)</div>
				
				<div class="text-right w-40">
					<div class="text-sm text-gray-600" ></div>
				</div>
			</div>
            
            
			<div class="py-2 border-t border-b">
				<div class="flex justify-between">
					<div class="text-xl text-gray-600 text-right flex-1">Amount due</div>
					<div class="text-right w-40">
						<div class="text-xl text-gray-800 font-bold">{{$body["amount_due"]}}</div>
					</div>
				</div>
			</div>

				@if($body['payment_type'] =='advance')
					<input wire:model='body.advance_fee' type="text" placeholder="enter amount to be paid" class="form-control rounded">
				@endif
		</div>

	
		  <div class="grid grid-cols-6">


                    <label for="supplier" class="">Payment type:</label>

                    <select wire:model="body.payment_type" wire:change="selectPaymentType" id="supplier" name="supplier" required
                            class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                        <option value="ssss" selected readonly>Select Payment Mode</option>
                        @foreach($payment_type as $payment)
                            <option value="{{$payment}}">{{$payment}}</option>
                        @endforeach
                        <!-- Add more options as needed -->
                    </select>
        </div>
       
				


			@if($body['payment_type'])
	    <button wire:click='submit()' data-modal-target="default-modal" data-modal-toggle="default-modal" class="px-4 py-2 block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
            Submit
        </button>
		@endif


		
       

        <hr>
        <hr>
        <br>
        <h3>Recent</h3>

		<!-- Print Template -->
		<div id="js-print-template" x-ref="printTemplate" class="hidden">
			<div class="mb-8 flex justify-between">
				<div>
					<h2 class="text-3xl font-bold mb-6 pb-2 tracking-wider uppercase">Invoice</h2>

					<div class="mb-1 flex items-center">
						<label class="w-32 text-gray-800 block font-bold text-xs uppercase tracking-wide">Invoice No.</label>
						<span class="mr-4 inline-block">:</span>
						<div x-text="invoiceNumber"></div>
					</div>
		
					<div class="mb-1 flex items-center">
						<label class="w-32 text-gray-800 block font-bold text-xs uppercase tracking-wide">Invoice Date</label>
						<span class="mr-4 inline-block">:</span>
						<div x-text="invoiceDate"></div>
					</div>
		
					<div class="mb-1 flex items-center">
						<label class="w-32 text-gray-800 block font-bold text-xs uppercase tracking-wide">Due date</label>
						<span class="mr-4 inline-block">:</span>
						<div x-text="invoiceDueDate"></div>
					</div>
				</div>
				<div class="pr-5">
					<div class="w-32 h-32 mb-1 overflow-hidden">
						<img id="image2" class="object-cover w-20 h-20" />
					</div>
				</div>
			</div>

			<div class="flex justify-between mb-10">
				<div class="w-1/2">
					<label class="text-gray-800 block mb-2 font-bold text-xs uppercase tracking-wide">Bill/Ship To:</label>
					<div>
						<div x-text="billing.name"></div>
						<div x-text="billing.address"></div>
						<div x-text="billing.extra"></div>
					</div>
				</div>
				<div class="w-1/2">
					<label class="text-gray-800 block mb-2 font-bold text-xs uppercase tracking-wide">From:</label>
					<div>
						<div x-text="from.name"></div>
						<div x-text="from.address"></div>
						<div x-text="from.extra"></div>
					</div>
				</div>
			</div>

			<div class="flex flex-wrap -mx-1 border-b py-2 items-start">
				<div class="flex-1 px-1">
					<p class="text-gray-600 uppercase tracking-wide text-xs font-bold">Description</p>
				</div>
	
				<div class="px-1 w-32 text-right">
					<p class="text-gray-600 uppercase tracking-wide text-xs font-bold">Units</p>
				</div>
	
				<div class="px-1 w-32 text-right">
					<p class="leading-none">
						<span class="block uppercase tracking-wide text-xs font-bold text-gray-600">Unit Price</span>
						<span class="font-medium text-xs text-gray-500">(Incl. GST)</span>
					</p>
				</div>
	
				<div class="px-1 w-32 text-right">
					<p class="leading-none">
						<span class="block uppercase tracking-wide text-xs font-bold text-gray-600">Amount</span>
						<span class="font-medium text-xs text-gray-500">(Incl. GST)</span>
					</p>
				</div>
			</div>
			<template x-for="invoice in items" :key="invoice.id">
				<div class="flex flex-wrap -mx-1 py-2 border-b">
					<div class="flex-1 px-1">
						<p class="text-gray-800" x-text="invoice.name"></p>
					</div>
	
					<div class="px-1 w-32 text-right">
						<p class="text-gray-800" x-text="invoice.qty"></p>
					</div>
	
					<div class="px-1 w-32 text-right">
						<p class="text-gray-800" x-text="numberFormat(invoice.rate)"></p>
					</div>
	
					<div class="px-1 w-32 text-right">
						<p class="text-gray-800" x-text="numberFormat(invoice.total)"></p>
					</div>
				</div>
			</template>

			<div class="py-2 ml-auto mt-20" style="width: 320px">
				<div class="flex justify-between mb-3">
					<div class="text-gray-800 text-right flex-1">Total incl. GST</div>
					<div class="text-right w-40">
						<div class="text-gray-800 font-medium" x-html="netTotal"></div>
					</div>
				</div>
				<div class="flex justify-between mb-4">
					<div class="text-sm text-gray-600 text-right flex-1">GST(18%) incl. in Total</div>
					<div class="text-right w-40">
						<div class="text-sm text-gray-600" x-html="totalGST"></div>
					</div>
				</div>
			
				<div class="py-2 border-t border-b">
					<div class="flex justify-between">
						<div class="text-xl text-gray-600 text-right flex-1">Amount due</div>
						<div class="text-right w-40">
							<div class="text-xl text-gray-800 font-bold" x-html="netTotal"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Print Template -->

		<!-- Modal -->
		<div style=" background-color: rgba(0, 0, 0, 0.8)" class="fixed z-40 top-0 right-0 left-0 bottom-0 h-full w-full" x-show.transition.opacity="openModal">
			<div class="p-4 max-w-xl mx-auto relative absolute left-0 right-0 overflow-hidden mt-24">
				<div class="shadow absolute right-0 top-0 w-10 h-10 rounded-full bg-white text-gray-500 hover:text-gray-800 inline-flex items-center justify-center cursor-pointer"
					x-on:click="openModal = !openModal">
					<svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
						<path
							d="M16.192 6.344L11.949 10.586 7.707 6.344 6.293 7.758 10.535 12 6.293 16.242 7.707 17.656 11.949 13.414 16.192 17.656 17.606 16.242 13.364 12 17.606 7.758z" />
					</svg>
				</div>

				<div class="shadow w-full rounded-lg bg-white overflow-hidden w-full block p-8">
					
					<h2 class="font-bold text-2xl mb-6 text-gray-800 border-b pb-2">Fill your services</h2>
				 
					<div class="mb-4">
						<label class="text-gray-800 block mb-1 font-bold text-sm uppercase tracking-wide">Description</label>
						<input class="mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" x-model="item.name">
					</div>

					<div class="flex">
						<div class="mb-4 w-32 mr-2">
							<label class="text-gray-800 block mb-1 font-bold text-sm uppercase tracking-wide">Units</label>
							<input class="text-right mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" x-model="item.qty">
						</div>
			
						<div class="mb-4 w-32 mr-2">
							<label class="text-gray-800 block mb-1 font-bold text-sm uppercase tracking-wide">Unit Price</label>
							<input class="text-right mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" x-model="item.rate">
						</div>

						<div class="mb-4 w-32">
							<label class="text-gray-800 block mb-1 font-bold text-sm uppercase tracking-wide">Amount</label>
							<input class="text-right mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text">
						</div>
					</div>
			
					<div class="mb-4 w-32"> 
						<div class="relative">
							<label class="text-gray-800 block mb-1 font-bold text-sm uppercase tracking-wide">GST</label>
							<select class="text-gray-700 block appearance-none w-full bg-gray-200 border-2 border-gray-200 px-4 py-2 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-blue-500" x-model="item.gst">
								<option value="5">GST 5%</option>
								<option value="12">GST 12%</option>
								<option value="18">GST 18%</option>
								<option value="28">GST 28%</option>
							</select>
							<div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-600">
								<svg class="fill-current h-4 w-4 mt-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
							</div>
						</div>
					</div>
	
					<div class="mt-8 text-right">
						<button type="button" class="bg-white hover:bg-gray-100 text-gray-700 font-semibold py-2 px-4 border border-gray-300 rounded shadow-sm mr-2" @click="openModal = !openModal">
							Cancel
						</button>	
						<button type="button" class="bg-gray-800 hover:bg-gray-700 text-white font-semibold py-2 px-4 border border-gray-700 rounded shadow-sm" @click="addItem()">
							Add Item
						</button>	
					</div>
				</div>
			</div>
		</div>
		<!-- /Modal -->
	</div>


<section class="container px-8 mx-auto">
    <div class="flex flex-col">
        <div class="mx-4 -my-2 overflow-x-auto sm:-mx-8 lg:-mx-8">
            <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                <div class="overflow-hidden border border-gray-200 dark:border-gray-700 md:rounded-lg">
                    <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                        <thead class="bg-gray-50 dark:bg-gray-800">
                            <tr>
                                <th scope="col" class="py-3.5 px-4 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                    <div class="flex items-center gap-x-3">
                                        <input type="checkbox" class="text-blue-500 border-gray-300 rounded dark:bg-gray-900 dark:ring-offset-gray-900 dark:border-gray-700">
                                        <button class="flex items-center gap-x-2">
                                            <span>Invoice</span>

                                            <svg class="h-3" viewBox="0 0 10 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.13347 0.0999756H2.98516L5.01902 4.79058H3.86226L3.45549 3.79907H1.63772L1.24366 4.79058H0.0996094L2.13347 0.0999756ZM2.54025 1.46012L1.96822 2.92196H3.11227L2.54025 1.46012Z" fill="currentColor" stroke="currentColor" stroke-width="0.1" />
                                                <path d="M0.722656 9.60832L3.09974 6.78633H0.811638V5.87109H4.35819V6.78633L2.01925 9.60832H4.43446V10.5617H0.722656V9.60832Z" fill="currentColor" stroke="currentColor" stroke-width="0.1" />
                                                <path d="M8.45558 7.25664V7.40664H8.60558H9.66065C9.72481 7.40664 9.74667 7.42274 9.75141 7.42691C9.75148 7.42808 9.75146 7.42993 9.75116 7.43262C9.75001 7.44265 9.74458 7.46304 9.72525 7.49314C9.72522 7.4932 9.72518 7.49326 9.72514 7.49332L7.86959 10.3529L7.86924 10.3534C7.83227 10.4109 7.79863 10.418 7.78568 10.418C7.77272 10.418 7.73908 10.4109 7.70211 10.3534L7.70177 10.3529L5.84621 7.49332C5.84617 7.49325 5.84612 7.49318 5.84608 7.49311C5.82677 7.46302 5.82135 7.44264 5.8202 7.43262C5.81989 7.42993 5.81987 7.42808 5.81994 7.42691C5.82469 7.42274 5.84655 7.40664 5.91071 7.40664H6.96578H7.11578V7.25664V0.633865C7.11578 0.42434 7.29014 0.249976 7.49967 0.249976H8.07169C8.28121 0.249976 8.45558 0.42434 8.45558 0.633865V7.25664Z" fill="currentColor" stroke="currentColor" stroke-width="0.3" />
                                            </svg>
                                        </button>
                                    </div>
                                </th>

                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                    Date
                                </th>

                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                    Status
                                </th>

                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                    Receipient
                                </th>

                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                    Type
                                </th>

                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                    Category
                                </th>

                                <th scope="col" class="relative py-3.5 px-4">
                                    <span class="sr-only">Actions</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700 dark:bg-gray-900">
                        @foreach($purchase_orders as $request)
							<tr>
								<td class="px-4 py-4 text-sm font-medium text-gray-700 dark:text-gray-200 whitespace-nowrap">
									<div class="inline-flex items-center gap-x-3">
										<input type="checkbox" class="text-blue-500 border-gray-300 rounded dark:bg-gray-900 dark:ring-offset-gray-900 dark:border-gray-700">
										<span>#{{$request->inv_no}}</span>
									</div>
								</td>
								<td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">{{$request->created_at}}</td>
								<td class="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap ">
									<div class="inline-flex items-center px-3 py-1 text-gray-500 rounded-full gap-x-2 bg-gray-100/60 dark:bg-gray-800 {{$request->status=='pending'?'bg-yellow-200':'bg-green-100'}}">
										<svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M4.5 7L2 4.5M2 4.5L4.5 2M2 4.5H8C8.53043 4.5 9.03914 4.71071 9.41421 5.08579C9.78929 5.46086 10 5.96957 10 6.5V10" stroke="#667085" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
										</svg>

										<h2 class="text-sm text-grey font-normal ">{{$request->status}}</h2>
									</div>
								</td>
								<td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">
									<div class="flex items-center gap-x-2">
										<div>
											<h2 class="text-sm font-medium text-gray-800 dark:text-white ">{{$request->toUser->name}}</h2>
											
										</div>
									</div>
								</td>
								<td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">
									<div class="flex items-center gap-x-2">
										<div>
											<h2 class="text-sm font-medium text-gray-800 dark:text-white ">Purchase</h2>
											
										</div>
									</div>
								</td>
								<td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">{{$request->category->name??''}}</td>
								<td class="px-4 py-4 text-sm whitespace-nowrap">
									<div class="flex items-center gap-x-6">
										<a href="{{Route('order.view', $request->id)}}" class="text-gray-500 transition-colors duration-200 dark:hover:text-indigo-500 dark:text-gray-300 hover:text-indigo-500 focus:outline-none">
											view
										</a>
										<button class="text-blue-500 transition-colors duration-200 hover:text-indigo-500 focus:outline-none">
											
										</button>
									</div>
								</td>
							</tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="flex items-center justify-between mt-6">
        <a href="#" class="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 dark:bg-gray-900 dark:text-gray-200 dark:border-gray-700 dark:hover:bg-gray-800">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 rtl:-scale-x-100">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18" />
            </svg>

            <span>
                previous
            </span>
        </a>

        <div class="items-center hidden md:flex gap-x-3">
            <a href="#" class="px-2 py-1 text-sm text-blue-500 rounded-md dark:bg-gray-800 bg-blue-100/60">1</a>
            <a href="#" class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100">2</a>
            <a href="#" class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100">3</a>
            <a href="#" class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100">...</a>
            <a href="#" class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100">12</a>
            <a href="#" class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100">13</a>
            <a href="#" class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100">14</a>
        </div>

        <a href="#" class="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 dark:bg-gray-900 dark:text-gray-200 dark:border-gray-700 dark:hover:bg-gray-800">
            <span>
                Next
            </span>

            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 rtl:-scale-x-100">
                <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3" />
            </svg>
        </a>
    </div>
</section>


</div>




<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
	<script>
        window.addEventListener('DOMContentLoaded', function() {
			const today = new Date();
		
            var picker = new Pikaday({
				keyboardInput: false,
				field: document.querySelector('.js-datepicker'),
				format: 'MMM D YYYY',
				theme: 'date-input',
				i18n: {
					previousMonth: "Prev",
					nextMonth: "Next",
					months: [
						"Jan",
						"Feb",
						"Mar",
						"Apr",
						"May",
						"Jun",
						"Jul",
						"Aug",
						"Sep",
						"Oct",
						"Nov",
						"Dec"
					],
					weekdays: [
						"Sunday",
						"Monday",
						"Tuesday",
						"Wednesday",
						"Thursday",
						"Friday",
						"Saturday"
					],
					weekdaysShort: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
				}
			});
			picker.setDate(new Date());

			var picker2 = new Pikaday({
				keyboardInput: false,
				field: document.querySelector('.js-datepicker-2'),
				format: 'MMM D YYYY',
				theme: 'date-input',
				i18n: {
					previousMonth: "Prev",
					nextMonth: "Next",
					months: [
						"Jan",
						"Feb",
						"Mar",
						"Apr",
						"May",
						"Jun",
						"Jul",
						"Aug",
						"Sep",
						"Oct",
						"Nov",
						"Dec"
					],
					weekdays: [
						"Sunday",
						"Monday",
						"Tuesday",
						"Wednesday",
						"Thursday",
						"Friday",
						"Saturday"
					],
					weekdaysShort: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
				}
			});
			picker2.setDate(new Date());
		});

		function invoices() {
			return {
				items: [],
				invoiceNumber: 0,
				invoiceDate: '',
				invoiceDueDate: '',

				totalGST: 0,
				netTotal: 0,

				item: {
					id: '',
					name: '',
					qty: 0,
					rate: 0,
					total: 0,
					gst: 18
				},

				billing: {
					name: '',
					address: '',
					extra: ''
				},
				from: {
					name: '',
					address: '',
					extra: ''
				},

				showTooltip: false,
				showTooltip2: false,
				openModal: false,

				addItem() {
					this.items.push({
						id: this.generateUUID(),
						name: this.item.name,
						qty: this.item.qty,
						rate: this.item.rate,
						gst: this.calculateGST(this.item.gst, this.item.rate),
						total: this.item.qty * this.item.rate
					})

					this.itemTotal();
					this.itemTotalGST();

					this.item.id = '';
					this.item.name = '';
					this.item.qty = 0;
					this.item.rate = 0;
					this.item.gst = 18;
					this.item.total = 0;
				},

				deleteItem(uuid) {
					this.items = this.items.filter(item => uuid !== item.id);

					this.itemTotal();
					this.itemTotalGST();
				},

				itemTotal() {
					this.netTotal = this.numberFormat(this.items.length > 0 ? this.items.reduce((result, item) => {
						return result + item.total;
					}, 0) : 0);
				},

				itemTotalGST() {
                    this.totalGST =  this.numberFormat(this.items.length > 0 ? this.items.reduce((result, item) => {
						return result + (item.gst * item.qty);
					}, 0) : 0);
				},

				calculateGST(GSTPercentage, itemRate) {
					return this.numberFormat((itemRate - (itemRate * (100 / (100 + GSTPercentage)))).toFixed(2));
				},

				generateUUID() {
					return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
						var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
						return v.toString(16);
					});
				},

				generateInvoiceNumber(minimum, maximum) {
					const randomNumber = Math.floor(Math.random() * (maximum - minimum)) + minimum;
					this.invoiceNumber = '#INV-'+ randomNumber;
				},

				numberFormat(amount) {
					return amount.toLocaleString("en-US", {
						style: "currency",
						currency: "INR"
					});
				},

				printInvoice() {
					var printContents = this.$refs.printTemplate.innerHTML;
					var originalContents = document.body.innerHTML;

					document.body.innerHTML = printContents;
					window.print();
					document.body.innerHTML = originalContents;
				}
			}
		}
	</script>


