function validatePayment(){
	var card=document.getElementById("card").value;
	var cvv=document.getElementById("cvv").value;
	var name=document.getElementById("name").value;
	if (card== "") {
		document.getElementById("msg").innerHTML = "Enter a card number";
		return false;
	}
	if (card.length!= 16) {
		document.getElementById("msg").innerHTML = "Enter 16-digit card number";
		return false;
	}
	if (cvv== "") {
		document.getElementById("msg").innerHTML = "Enter 3-digit cvv number";
		return false;
	}
	if (cvv.length!= 3) {
		document.getElementById("msg").innerHTML = "Enter 3-digit cvv number";
		return false;
	}
	if (name== "") {
		document.getElementById("msg").innerHTML = "Enter a name";
		return false;
	}
}