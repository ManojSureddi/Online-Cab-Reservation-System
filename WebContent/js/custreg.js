function validateCustomer()
{
	var name=document.getElementById("name").value;
	var email=document.getElementById("email").value;
	var phone=document.getElementById("phone").value;
	var address=document.getElementById("address").value;
	var gender=document.getElementById("gender").value;

	var date=document.getElementById("date").value;

	var T_number=document.getElementById("T_number").value;
	var L_number=document.getElementById("L_number").value;
	var password=document.getElementById("password").value;
	var confirmpassword=document.getElementById("confirmpassword").value;


	if(name=="")
	{
		document.getElementById("msg").innerHTML="Enter Name";
		return false;
	}
	if(!name.match(/^[A-Za-z]+$/))
	{
		document.getElementById("msg").innerHTML="Enter Valid Name";
		return false;
	}
	
	if(email=="" || !email.match(/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/))
	{
		document.getElementById("msg").innerHTML="Enter valid Email address";
		return false;
	}
	if(phone==""||isNaN(phone)|| phone.length!=10)
	{
		document.getElementById("msg").innerHTML="Enter Valid Contact Number";
		return false;
	}
	if(address=="")
	{
		document.getElementById("msg").innerHTML="Enter the Address";
		return false;
	}
	if (gender == "-1") {
		document.getElementById("msg").innerHTML = "Select Gender";
		return false;
	}
	if (date == "") {
		document.getElementById("msg").innerHTML = "Select Date";
		return false;
	}
	
	var user_date = Date.parse(date);
	var date1 = new Date();
	if(date1 <user_date ){
		document.getElementById("msg").innerHTML = "Please your not from the future :p";
		return false;
	}
	
	if(T_number==""||isNaN(T_number))
	{
		document.getElementById("msg").innerHTML="Enter Valid Tracking Number";
		return false;
	}
	if(L_number=="")
	{
		document.getElementById("msg").innerHTML="Enter License Number";
		return false;
	}
	if(password=="")
	{
		document.getElementById("msg").innerHTML="Enter Password";
		return false;
	}

	
	
	if(confirmpassword!=password)
	{
		document.getElementById("msg").innerHTML="Password not matched";
		return false;
	}
}