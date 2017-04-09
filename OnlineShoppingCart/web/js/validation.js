$(function(){
	
	var product_name;
	$("#search").keyup(function(){
		var product_name="search.jsp?product="+$(this).val();
	    product_name=encodeURI(product_name);
		if($(this).val()!="")
		{
		
			$('#content').load(product_name);
	    }
		else
		{
			
		}
	});

});
	$(function(){
	
	$("#form2").submit(function(e){
	var pass2=$("#pass2").val();
	var rpass2=$("#rpass2").val();
	if(pass2!=rpass2)
	{
		$("#rpass2").focus();
		$("#rpass2").attr('type','text');
		$("#pass2").attr('type','text');		
		e.preventDefault(e);
	}
	
	});
	
	$("#pass2,#rpass2").keyup(function(){
		$("#rpass2").attr('type','password');
		$("#pass2").attr('type','password');
	});

});