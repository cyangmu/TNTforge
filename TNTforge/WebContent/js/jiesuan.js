$(function(){
	
	
	
	TotalPrice();
	function TotalPrice() {
		var total = 0;		
		$('.total').each(function() {
			
			total += parseInt(($(this).text()));
		});
		$('.count').text(total);
	}
})