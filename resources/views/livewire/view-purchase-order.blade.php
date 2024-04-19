<div>
@if($order!=null)
<div class="border-t-8 border-gray-700 h-2"></div>
	<div 
		class="container mx-auto py-6 px-4"
		
	>
		<div class="flex justify-between">
			<!-- <h2 class="text-2xl font-bold mb-6 pb-2 tracking-wider uppercase">Purchase Order</h2> -->
			@if($order->status=='pending')
            <h3 class="text-black rounded px-2 {{$order->status=='pending'?'bg-yellow-400':'bg-green-400'}} {{$order->status=='declined'?'bg-red-400':''}}"  > {{$order->status}} approval from:
				@if(is_numeric($order->to_user))

					{{$order->toUser->name}}

		
				@endif
			 
			 
			  <p> </p></h3> 
			@else
			<h3 class="text-black {{$order->status=='pending'?'bg-yellow-400':''}}  {{$order->status=='declined'?'bg-red-400':'bg-blue-400'}}" > {{$order->status}}</p></h3> 
			@endif
			
			
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
					
				</div>
				
				<div class="relative inline-block">
					<div class="text-gray-500 cursor-pointer w-10 h-10 rounded-full bg-gray-100 hover:bg-gray-300 inline-flex items-center justify-center" @mouseenter="showTooltip2 = true" @mouseleave="showTooltip2 = false" @click="window.location.reload()">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-refresh" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<rect x="0" y="0" width="24" height="24" stroke="none"></rect>
							<path d="M20 11a8.1 8.1 0 0 0 -15.5 -2m-.5 -5v5h5" />
							<path d="M4 13a8.1 8.1 0 0 0 15.5 2m.5 5v-5h-5" />
						</svg>	  
					</div>
				</div>
			</div>
		</div>

		<div class="flex mb-4 justify-between">
			<div class="w-2/4">
				<div class="mb-2 md:mb-1 md:flex items-center">
					<label class="w-32 text-gray-800 block font-bold text-sm uppercase tracking-wide">Invoice No.</label>
					<span class="mr-4 inline-block hidden md:block">:</span>
					<div class="flex-1">
					<input  class="bg-gray-200 rounded leading-tight focus:outline-none focus:bg-white " id="inline-full-name" type="text" placeholder="{{$order->inv_no}}"  >
					</div>
				</div>

				<div class="mb-2 md:mb-1 md:flex items-center">
					<label class="w-32 text-gray-800 block font-bold text-sm uppercase tracking-wide">Date</label>
					<span class="mr-4 inline-block hidden md:block">:</span>
					<div class="flex-1">
					<input class="bg-gray-200  rounded w-48 py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500 js-datepicker" type="text" id="datepicker1" placeholder="{{$order->inv_no}}"  l="invoiceDate" x-on:change="invoiceDate = document.getElementById('datepicker1').value" autocomplete="off" readonly>
					</div>
				</div>

				<div class="mb-2 md:mb-1 md:flex items-center">
					<label class="w-32 text-gray-800 block font-bold text-sm uppercase tracking-wide">Due date</label>
					<span class="mr-4 inline-block hidden md:block">:</span>
					<div class="flex-1">
					<input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-48 py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500 js-datepicker-2" id="datepicker2" type="text" placeholder="eg. 17 Mar, 2020"  l="invoiceDueDate" x-on:change="invoiceDueDate = document.getElementById('datepicker2').value" autocomplete="off" readonly>
					</div>
				</div>
			</div>

			<div class="w-32 h-32 mb-1 border rounded-lg overflow-hidden relative bg-gray-100">
					<img  onclick="enlargePic()" id="invoiceS" class="h-92" src="/invoice.avif" />
					
					
					
				</div>
				<img onclick="enlargePic()"  style="display:none" id="invoiceL"  src="/invoice.avif" />
			
			<div>
				
			</div>
		</div>

		<div class="flex flex-wrap justify-between mb-12">
            
			<div class="w-full md:w-1/3 mb-2 md:mb-0">
                <div class="mb-4">
                    <label for="supplier" class="block mb-2 font-bold">Product Code</label>
					<span>#{{$order->category->code}} ({{$order->category->name}}) </span>
                </div>

                <div class="mb-4">
                    <label for="supplier" class="block mb-1">Vendor:</label>
                    <input value="{{$order->vendor->name}}" type="text" id="product_name" name="product_name" required
                        class="w-full px-4 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                  
                </div>
			</div>
			<div class="w-full md:w-1/3">
				<label class="text-gray-800 block mb-1 font-bold text-sm uppercase tracking-wide">Details:</label>
				<h6 class="mb-1 bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-blue-500" id="inline-full-name" type="text" placeholder="From: {{$order->fromUser->name}}"  l="from.name">
					From: {{$order->fromUser->name}}
				</h6>

					<ul>
						<h4>Copied Users</h4>
						<hr>
						@foreach($CC as $cc)
							<ol><p>{{$cc}}</p></ol>
						@endforeach
					</ul>
	
				
			</div>
	<div>
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
					
				</p>
			</div>

			<div class="px-1 w-32 text-right">
				<p class="leading-none">
					<span class="block uppercase tracking-wide text-sm font-bold text-gray-800">Total</span>
			</div>

			<div class="px-1 w-20 text-center">
			</div>
		</div>
	    <div>
            @foreach($order->items as $item)
                <div class="flex -mx-1 py-2 border-b">
                    <div class="flex-1 px-1">
                        <p class="text-gray-800">{{$item->item}}</p>
                    </div>

                    <div class="px-1 w-20 text-right">
                        <p class="text-gray-800" >{{$item->quantity}}</p>
                    </div>

                    <div class="px-1 w-32 text-right">
                        <p class="text-gray-800" >{{$item->price}}</p>
                    </div>

                    <div class="px-1 w-32 text-right">
                        <p class="text-gray-800" >{{$item->price * $item->quantity}}</p>
                    </div>

                    <div class="px-1 w-20 text-right">  
                    </div>
                </div>
            @endforeach
        </div>
		
	 @if((Auth::user()->currentTeam->name=='GM' || Auth::user()->currentTeam->name=='Deputy GM') && $order->status=='pending' )
			<hr><br>
			<textarea {{!$comment_mode?'hidden': ''}} rows="10" cols="20"></textarea>
		<button wire:click="comment()" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">{{$comment_button}}</button>

		
			<div  {{!$comment_mode?'hidden': ''}} wire:loading class="bg-green-600 text-white"> 
        		sending comment...
    		</div>
	  @endif

	</div>

  

		<div class="py-2 ml-auto mt-5 w-full sm:w-2/4 lg:w-1/4">
			<div class="flex justify-between mb-3">
				<div class="text-gray-800 text-right flex-1">Total </div>
				<div class="text-right w-40">
					<div class="text-gray-800 font-medium"></div>
				</div>
			</div>
            <div class="flex justify-between mb-3">
				<div class="text-gray-800 text-right flex-1">Total (Shipping & Handling) </div>
				<div class="text-right w-40">
					<div class="text-gray-800 font-medium"></div>
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
						<div class="text-xl text-gray-800 font-bold">{{number_format($total)}}</div>
					</div>
				</div>
			</div>

			@if($order->status == 'paid' || $order->type == 'advance')
				<div class="py-2 border-t border-b">
					<div class="flex justify-between">
						<div class="text-l text-gray-600 text-right flex-1">Advance Fee</div>
						<div class="text-right w-40">
							<div class="text-l text-blue-800 font-bold">{{ number_format( $order->amount_paid) }}  ({{ number_format(( $order->amount_paid / $total ) *100, 2)}}%)</div>
						</div>
					</div>
				</div>

				<div class="py-2 border-t border-b">
					<div class="flex justify-between">
						<div class="text-l text-gray-600 text-right flex-1">Amount unpaid</div>
						<div class="text-right w-40">
							<div class="text-l text-yellow-400 font-bold">{{number_format(($total - $order->amount_paid))}}  </div>
						</div>
					</div>
				</div>
			@endif


		</div> 
		</div>

	  @if((Auth::user()->privilege > 2) && $order->status=='pending' )

	  	@if(!(Auth::user()->currentTeam->name=='HR' &&  $order->to_user == '3,4'))
			@if((Auth::user()->privilege == $order->privilege ) )
				<button  class="text-green-500 hover:text-red-600 font-semibold" wire:click="approve({{$order->id}})">Approve</button>
				<button class="text-red-500 hover:text-red-600 font-semibold" wire:click="decline({{$order->id}})">Decline </button>
			@endif
		@endif
		@elseif((Auth::user()->name=='Accountants') && ($order->status=='approved' && $order->type=='advance'))
			<button type="button" class="text-green-800 bg-white hover:text-red-600 font-semibold rounded" wire:click="paid({{$order->id}})"  wire:confirm="Are you sure you want to mark this request as Paid?">
				Render Paid 
			</button>
		@endif

	@endif
<script>

 function enlargePic(){

	let picL = document.getElementById('invoiceL');
	let picS = document.getElementById('invoiceS');

	 if (picL.style.display == "none" ) {
			picL.style.display = "block";
			picS.style.display = "none";
		} else {
			picL.style.display = "none";
			picS.style.display = "block";
		}
	
	}


</script>

</div>


