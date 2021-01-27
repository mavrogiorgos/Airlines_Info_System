<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<title>Administration | American Airlines</title>
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
<body onload="signedIn();">

<!-- Navbar (sit on top) -->
<div class="w3-top w3-midnight w3-padding w3-card">
  
    <a href="home.jsp" class="w3-bar-item w3-left" onclick="logout()"><img src="Images/logo.jpg" width="40" height="40" style="border-radius: 50%;"></a>

  
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:100%;" id="home">
  <img class="w3-image" src="Images/american.jpg" alt="Health" width="100%" height="auto">
</header>




  	<div id="signed_in" style="display:none;" >
    <div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Add route</h3>
		<form METHOD="post" class="form-inline">
			Origin Airport: <input type="text" name="origin" value="" size=3 maxlength=3 required>
			Destination Airport: <input type="text" name="destination" value="" size=3 maxlength=3 required>
			Number of stops: <input type="text" name="stops" value="" size=1 maxlength=1 required>
			Aircraft type(s) used: <input type="text" name="equipment" value="" required>
			<input type ="submit" name="addRoute" value ="Add Route" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<table>
		<br>
		<%
			if(request.getParameter("addRoute") != null)
			{
				String origin = request.getParameter("origin");
				String destination = request.getParameter("destination");	
				String stops = request.getParameter("stops");
				String equipment = request.getParameter("equipment");
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/AddRoute/"+origin+"/"+
						destination+"/"+stops+"/"+equipment);
				ClientResponse myresponse = webresource.accept("text/plain").post(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.print(output);
			}
		%>
		</table>
</div> 

	

<div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Remove route</h3>
		<form METHOD="post" class="form-inline">
			Origin Airport: <input type="text" name="origin" value="" size=3 maxlength=3 required>
			Destination Airport: <input type="text" name="destination" value="" size=3 maxlength=3 required>
			<input type ="submit" name="removeRoute" value ="Remove Route" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<table>
		<br>
		<%
			if(request.getParameter("removeRoute") != null)
			{
				String origin = request.getParameter("origin");
				String destination = request.getParameter("destination");	
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/RemoveRoute/"+origin+"/"+
						destination);
				ClientResponse myresponse = webresource.accept("text/plain").delete(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.print(output);
			}
		%>
		</table>
</div> 



<div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Add Announcement</h3>
		<form METHOD="post" class="form-inline">
			Name: <input type="text" name="aname" value="" required>
			Announcement: <input type="text" name="announcement" value="" required>
			<input type ="submit" name="addAnnouncement" value ="Add Announcement" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<table>
		<br>
		<%
			if(request.getParameter("addAnnouncement") != null)
			{
				String aname = request.getParameter("aname");
				String announcement = request.getParameter("announcement");	
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/AddAnnouncement/"+aname+"/"+
						announcement);
				ClientResponse myresponse = webresource.accept("text/plain").post(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.print(output);
			}
		%>
		</table>
</div> 


<div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Remove Announcement</h3>
		<form METHOD="post" class="form-inline">
			Name: <input type="text" name="aname" value="" required>
			<input type ="submit" name="removeAnnouncement" value ="Remove Announcement" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<table>
		<br>
		<%
			if(request.getParameter("removeAnnouncement") != null)
			{
				String aname = request.getParameter("aname");	
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/RemoveAnnouncement/"+aname);
				ClientResponse myresponse = webresource.accept("text/plain").delete(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.print(output);
			}
		%>
		</table>
</div> 




<div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Remove Comment</h3>
		<form METHOD="post" class="form-inline">
			Comment ID: <input type="number" name="commentID" value="" required>
			<input type ="submit" name="removeComment" value ="Remove Comment" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<table>
		<br>
		<%
			if(request.getParameter("removeComment") != null)
			{
				int commentID = Integer.parseInt(request.getParameter("commentID"));	
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/RemoveComment/"+commentID);
				ClientResponse myresponse = webresource.accept("text/plain").delete(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.print(output);
			}
		%>
		</table>
</div> 





<div class="w3-container w3-padding-32">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Promote or Demote a User (types: "simple" or "admin")</h3>
		<form METHOD="post" class="form-inline">
			Username: <input type="text" name="username" value="" required>
			New User Type: <input type="text" name="usertype" pattern="^(simple|admin).*$" value="" required>
			<input type ="submit" name="chageType" value ="Change user type" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<table>
		<br>
		<%
			if(request.getParameter("chageType") != null)
			{
				String username = request.getParameter("username");
				String type = request.getParameter("usertype");	
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/ChangeType/"+username+"/"+type);
				ClientResponse myresponse = webresource.accept("text/plain").put(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.print(output);
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
	document.cookie = "type=; path=/;";
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
	  } 
	}
	
	function isadmin(){
		  document.isadmin.submit();
		}
</script>






</body>
</html>
