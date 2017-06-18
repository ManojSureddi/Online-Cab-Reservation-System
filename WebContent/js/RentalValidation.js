function rentalValidation()
{
//	var selectPickDate=document.myform.pdate.value;
	
	var selectPickHours=document.myform.phours.value;
	var selectPickMinutes=document.myform.pminutes.value;
	var selectPickLocation=document.myform.pickuplocation.value;

	var selectPickDate=document.getElementById("sdate").value;
	var selectDropDate=document.getElementById("ddate").value;
	
	var selectDropHours=document.myform.dhours.value;
	var selectDropMinutes=document.myform.dminutes.value;
	var selectDropLocation=document.myform.droplocation.value;
	var selectNoOfDays=document.myform.numberofdays.value;
	var selectCarMake=document.myform.carmake.value;
	var selectCarType=document.myform.cartype.value;
	var selectCarModel=document.myform.carmodel.value;
	var selectFeatures=document.myform.features.value;
	
	if(selectPickDate==""){
	
	document.getElementById("msg").innerHTML = "please select date";
		return false;
	}
	if(selectPickHours==-1)
	{
	
	document.getElementById("msg").innerHTML = "please select pick up hours";
	return false;
	}
	if(selectPickMinutes==-1)
	{
	
	document.getElementById("msg").innerHTML = "please select pick up minutes";
	return false;
	}
	if(selectPickLocation==-1)
	{

	document.getElementById("msg").innerHTML = "please select pick up location";
	return false;
	}
	if(selectDropDate==""){

		document.getElementById("msg").innerHTML = "please select date";
		return false;
	}
	
	var user_date = Date.parse(selectPickDate);

	var date = new Date();
	if(date >user_date ){
		document.getElementById("msg").innerHTML = "select start date after today's date";
		return false;
	}
	
	var drop_date=Date.parse(selectDropDate);
	var date = new Date();
	if(date >drop_date){
		document.getElementById("msg").innerHTML = "select Drop date after today's date";
		return false;	
	}
	
	if(user_date > drop_date ){
		document.getElementById("msg").innerHTML = "start date should be less than end date";
		return false;
	}


	var diff_date =  (drop_date-user_date );
	var num_days = ((diff_date % 31536000000) % 2628000000)/86400000;

	if(num_days>14 ){
		document.getElementById("msg").innerHTML = "Number of days should not be greater than 14 days";
		return false;
	}
alert(num_days);
	$("#nod").val(num_days);
	
	
	
	if(selectDropHours==-1)
	{
	
	document.getElementById("msg").innerHTML = "please select dropping hours";
	return false;
	}
	if(selectDropMinutes==-1)
	{

	document.getElementById("msg").innerHTML = "please select dropping minutes";
	return false;
	}
	if(selectDropLocation==-1)
	{
	
	document.getElementById("msg").innerHTML = "please select dropping location";
	return false;}
	if(!selectNoOfDays.match(/^[0-9]+$/))
		{
		
		document.getElementById("msg").innerHTML = "please enter no of days in numbers only";
		return false;}

	if(selectCarMake==-1)
	{
	
	document.getElementById("msg").innerHTML = "please select car make";
	return false;}
	if(selectCarType==-1)
	{

	document.getElementById("msg").innerHTML = "please select car type";
	return false;}
	if(selectCarModel==-1)
	{
	
	document.getElementById("msg").innerHTML = "please select car model";
	return false;}
	if(selectFeatures==-1)
	{
	
	document.getElementById("msg").innerHTML = "please select car features";
	return false;
	}
return true;
}
