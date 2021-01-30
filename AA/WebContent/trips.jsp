<%@ page language="java"%>
    <%@ page import ="com.sun.jersey.api.client.Client" %>
<%@ page import ="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import ="com.sun.jersey.api.client.WebResource" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>My Trips | American Airlines</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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



	.overlay {
	  position: absolute;
	  bottom: 0;
	  left: 0;
	  right: 0;
	  background-color: rgb(0,12,24);
	  overflow: hidden;
	  width: 100%;
	  height: 100%;
	  -webkit-transform: scale(0);
	  -ms-transform: scale(0);
	  transform: scale(0);
	  -webkit-transition: .3s ease;
	  transition: .3s ease;
	  opacity:0.8;
	}
	
	.container1 {
	  position: relative;
	}
	
	.container1:hover .overlay {
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
	}
	
	.text {
	  color: white;
	  font-size: 200%;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate(-50%, -50%);
	  -ms-transform: translate(-50%, -50%);
	  transform: translate(-50%, -50%);
	  text-align: center;
	}

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
	
	
	
	.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}



label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: midnightblue;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #00478d;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (and change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
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
	#comms{
	width:100%;
	}




	</style>
  
  
  
</head>
<body onload="signedIn(); checkCookie();">

<!-- Navbar (sit on top) -->
<div class="w3-top w3-midnight w3-padding w3-card">
  
    <a href="home.jsp" class="w3-bar-item w3-left" onclick="logout()"><img src="Images/logo.jpg" width="40" height="40" style="border-radius: 50%;"></a>
	<div class="dropdown w3-right">
	  <button class="dropbtn w3-hide-large w3-hide-medium" onclick="myFunction()">
	    <div id="menu"></div>
		<div id="menu"></div>
		<div id="menu"></div>
		<i class="fa fa-caret-down"></i>
	  </button>
	  <div class="dropdown-content w3-hide-large w3-hide-medium" id="myDropdown" style="right:0">
		<a href="mailto:kostismvg@gmail.com" class="w3-bar-item w3-hover-red w3-button">Contact us</a>
		<a href="home.jsp#about" class="w3-bar-item w3-hover-red w3-button">About</a>
		<a href="home.jsp#actions" class="w3-bar-item w3-hover-red w3-button">Actions</a>
	  </div>
	  <div class="w3-right w3-hide-small">
	  <a href="mailto:kostismvg@gmail.com" class="w3-bar-item w3-hover-red w3-button">Contact us</a>
	  <a href="home.jsp#about" class="w3-bar-item w3-hover-red w3-button">About</a>
      <a href="home.jsp#actions" class="w3-bar-item w3-hover-red w3-button">Actions</a>
    </div>
    </div> 
  
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:100%;" id="home">
  <img class="w3-image" src="Images/american.jpg" alt="AA" width="100%" height="auto">
</header>


<div id="signed_in" style="display:none;" >

					
<div class="w3-container w3-padding-32" style="background-color:rgb(255, 230, 230);color:black;">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Show Boarding Number</h3>
    
		<form METHOD="post" class="form-inline">
			Username: <input type="text" name="username" id ="username" value="" readonly="readonly" required>
			Date: <input type="text" name="date" placeholder="dd-mm-yyyy" pattern="\d{1,2}-\d{1,2}-\d{4}" maxlength="10" value="" required>
			Origin: <input type="text" name="origin" value="" maxlength=3 size=3 required>
			Destination: <input type="text" name="destination" value="" maxlength=3 size=3 required>
			<input type ="submit" name="ShowBoardingNumber" value ="Remind me" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		 
		<table>
		<br> 
		<%
			if(request.getParameter("ShowBoardingNumber") != null)
			{		
				String username = request.getParameter("username");
				String date = request.getParameter("date");
				String origin = request.getParameter("origin");
				String destination = request.getParameter("destination");
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/ShowBoardingNumber/"+username+"/"+
						date+"/"+origin+"/"+destination);
				ClientResponse myresponse = webresource.accept("text/plain").get(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				%><tr><td><%out.print(output);%><tr><td><%
				
				
			}
		%>
		</table>
</div> 




					
<div class="w3-container w3-padding-32" style="background-color:rgb(230, 249, 255)">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Show My Trips</h3>
    
		<form METHOD="post" class="form-inline">
			Username: <input type="text" name="username" id ="username2" value="" readonly="readonly" required>
			<input type ="submit" name="ShowMyTrips" value ="Show me" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		 
		<table style="background-color:rgb(255, 230, 230); color:black;" >
		<br> 
		<%
			if(request.getParameter("ShowMyTrips") != null)
			{		
				String username = request.getParameter("username");
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/ShowTrips/"+username);
				ClientResponse myresponse = webresource.accept("text/plain").get(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				List<String> tripsList = Arrays.asList(output.split(","));
				%><th>This is where we have flown together</th><%
				for (int i=0; i<tripsList.size(); i++)
				{
					%><tr><td><%out.print(tripsList.get(i).replace("[","").replace("]",""));%><tr><td><%
					
				}
				%>
				<div class="container1">
				<img  src="Images/aa_trip.jpg" width="100%" height="auto">
				<div class="overlay">
				<div class="text">Thank you for <br>being a part of<br><b>our family &#128151;</b></div> 
				 </div>   
				  </div>
				<%
			}
		%>
		</table>
</div> 




<div class="w3-container w3-padding-32" style="background-color:rgb(230, 249, 255)">
    
		<form METHOD="post" class="form-inline" id="commentform">
			Username: <input type="text" name="username" id ="username3" value="" readonly="readonly" required>
			Comment: <input type="text" name="comment"  value="" required>
			<input type ="submit" name="makeComment" value ="Make Comment" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		
		<table style="background-color:rgb(255, 230, 230); color:black;" >
		<br> 
		<%
			if(request.getParameter("makeComment") != null)
			{		
				String username = request.getParameter("username");
				String comment = request.getParameter("comment");
				comment = comment.replaceAll("\\s+","\\+");
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/MakeComment/"+username+"/"+
						comment);
				ClientResponse myresponse = webresource.accept("text/plain").post(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.print(output);
			}
		%>
		</table>
</div> 



<marquee id="comms" style="display:none;width:20%; height:20%; position:fixed; bottom:10%; right:0; background-color:midnightblue; padding:10px; color:white;" 
direction="up" onmouseover="this.stop();" onmouseout="this.start();" scrollamount="2">
<% 
  	Client client10 = Client.create();
	WebResource webresource10 = client10.resource("http://localhost:8080/AA/rest/AAService/ShowComments");
	ClientResponse myresponse10 = webresource10.accept("text/plain").get(ClientResponse.class);
	String output10 = myresponse10.getEntity(String.class);
	List<String> commsList = Arrays.asList(output10.split(","));
	
	for (int i=0; i<commsList.size(); i++)
	{
		out.print(commsList.get(i).replace("[","").replace("]",""));
		%><br><% 
		
	}
%>
</marquee>

 
 <button style="position:fixed; bottom:0; right:0; padding: 2; border: none; background-color: midnightblue; color:white;" onclick="showComms()"><i class="fa fa-comment"></i> Comments </button>
	
  



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
	document.cookie = "type=; path=/;";
	document.cookie = "cost=; path=/;";
	document.cookie = "origin=; path=/;";
	document.cookie = "destination=; path=/;";
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


function setCookie(cname,cvalue,exdays) {
	  var d = new Date();
	  d.setTime(d.getTime() + (exdays*24*60*60*1000));
	  var expires = "expires=" + d.toGMTString();
	  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}

	function getCookie(cname) {
	  var name = cname + "=";
	  var decodedCookie = decodeURIComponent(document.cookie);
	  var ca = decodedCookie.split(';');
	  for(var i = 0; i < ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if (c.indexOf(name) == 0) {
	      return c.substring(name.length, c.length);
	    }
	  }
	  return "";
	}

	function checkCookie() {
	  var user=getCookie("username");
	  var cost=getCookie("cost");
	  var origin=getCookie("origin");
	  var destination=getCookie("destination");
	  if (user != "") {
		 document.getElementById('username').value=user;
		 document.getElementById('username2').value=user;
		 document.getElementById('username3').value=user;
	  } 
	  if(cost != "")
	  {
		document.getElementById('cost').value=cost;
	  }
	  if(origin != "")
	  {
		document.getElementById('origin').value=origin;
	  }
	  if(destination != "")
	  {
		document.getElementById('destination').value=destination;
	  }
	}
	
	function showComms() {
		  var x = document.getElementById("comms");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	
	
</script>






</body>
</html>
