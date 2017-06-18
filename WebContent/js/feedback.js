
function validate()
{
var name=document.getElementById("name").value;
   var city=document.getElementById("sourcecity").value;
	var fc=document.getElementById("category").value;
	var ft=document.getElementById("type").value;
	var date=document.getElementById("date").value;
	var email=document.getElementById("email").value;
	var cn=document.getElementById("contactnumber").value;
	var cnp=document.getElementById("carnumber").value;
	var msg=document.getElementById("message").value;
	if (name == "") {
		document.getElementById("msg").innerHTML = "Enter name";
		return false;
	}
	
	if (fc == -1) {
		document.getElementById("msg").innerHTML = "Select Feedback Category";
		return false;
	}
	if(ft== -1){
		document.getElementById("msg").innerHTML = "Select Feedback Type";
		return false;
	}
	if (city == -1) {
		document.getElementById("msg").innerHTML = "Select city";
		return false;
	}
	if(email=="" || !email.match(/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/))
	{
		document.getElementById("msg").innerHTML="Enter valid Email address";
		return false;
	}
	
	if (cn == "" || isNaN(cn) || cn.length!=10) {
		
		document.getElementById("msg").innerHTML = "Enter valid contact number";

		return false;
	}
	if (date=="") {
		document.getElementById("msg").innerHTML = "Select Date";
		return false;
	}
	if (cnp == "") {
		document.getElementById("msg").innerHTML = "Enter a car number";
		return false;
	}
	if(!cnp.match(/^[A-Za-z0-9]+$/))
			{
		document.getElementById("msg").innerHTML = "Enter a valid carnumber ";
	return false;
	}
	if (msg == "") {
		document.getElementById("msg").innerHTML = "Enter a message";
		return false;
	}
}
