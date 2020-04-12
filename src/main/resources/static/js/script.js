/**
 * 
 */
function validConfirmPass(){
	var pass = document.getElementById("pass").value;
	var confirm = document.getElementById("confirm").value;
	if(pass.localeCompare(confirm)!=0) {
		document.getElementById("err-p").innerHTML = "Password not Matching";
	} else {
		document.getElementById("err-p").innerHTML = "";
	}
}