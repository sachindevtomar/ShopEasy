$(function(){
	var current_li;
	$("#search").keyup(function(){
		var current_query=$(this).val();
		alert("hello");
		if(current_query!="")
		{
			$('#second').load('/rough.html');
	    }
		else
		
	});
});