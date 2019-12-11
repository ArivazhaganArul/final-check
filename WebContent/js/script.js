// Include truYum form validation functions here
function validation() {
    var MovieName = document.forms["form"]["title"].value;
    if(MovieName=="") {
        alert("Title is required.");
		document.form.title.focus();
        return false;
    }
	if ((MovieName.length < 2) || (MovieName.length > 30)) {
		alert("Title should have 2 to 65 characters.");
        return false;
    }
	var movievalue = document.forms["form"]["gross"].value;
	if(movievalue=="") {
        alert("Gross amount is required.");
        return false;
    }
	
	var launchDate = document.forms["form"]["dateOfLaunch"].value;
	if(launchDate=="") {
        alert("Date of Launch is required.");
        return false;
    }
	
	var moviegenre = document.forms["form"]["genre"].value;
    if(moviegenre=="") {
        alert("Genre is required.");
        return false;
    }
}