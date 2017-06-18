/**
 * 
 */
//document.ready(
$.ajax({
url:"FetchDetails",
type:"POST",
async:"true",
data:"des=1",
success:function(data){
document.getElementById("carmake").innerHTML=data;
}
})

//);

function makeChanged(){
var change=document.getElementById("carmake").value;
$.ajax({
url:"FetchDetails",
type:"POST",
async:"true",
data:"des=2&make="+change,
success:function(data){
$("#cartype").html(data);
}
});
}


function modelChanged(){
var change=document.getElementById("carmake").value;
var model=document.getElementById("cartype").value;
$.ajax({
url:"FetchDetails",
type:"POST",
async:"true",
data:"des=3&make="+change+"&model="+model,
success:function(data){
$("#carmodel").html(data);
}
});
}

function autoPopulateAddress(){
	$.ajax({
		url:"FetchDetails",
		type:"POST",
		async:"true",
		data:"des=4",
		success:function(data){
		$("#FullAddress").html(data);
		}
		});
}