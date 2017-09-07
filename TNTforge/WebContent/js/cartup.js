 $(function(){
    	$(".opk").click(function(){
    		
    		alert("商品添加成功！");
    		
    		$.ajax({
    			type:"get",
    			url:"CartServlet",
    			data:{"goodName":$(this).parent().next().children().eq(3).children().text(),"goodSate":2},
    			success:function(result){			
    				$("#count").html(result);
    			
    				
    			}				
    		})
    	 })
    	
    	
    })