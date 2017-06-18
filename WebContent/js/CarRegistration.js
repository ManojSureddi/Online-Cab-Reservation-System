function validate()
{
	var vin=document.getElementById("vin").value;

var city=document.getElementById("city").value;
var carmake=document.getElementById("carmake").value;
var carmodel=document.getElementById("carmodel").value;
var capacity=document.getElementById("capacity").value;
var fleettype=document.getElementById("fleettype").value;
var features=document.getElementById("features").value;
var rent=document.getElementById("rentperday").value;
var cnp=document.getElementById("carnumberplate").value;
var cs=document.getElementById("carstatus").value;
if (vin == "") {
	document.getElementById("msg").innerHTML = "Enter a VIN number";
	return false;
}
if (city == " ") {
	document.getElementById("msg").innerHTML = "Enter a city";
	return false;
}

if (capacity == "") {
	document.getElementById("msg").innerHTML = "Enter capacity";
	return false;
}
if (carmake == -1) {
	document.getElementById("msg").innerHTML = "Select the carmake";
	return false;
}
if (carmodel == -1) {
	document.getElementById("msg").innerHTML = "Select the carmodel";
	return false;
}

if (fleettype == -1) {
	document.getElementById("msg").innerHTML = "Select the fleettype";
	return false;
}
if (features == -1) {
	document.getElementById("msg").innerHTML = "Select the feature";
	return false;
}
if (rent == " ") {
	document.getElementById("msg").innerHTML = "Enter rent for a day";
	return false;
}

if (cnp == " ") {
	document.getElementById("msg").innerHTML = "Enter a car number";
	return false;
}
if(!cnp.match(/^[A-Za-z0-9]+$/))
		{
	document.getElementById("msg").innerHTML = "Enter a valid carnumber ";
return false;	
}
if (cs == -1) {
	document.getElementById("msg").innerHTML = "Enter status of car";
	return false;
}
	
}