$(function(){


$("#adminform2").submit(function(e){
	var sel2=$("#sel2").val();
	var sel1=$("#sel1").val();
	if(sel2=="temp"||sel2=="men"||sel2=="women"||sel2=="fashion"||sel2=="electronics"||sel2=="living"||sel2=="dailyneeds"||sel2=="mcloth"||sel2=="mfoot"||sel2=="wcloth"||sel2=="wfoot"||sel1=="enter")
	{
		$("#sel1").focus();		
		e.preventDefault(e);
	}
});


$("#sel1").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
	str="#"+str;
	$("#fashion").hide();
	$("#electronics").hide();
	$("#living").hide();
	$("#dailyneeds").hide();
	$("#men").hide();
	$("#mcloth").hide();
	$("#mfoot").hide();
	$("#women").hide();	
	$("#wcloth").hide();
	$("#wfoot").hide();
	$(str).fadeIn();
});

$("#fashion").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
	str="#"+str;
	$("#men").hide();
	$("#mcloth").hide();
	$("#mfoot").hide();
	$("#women").hide();	
	$("#wcloth").hide();
	$("#wfoot").hide();
	$(str).fadeIn();
});

$("#men").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
	str="#"+str;
	$("#mcloth").hide();
	$("#mfoot").hide();
	$(str).fadeIn();
});

$("#women").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
	str="#"+str;
	$("#wcloth").hide();
	$("#wfoot").hide();
	$(str).fadeIn();
});

$("#mcloth,#mfoot").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
});

$("#wcloth,#wfoot").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
});

$("#electronics").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
});

$("#living").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
});

$("#dailyneeds").change(function(){
    var str=$(this).val();
	$("#temp1").val(str);
});


});