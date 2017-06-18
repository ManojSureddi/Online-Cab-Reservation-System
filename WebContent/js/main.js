// JavaScript Document
$("#login").click(function(){
	var uname=$("#uname").val();
	var pass=$("#pass").val();
	if(uname==""){
		$("#msgd").css("display","block");
		$("#msgd").html("Enter Username");
		return;
	}
	else if(pass==""){
		$("#msgd").css("display","block");
		$("#msgd").html("Enter Password");
	}
	else{
		$("#msgd").css("display","block").addClass("validate");
		$("#msgd").html("Validating...");
		$.ajax({
			url:"LoginController",
			type:"POST",
			async:true,
			data:"uname="+uname+"&pass="+pass,
			success:function(data){
				if(data==1){
					$("#msgd").html("Logging In...").removeClass().addClass("success");
					window.location="MainPage.jsp";					
				}
				else{
					$("#msgd").html("Invalid Username/Password");
				}
				
			}
			
		});
		
	}
});

