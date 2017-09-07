$(function(){
	TotalPrice();
	$('button[value="delete"]').click(function(){
		$.ajax({
			type:"get",
			url:"RedCartServlet",
			data:{"goodName":$(this).parent().parent().children().eq(1).text(),"goodSate":0},
			success:function(result){			
				$("#count").html(result);
			
			}	
		})
		$(this).parent().parent().empty();
		TotalPrice();
	})
	
	$('input[value="+"]').click(function(){
		var n = $(this).prev().attr('value');
		$(this).prev().attr("value",parseInt(n) + 1);
		$('.quantity').trigger('click');
		TotalPrice();
         
    		$.ajax({
    			type:"get",
    			url:"CartServlet",
    			data:{"goodName":$(this).parent().parent().children().eq(1).text()},
    			success:function(result){			
    				$("#count").html(result);
    			
    			}				
    	 })
	})
	
	$('input[value="-"]').click(function(){
		var n = $(this).next().attr('value');
		if(n==1){
			alert("Please Delete It！")
		}else{
			$(this).next().attr("value",parseInt(n) - 1);
			$('.quantity').trigger('click');
			TotalPrice();
			$.ajax({
    			type:"get",
    			url:"RedCartServlet",
    			data:{"goodName":$(this).parent().parent().children().eq(1).text(),"goodSate":"1"},
    			success:function(result){			
    				$("#count").html(result);
    			
    			}				
    		})
		}
	})
	
	$('.quantity' ).click(function() {
		var prr = $(this).parent().prev().children().text();
		var cont = $(this).attr("value");
		$(this).parent().next().children().html(prr * cont * 1)
	})
	
	function TotalPrice() {
		var total = 0;		
		$('.toalprie').each(function() {
			total += parseInt(($(this).text()));
		});
		$('.shopingcarts_total').children().text(total);
	}
})