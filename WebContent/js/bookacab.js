function validate()
{
var start=document.getElementById("date").value;
if(start =="")
{
	document.getElementById("msg").innerHTML = "Enter the  date";
return false;
}

var user_date = Date.parse(start);
var date = new Date();
if(date >user_date ){
	document.getElementById("msg").innerHTML = "select start date after today's date";
	return false;
}
var scity=document.getElementById("sourcecity").value;
if(scity=="-1")
{
	document.getElementById("msg").innerHTML = "Enter a valid source";
return false;
}
var dcity=document.getElementById("destinationcity").value;
if(dcity=="-1")
{
	document.getElementById("msg").innerHTML = "Enter a valid destination";
return false;
}
var hours=document.getElementById("hours").value;
if(hours=="-1")
	{
	document.getElementById("msg").innerHTML = "Select Hours";
	return false;
	}
var minutes=document.getElementById("minutes").value;
if(minutes=="-1")
	{
	document.getElementById("msg").innerHTML = "Select the minutes";
	return false;
	}
var carmake=document.getElementById("carmake").value;
if(carmake=="-1")
	{
	document.getElementById("msg").innerHTML = "Enter the carmake";
	return false;
	}
var cartype=document.getElementById("cartype").value;
if(cartype=="-1")
	{
	document.getElementById("msg").innerHTML = "Enter the cartype";
	return false;
	}
var carmodel=document.getElementById("carmodel").value;
if(carmodel=="-1")
	{
	document.getElementById("msg").innerHTML = "Enter the carmodel";
	return false;
	}
var features=document.getElementById("features").value;
if(features=="-1")
	{
	document.getElementById("msg").innerHTML = "Enter the Features";
	return false;
	}
return true;
}