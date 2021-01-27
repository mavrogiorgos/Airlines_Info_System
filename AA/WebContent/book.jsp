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
<title>Book | American Airlines</title>
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

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

input[type=date] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

select{
width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
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
</header>


  	<div id="signed_in" style="display:none;" >
    <div class="w3-container w3-padding-32">
	 
	<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Calculate Cost</h3>
	<script>
	function origin()
	{
		var origin1 = document.getElementById("airport1");
		var airport1 = origin1.value;
		document.getElementById("origin1").value = airport1;
		alert("lala");
	}
	 
	function destination()
	{
		var origin2 = document.getElementById("airport2");
		var airport2 = origin2.value;
		document.getElementById("destination1").value = airport2; 
	}
	</script>
	<div class="container">
		<form METHOD="post" class="form-inline">     
	        <label for="state"><i class="fa fa-plane"></i> Origin Airport</label>
	        <select name="airport1" id = "airport1" onchange="origin();" required>
			<%
			String JDBC_DRIVER = "com.mysql.jdbc.Driver";
			String DB_URL = "jdbc:mysql://localhost/aa?autoReconnect=true&useSSL=false";
			String USER ="kostis";
			String PASS ="";
			Connection conn = null;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT Source_airport FROM routes;");
			ResultSet rs = ps.executeQuery();
			%><option selected="selected">-</option><%
			while(rs.next())
			{
				%><option value="<%out.print(rs.getString("Source_airport"));%>"><%out.print(rs.getString("Source_airport"));%></option><%
			}
			
			%>
			</select>
	          
	           
	             <label for="zip"><i class="fa fa-plane"></i> Destination Airport</label>
	             <select name="airport2" id = "airport2" onchange="destination();" required>
			<%
			PreparedStatement ps1 = conn.prepareStatement("SELECT DISTINCT Destination_airport FROM routes;");
			ResultSet rs1 = ps1.executeQuery();
			%><option selected="selected">-</option><%
			while(rs1.next())
			{
				%><option value="<%out.print(rs1.getString("Destination_airport"));%>"><%out.print(rs1.getString("Destination_airport"));%></option><%
			}
			
			%>
			</select>
			<input type ="submit" name="calculateCost" value ="Calculate Cost" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>
	</div>
	
		<br>
		<%
			if(request.getParameter("calculateCost") != null)
			{
				String origin = request.getParameter("airport1");
				String destination = request.getParameter("airport2");		
				Client client1 = Client.create();
				WebResource webresource1 = client1.resource("http://localhost:8080/AA/rest/AAService/CalculateCost/"+origin+"/"+
						destination);
				ClientResponse myresponse1 = webresource1.accept("text/plain").get(ClientResponse.class);
				String output1 = myresponse1.getEntity(String.class);
				out.print(output1);
				%>
				<script type="text/javascript">document.cookie = "cost=<%out.print(output1);%>;path=/";
				document.cookie = "origin=<%out.print(origin);%>;path=/";
				document.cookie = "destination=<%out.print(destination);%>;path=/";
				</script>
				<% 
			}
		%>
	
	
	
	<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Flight Booking</h3>
	<div class="row">
  <div class="col-75">
    <div class="container">
      <form METHOD="post">

        <div class="row">
          <div class="col-50">
            <h3>Personal info</h3>
            <label for="fname"><i class="fa fa-user"></i> Username</label>
            <input type="text" id="username" name="username" placeholder="" maxlength="20" readonly="readonly" required>
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="komav@unip.gr" required>
            <label for="date"><i class="fa fa-calendar"></i> Departure Date</label>
            <input type="text" id="ddate" name="ddate" placeholder="dd-mm-yyyy" pattern="\d{1,2}-\d{1,2}-\d{4}" maxlength="10" required>
            <label for="fname"><i class="fa fa-plane"></i> Origin Airport</label>
            <input type="text" name="origin" value="" id ="origin" readonly="readonly">
            <label for="fname"><i class="fa fa-plane"></i> Destination Airport</label>
			<input type="text" name="destination" value="" id ="destination" readonly="readonly">  
          </div>



          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="ccnum">Credit card number</label>
            <input type="text" id="card_num" name="card_num" placeholder="1111222233334444" pattern="[0-9]{13,16}" required>

            <div class="row">
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352" minlength="3" maxlength="4" required>
                <label for="fname"><i class="fa fa-money"></i> Cost</label>
				<input type="text" name="cost" value="" id ="cost" required readonly="readonly">
              </div>
            </div>
          </div>

        </div>
        <input type="submit" value="Book my seat!" name="book" class="btn">
      </form>
      <%
			if(request.getParameter("book") != null)
			{
				String username = request.getParameter("username");
				String email = request.getParameter("email");
				String ddate = request.getParameter("ddate");
				String origin = request.getParameter("origin");
				String destination = request.getParameter("destination");
				String card_num = request.getParameter("card_num");
				String cvv = request.getParameter("cvv");
				String cost = request.getParameter("cost");			
				Client client1 = Client.create();
				WebResource webresource1 = client1.resource("http://localhost:8080/AA/rest/AAService/Book/"+username+"/"+
						email+"/"+ddate+"/"+origin+"/"+destination+"/"+card_num+"/"
						+cvv+"/"+cost);
				ClientResponse myresponse1 = webresource1.accept("text/plain").post(ClientResponse.class);
				String output1 = myresponse1.getEntity(String.class);
				out.println(output1);
			}
		%>
    </div>
  </div>

</div>
	
	
	
	
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
	
	
</script>






</body>
</html>
