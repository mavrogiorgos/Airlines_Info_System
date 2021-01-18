<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.sun.jersey.api.client.Client" %>
<%@ page import ="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import ="com.sun.jersey.api.client.WebResource" %>
<!DOCTYPE html>
<html>
<title>Home | American Airlines</title>
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
<body onload="signedIn()">

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
</header>



	<!-- About Section -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">About us</h3>
	
    <div style=" text-align: justify; text-justify: inter-word; overflow: hidden;" class="w3-mobile">American Airlines, Inc. (AA) 
		is a major American airline headquartered in Fort Worth, Texas, within the Dallas–Fort Worth metroplex. 
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
			}
		%>
	</div>

	

<div id="signed_in" style="display:none;" >
  <!-- Actions Section -->
  <div class="w3-container w3-padding-32 w3-hide-small" id="actions">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">What would you like to do?</h3>
  </div>

  <div class="w3-row-padding w3-hide-small">
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="flights.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight" >Find flights</div></a>
        <a href="fligths.jsp"><img src="Images/flights.jpg" alt="unipi" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="ekpa.html"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Book a flight</div></a>
        <a href="ekpa.html"><img src="Images/book.jpg" alt="uoa" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="pada.html"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Check in</div></a>
        <a href="pada.html"><img src="Images/checkin.jpg" alt="uniwa" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="bio.html"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">My trips</div><a>
        <a href="bio.html"><img src="Images/trips.jpg" alt="bioassist" style="width:100%"></a>
      </div>
    </div>
	<div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: midnightblue;">
        <a href="admin.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Admin</div></a>
        <a href="admin.jsp"><img src="Images/admin.jpeg" alt="byte" style="width:100%"></a>
      </div>
    </div>
  </div>

</div>  
	
  

  

  <!-- News Section -->
<div class="w3-container w3-padding-32" id="news">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">News</h3>
    <div>
		<div class="w3-row-padding ">
		<!-- All the news, starting from the newest to the oldest -->
			<div class="w3-col 14 m4 w3-margin-bottom">
			  <img src="Images/kickoff.png" style="width:100%">
			  <h3>Αρχική συνάντηση</h3>
			  <p class="w3-opacity">10/07/2020</p>
			  <p style=" text-align: justify; text-justify: inter-word;">Πραγματοποιήθηκε με επιτυχία το kick-off meeting του beHEALTHIER, με συμμετοχή όλων των φορέων. Συζητήθηκαν βασικά ζητήματα που αφορούν το έργο,
					όπως το project coordination και το technical coordination. Δόθηκαν<span id="dots1">...</span><span id="more1"> κατευθύνσεις οι οποίες καθορίζουν την άριστη συνεργασία μεταξύ των φορέων.
					Τέλος, ορίστικαν με σαφήνεια οι στόχοι που καλείται να επιτύχει το έργο.</span> 					
				</p>
				<a onclick="showMore1()" id="myBtn1" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer;">Περισσότερα</a>
			</div>
			<!--
			<div class="w3-col 14 m4 w3-margin-bottom">
			  <img src="Images/kickoff.png" style="width:100%">
			  <h3>Αρχική συνάντηση</h3>
			  <p class="w3-opacity">10/07/2020</p>
			  <p style=" text-align: justify; text-justify: inter-word;">Πραγματοποιήθηκε με επιτυχία το kick-off meeting του beHEALTHIER, με συμμετοχή όλων των φορέων. Συζητήθηκαν βασικά ζητήματα που αφορούν το έργο,
					όπως το project coordination και το technical coordination. Δόθηκαν<span id="dots2">...</span><span id="more2"> κατευθύνσεις οι οποίες καθορίζουν την άριστη συνεργασία μεταξύ των φορέων.
					Τέλος, ορίστικαν με σαφήνεια οι στόχοι που καλείται να επιτύχει το έργο.Πραγματοποιήθηκε με επιτυχία το kick-off meeting του beHEALTHIER, με συμμετοχή όλων των φορέων. Συζητήθηκαν βασικά ζητήματα που αφορούν το έργο,
					όπως το project coordination και το technical coordination. Δόθηκαν κατευθύνσεις οι οποίες καθορίζουν την άριστη συνεργασία μεταξύ των φορέων.
					Τέλος, ορίστικαν με σαφήνεια οι στόχοι που καλείται να επιτύχει το έργο. Πραγματοποιήθηκε με επιτυχία το kick-off meeting του beHEALTHIER, με συμμετοχή όλων των φορέων. Συζητήθηκαν βασικά ζητήματα που αφορούν το έργο,
					όπως το project coordination και το technical coordination. Δόθηκαν κατευθύνσεις οι οποίες καθορίζουν την άριστη συνεργασία μεταξύ των φορέων.
					Τέλος, ορίστικαν με σαφήνεια οι στόχοι που καλείται να επιτύχει το έργο.</span> 	
				</p>
				<a onclick="showMore2()" id="myBtn2" class="w3-red w3-padding w3-hover-midnight">Περισσότερα</a>
			</div>
			<div class="w3-col 14 m4 w3-margin-bottom">
			  <img src="Images/kickoff.png" style="width:100%">
			  <h3>Αρχική συνάντηση</h3>
			  <p class="w3-opacity">10/07/2020</p>
			  <p style=" text-align: justify; text-justify: inter-word;">Πραγματοποιήθηκε με επιτυχία το kick-off meeting του beHEALTHIER, με συμμετοχή όλων των φορέων. Συζητήθηκαν βασικά ζητήματα που αφορούν το έργο,
					όπως το project coordination και το technical coordination. Δόθηκαν<span id="dots3">...</span><span id="more3"> κατευθύνσεις οι οποίες καθορίζουν την άριστη συνεργασία μεταξύ των φορέων.
					Τέλος, ορίστικαν με σαφήνεια οι στόχοι που καλείται να επιτύχει το έργο.Πραγματοποιήθηκε με επιτυχία το kick-off meeting του beHEALTHIER, με συμμετοχή όλων των φορέων. Συζητήθηκαν βασικά ζητήματα που αφορούν το έργο,
					όπως το project coordination και το technical coordination. Δόθηκαν κατευθύνσεις οι οποίες καθορίζουν την άριστη συνεργασία μεταξύ των φορέων.
					Τέλος, ορίστικαν με σαφήνεια οι στόχοι που καλείται να επιτύχει το έργο. Πραγματοποιήθηκε με επιτυχία το kick-off meeting του beHEALTHIER, με συμμετοχή όλων των φορέων. Συζητήθηκαν βασικά ζητήματα που αφορούν το έργο,
					όπως το project coordination και το technical coordination. Δόθηκαν κατευθύνσεις οι οποίες καθορίζουν την άριστη συνεργασία μεταξύ των φορέων.
					Τέλος, ορίστικαν με σαφήνεια οι στόχοι που καλείται να επιτύχει το έργο.</span>  	
				</p>
				<a onclick="showMore3()" id="myBtn3" class="w3-red w3-padding w3-hover-midnight">Περισσότερα</a>
			</div>
			-->
		</div>
		<br>
	</div>
  </div>

<!-- End page content -->
</div>


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
	  var x = document.getElementById("signed_in");
	  if(document.cookie.match(/^(.*;)?\s*username\s*=\s*[^;]+(.*)?$/))
	  {
	    x.style.display = "block";
	  }
	  else 
	  {
		  x.style.display = "none";
	  }
	}
	
	
	
</script>






</body>
</html>
