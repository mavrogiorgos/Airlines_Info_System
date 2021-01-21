<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.sun.jersey.api.client.Client" %>
<%@ page import ="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import ="com.sun.jersey.api.client.WebResource" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<title>Flights | American Airlines</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="home.css">
<head>
  <link rel="icon" href="Images/logo.jpg" type="image/gif">
  
  <style>
	.navbar {
	  overflow: hidden;
	  background-color: #333;
	  font-family: Arial, Helvetica, sans-serif;
	}

	.navbar a {
	  float: left;
	  font-size: 16px;
	  color: white;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	}

	.dropdown {
	  float: left;
	  overflow: hidden;
	}

	.dropdown .dropbtn {
	  cursor: pointer;
	  font-size: 16px;  
	  border: none;
	  outline: none;
	  color: white;
	  padding: 14px 16px;
	  background-color: inherit;
	  font-family: inherit;
	  margin: 0;
	}

	.navbar a:hover, .dropdown:hover .dropbtn, .dropbtn:focus {
	  background-color: midnightblue;
	}

	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f9f9f9;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}

	.dropdown-content a {
	  float: none;
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	  text-align: left;
	}

	.dropdown-content a:hover {
	  background-color: #ddd;
	}

	.show {
	  display: block;
	}
	
	
	
	#menu {
	  width: 30px;
	  height: 3px;
	  background-color: white;
	  margin: 3px 0px;
	}
	
	
	#more {display: none;}
	#more1 {display: none;}
	#more2 {display: none;}
	#more3 {display: none;}


	.form-inline {
	  display: flex;
	  flex-flow: row wrap;
	  align-items: center;
	}
	
	/* Style the input fields */
	.form-inline input {
	  vertical-align: middle;
	  margin: 5px 10px 5px 0;
	  padding: 10px;
	  background-color: #fff;
	  border: 1px solid #ddd;
	}
	
	table{
	  border: 1px solid white;
	  background-color:midnightblue;
	  color: white;
	  text-align:center;
	  border-collapse: collapse;
	  opacity: 0.9;
	  margin-left: auto;
  	  margin-right: auto;
  	  width:60%;
	}
	
	
	
	@media (max-width: 800px) {
	  .form-inline input {
	    margin: 10px 0;
	  }
	
	  .form-inline {
	    flex-direction: column;
	    align-items: stretch;
	  }
	  
	  table{
  	  width:100%;
	}




	</style>
  
  
  
</head>
<body onload="signedIn()">

<!-- Navbar (sit on top) -->
<div class="w3-top w3-midnight w3-padding w3-card">
  
    <a href="home.jsp" class="w3-bar-item w3-left" onclick="logout()"><img src="Images/logo.jpg" width="40" height="40" style="border-radius: 50%;"></a>
	<div class="dropdown w3-right">
	  <button class="dropbtn w3-hide-large w3-hide-medium" onclick="myFunction()">
	    <div id="menu"></div>
		<div id="menu"></div>
		<div id="menu"></div>
		<div id="menu"></div>
		<i class="fa fa-caret-down"></i>
	  </button>
	  <div class="dropdown-content w3-hide-large w3-hide-medium" id="myDropdown" style="right:0">
		<a href="mailto:kostismvg@gmail.com" class="w3-bar-item w3-hover-red w3-button">Contact us</a>
		<a href="home.jsp#about" class="w3-bar-item w3-hover-red w3-button">About</a>
		<a href="home.jsp#actions" class="w3-bar-item w3-hover-red w3-button">Actions</a>
		<a href="home.jsp#news" class="w3-bar-item w3-hover-red w3-button">News</a>
	  </div>
	  <div class="w3-right w3-hide-small">
	  <a href="mailto:kostismvg@gmail.com" class="w3-bar-item w3-hover-red w3-button">Contact us</a>
	  <a href="home.jsp#about" class="w3-bar-item w3-hover-red w3-button">About</a>
      <a href="home.jsp#actions" class="w3-bar-item w3-hover-red w3-button">Actions</a>
      <a href="home.jsp#news" class="w3-bar-item w3-hover-red w3-button">News</a>
    </div>
    </div> 
  
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:100%;" id="home">
  <img class="w3-image" src="Images/american.jpg" alt="Health" width="100%" height="auto">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge "><span class="w3-padding w3-white w3-text-red w3-opacity-min"><b>A</b>merican<span class="w3-text-midnight"><b>A</b>irlines</span></span> </h1>
  </div>
</header>


  	<div id="signed_in" style="display:none;" >
    <div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Search route</h3>
		<form METHOD="post" class="form-inline">
			Origin Airport: <input type="text" name="origin" value="" maxlength=3 required>
			Destination Airport: <input type="text" name="destination" value="" maxlength=3 required>
			<input type ="submit" name="searchRoute" value ="Search Route" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<table>
		<br>
		<%
			if(request.getParameter("searchRoute") != null)
			{
				String origin = request.getParameter("origin");
				String destination = request.getParameter("destination");		
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/SearchRoute/"+origin+"/"+
						destination);
				ClientResponse myresponse = webresource.accept("text/plain").get(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				List<String> routeList = Arrays.asList(output.split(","));
				%><th>Available route information</th><%
				for (int i=0; i<routeList.size(); i++)
				{
					%><tr><td><%out.print(routeList.get(i).replace("[","").replace("]",""));%><tr><td><%
					
				}
				
				Client client1 = Client.create();
				WebResource webresource1 = client1.resource("http://localhost:8080/AA/rest/AAService/CalculateDistance/"+origin+"/"+
						destination);
				ClientResponse myresponse1 = webresource1.accept("text/plain").get(ClientResponse.class);
				String output1 = myresponse1.getEntity(String.class);
				out.print(output1);
			}
		%>
		</table>
</div> 

	

<div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Show AA fleet</h3>
		<form METHOD="post">
			By clicking this button, you may see all the aircrafts that we operate. 
			<input type ="submit" name="ShowFleet" value ="Show fleet" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		 
		<table>
		<br> 
		<%
			if(request.getParameter("ShowFleet") != null)
			{		
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/ShowFleet");
				ClientResponse myresponse = webresource.accept("text/plain").get(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				List<String> fleetList = Arrays.asList(output.split(","));
				%><th>Aircraft information</th><%
				for (int i=0; i<fleetList.size(); i++)
				{
					%><tr><td><%out.print(fleetList.get(i).replace("[","").replace("]",""));%><tr><td><%
					
				}
				
			}
		%>
		</table>
</div> 


 
	
  



<!-- Footer -->
<footer class="w3-center w3-midnight w3-padding-16">
  <a href = "https://github.com/mavrogiorgos" style="text-decoration:none;">Kostis Mavrogiorgos</a> - All rights reserved &copy;
</footer>
</div> 




<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
  var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}

function showMore() {
  var dots = document.getElementById("dots");
  var moreText = document.getElementById("more");
  var btnText = document.getElementById("myBtn");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "More";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Less";
    moreText.style.display = "inline";
  }
}


function showMore1() {
  var dots = document.getElementById("dots1");
  var moreText = document.getElementById("more1");
  var btnText = document.getElementById("myBtn1");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Περισσότερα";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Λιγότερα";
    moreText.style.display = "inline";
  }
}

function showMore2() {
  var dots = document.getElementById("dots2");
  var moreText = document.getElementById("more2");
  var btnText = document.getElementById("myBtn2");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Περισσότερα";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Λιγότερα";
    moreText.style.display = "inline";
  }
}

function showMore3() {
  var dots = document.getElementById("dots3");
  var moreText = document.getElementById("more3");
  var btnText = document.getElementById("myBtn3");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Περισσότερα";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Λιγότερα";
    moreText.style.display = "inline";
  }
}

function logout(){
	document.cookie = "username=; path=/;";
}


function signedIn() {
  var x = document.getElementById("signed_in");
  if(document.cookie.match(/^(.*;)?\s*username\s*=\s*[^;]+(.*)?$/))
  {
    x.style.display = "block";
  }
  else 
  {
	  x.style.display = "none";
	  window.alert("You need to sign in!");
  }
}



</script>






</body>
</html>
