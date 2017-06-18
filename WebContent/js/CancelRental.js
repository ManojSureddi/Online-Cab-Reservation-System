function validate()
{
	var reservationid=document.getElementById("rentalid").Value;
	if(reservationid=="")
	{
		document.getElementById("msg").innerHTML="Enter the Reservation Id";
		return false;
	}
}