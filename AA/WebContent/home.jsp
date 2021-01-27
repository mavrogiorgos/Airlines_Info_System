<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.sun.jersey.api.client.Client" %>
<%@ page import ="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import ="com.sun.jersey.api.client.WebResource" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<title>Home | American Airlines</title>
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

	#lala {
		padding:10px;
	    color: rgb(0,26,51);
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 1em;
	    height: 10%;
	    width:20%;
	    background-image: linear-gradient(to right top, #99bbcb, #a5c7d7, #b1d4e2, #bde0ee, #c9edfa);
	}
	
	
	#lala.sunny {
	    background-image: linear-gradient(to right top, #ff4e50, #ff713e, #ff932b, #ffb41d, #f9d423);
	}
	#lala.cloudy {
	    background-image: linear-gradient(to right top, #63747c, #71858e, #7f96a0, #8da8b2, #9bbac5);
	}
	#lala.rainy {
	    background-image: linear-gradient(to right top, #637c7b, #718e8c, #7ea09e, #8db2b0, #9bc5c3);
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
	
	@media (max-width: 800px) {
	  .form-inline input {
	    margin: 10px 0;
	  }
	
	  .form-inline {
	    flex-direction: column;
	    align-items: stretch;
	  }




	</style>
  
  
  
  
</head>
<script type="text/javascript">var username = 0;</script>
<body onload="signedIn();getLocation();">

<!-- Navbar (sit on top) -->
<div class="w3-top w3-midnight w3-padding w3-card">
  
    <a href="home.jsp" class="w3-bar-item w3-left"><img src="Images/logo.jpg" width="40" height="40" style="border-radius: 50%;"></a>
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
  <div class="w3-display-top">
    <span class=" w3-white ">
     <marquee width="100%" direction="right" onmouseover="this.stop();" onmouseout="this.start();"
	style="background-color:midnightblue; color:white; padding-top:10px; padding-bottom:10px;"class="w3-opacity-min">
	<%	
		Client client3 = Client.create();
		WebResource webresource3 = client3.resource("http://localhost:8080/AA/rest/AAService/Announcements");
		ClientResponse myresponse3 = webresource3.accept("text/plain").get(ClientResponse.class);
		String output3 = myresponse3.getEntity(String.class);
		List<String> fleetList = Arrays.asList(output3.split(","));
		for (int i=0; i<fleetList.size(); i++)
		{
			out.print(fleetList.get(i).replace("[","").replace("]",""));
		}
	%>
</marquee>

    
    </span> 
  </div>
</header>














	<!-- About Section -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">About us</h3>
	
    <div style=" text-align: justify; text-justify: inter-word; overflow: hidden;" class="w3-mobile">American Airlines, Inc. (AA) 
		is a major American airline headquartered in Fort Worth, Texas, within the Dallas-Fort Worth metroplex. 
		We are the world's largest airline 
		when measured by fleet size, scheduled passengers carried, and revenue passenger mile. American, 
		together <span id="dots">...</span><span id="more">  with our regional partners, operates an extensive international and domestic network with almost 6,800 flights per day to 
		nearly 350 destinations in more than 50 countries. American Airlines is a founding member of the Oneworld alliance, 
		the third-largest airline alliance in the world. Regional service is operated by independent and subsidiary carriers 
		under the brand name American Eagle.
		<br>
		American Airlines and American Eagle operate out of 10 hubs, with Dallas/Fort Worth (DFW) being its largest. 
		The airline handles more than 200 million passengers annually with an average of more than 500,000 passengers daily. 
		As of 2019, the American Airlines family consists of nearly 130,000 people!
		<br>
		American Airlines operates its primary and the largest Maintenance and Repair Operations (MRO) 
		base in Tulsa in addition to the maintenance locations at its hubs.	</span>
	</div>
	<br>
	<a onclick="showMore(); hide();" id="myBtn" class="w3-red w3-padding w3-hover-midnight w3-right" style="cursor: pointer;">More</a>
	</div>

	<div class="w3-container w3-padding-32">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Sign up</h3>
		<form METHOD="post" class="form-inline">
			Username: <input type="text" name="username" value="" required>
			Password: <input type="text" name="password" value="" required>
			<input type ="submit" name="signUp" value ="Sign Up" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<%
			if(request.getParameter("signUp") != null)
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String type = "simple";			
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/SignUp/"+username+"/"+
						password+"/"+type);
				ClientResponse myresponse = webresource.accept("text/plain").post(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.println(output);
			}
		%>
	</div>
	
	
	<div class="w3-container w3-padding-32">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Sign in</h3>
		<form METHOD="post" class="form-inline">
			Username: <input type="text" name="username" value="" required>
			Password: <input type="text" name="password" value="" required>
			<input type ="submit" name="signIn" value ="Sign In" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<%
			if(request.getParameter("signIn") != null)
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");		
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/SignIn/"+username+"/"+
						password);
				ClientResponse myresponse = webresource.accept("text/plain").post(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				%>
				<script type="text/javascript">document.cookie = "username=<%out.print(output);%>;path=/";</script>
				<% 
				
				Client client1 = Client.create();
				WebResource webresource1 = client1.resource("http://localhost:8080/AA/rest/AAService/CheckType/"+username);
				ClientResponse myresponse1 = webresource1.accept("text/plain").post(ClientResponse.class);
				String output1 = myresponse1.getEntity(String.class);
								%>
				<script type="text/javascript">document.cookie = "type=<%out.print(output1);%>;path=/";</script>
				<% 
				
			}
		%>
	</div>

	

<div id="signed_in" style="display:none;" >
  <!-- Actions Section -->
  <div class="w3-container w3-padding-32 " id="actions">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">What would you like to do?</h3>
  </div>

  <div class="w3-row-padding ">
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="flights.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight" >Find flights</div></a>
        <a href="fligths.jsp"><img src="Images/flights.jpg" alt="findflights" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="book.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Book a flight</div></a>
        <a href="book.jsp"><img src="Images/book.jpg" alt="book" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="checkin.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Check in</div></a>
        <a href="checkin.jsp"><img src="Images/checkin.jpg" alt="checkin" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="trips.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">My Trips</div><a>
        <a href="trips.jsp"><img src="Images/trips.jpg" alt="bioassist" style="width:100%"></a>
      </div>
    </div>
	<div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue; display:none;" id="admintab">
        <a href="admin.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Admin</div></a>
        <a href="admin.jsp"><img src="Images/admin.jpeg" alt="admin" style="width:100%"></a>
      </div>
    </div>
  </div>

</div>  
	
  

  

  
    
    <div style="text-align: center; position:fixed; bottom:10px; right:0; display:none" id="tweets">
    <a class="twitter-timeline" data-width="400" data-height="400" data-theme="light" href="https://twitter.com/AmericanAir?ref_src=twsrc%5Etfw">Tweets by AmericanAir</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    </div>
  	<button style="position:fixed; bottom:0; right:0; padding: 2; border: none; background-color: midnightblue; color:white;" onclick="tweets()">Twitter <i class="fa fa-twitter"></i></button>
	<button style="position:fixed; bottom:0; left:0; padding: 2; border: none; background-color: midnightblue; color:white;" onclick="showlala()">Weather <i class="fa fa-cloud"></i></button>


<div id="lala" style="display:none;">
  <div class="bg"></div>
	<div>
    <div id="description"></div>
    <div id="temp"></div>
    <div id="location"></div>
  </div>
  </div>
  <script type="text/javascript">
	  const key = '7ff70ce381b8c8194b27b370ae2efdc6';
	  if(key=='') document.getElementById('temp').innerHTML = ('Remember to add your api key!');
	
	  function weatherBallon(lat,lon) {
	  	fetch('https://api.openweathermap.org/data/2.5/weather?lat=' + lat+ '&lon=' + lon+ '&appid=' + key)  
	  	.then(function(resp) { return resp.json() }) // Convert data to json
	  	.then(function(data) {
	  		drawWeather(data);
	  	})
	  	.catch(function() {
	  		// catch any errors
	  	});
	  }
	  function drawWeather( d ) {
	    var celcius = Math.round(parseFloat(d.main.temp)-273.15);
	  	var fahrenheit = Math.round(((parseFloat(d.main.temp)-273.15)*1.8)+32);
	    var description = d.weather[0].description; 
	  	
	  	document.getElementById('description').innerHTML = "<i class='fa fa-binoculars'></i> "+description;
	  	document.getElementById('temp').innerHTML = "<i class='fa fa-thermometer'></i> "+ celcius + '&deg;';
	  	document.getElementById('location').innerHTML = "<i class='fa fa-map-marker'></i> "+ d.name;
	    
	    if( description.indexOf('rain') > 0 ) {
	    	document.body.className = 'rainy';
	    } else if( description.indexOf('cloud') > 0 ) {
	    	document.body.className = 'cloudy';
	    } else if( description.indexOf('sunny') > 0 ) {
	    	document.body.className = 'sunny';
	    } else {
	    	document.body.className = 'clear';
	    }
	  }
	  function getLocation() {
		  if (navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(showPosition);
		  } else { 
		    x.innerHTML = "Geolocation is not supported by this browser.";
		  }
		}
	  function showPosition(position) {
	  	weatherBallon(position.coords.latitude, position.coords.longitude);
	  }
  </script>



<!-- Footer -->
<footer class="w3-center w3-midnight w3-padding-16">
  <a href = "https://github.com/mavrogiorgos" style="text-decoration:none;">Kostis Mavrogiorgos</a> - All rights reserved &copy;
</footer>





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


function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    // because unescape has been deprecated, replaced with decodeURI
    //return unescape(dc.substring(begin + prefix.length, end));
    return decodeURI(dc.substring(begin + prefix.length, end));
} 



function signedIn() {
	  var myCookie = getCookie("username");
	  var adminCookie = getCookie("type");
	  var x = document.getElementById("signed_in");
	  var y = document.getElementById("admintab");
	  if(adminCookie==="simple")
	  {
		  x.style.display = "block";
			y.style.display = "block";
	  }
	  if(adminCookie==="admin")
	  {
		x.style.display = "block";
		y.style.display = "block";
	  }
	  else
	  {
		  y.style.display = "none";
	  }
	}
	
	function tweets() {
		  var x = document.getElementById("tweets");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	
	function showlala() {
		  var x = document.getElementById("lala");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	
</script>






</body>
</html>
