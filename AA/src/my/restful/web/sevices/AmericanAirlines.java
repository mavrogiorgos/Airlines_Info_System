package my.restful.web.sevices;

import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.Random;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Path("AAService")
public class AmericanAirlines {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/aa?autoReconnect=true&useSSL=false";
	
	static final String USER ="kostis";
	static final String PASS ="";
	
	@POST
	@Path("/SignUp/{username}/{password}/{type}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String signUp(@PathParam("username") String username,
			@PathParam("password") String password, @PathParam("type") String type) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		int count = 0;
		PreparedStatement ps = conn.prepareStatement("INSERT INTO users (username, password, type) VALUES (?,?,?)");
		ps.setString(1,username);
		ps.setString(2,password);
		ps.setString(3,type);
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM users WHERE username=?;");
		ps1.setString(1, username);
		ResultSet number_of_users = ps1.executeQuery();
		while(number_of_users.next())
		{
			count++;
		}
		System.out.println(count);
		
		if(count!=0)
		{
			return "There is another user with the same username.";
		}
		else if(count==0) 
		{
			ps.executeUpdate();
			return "Welcome to American Airlines!";
		}
		conn.close();
		return("Oops");
	}
	
	
	@POST
	@Path("/SignIn/{username}/{password}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String signIn(@PathParam("username") String username,
			@PathParam("password") String password) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		int count = 0;
		String type = "None";
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?;");
		ps1.setString(1, username);
		ps1.setString(2, password);
		ResultSet number_of_users = ps1.executeQuery();
		while(number_of_users.next())
		{
			type = number_of_users.getString("type");
			count++;
		}
		System.out.println(count);
		
		if(count!=0)
		{
			return ""+username;
		}
		else if(count==0) 
		{
			return "Failed to sign in.";
		}
		conn.close();
		return("Oops");
	}
	
	@GET
	@Path("/SearchRoute/{origin}/{destination}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String searchRoute(@PathParam("origin") String origin,
			@PathParam("destination") String destination) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps_number_of_rows = conn.prepareStatement("SELECT * FROM routes WHERE Source_airport=? AND Destination_airport=?;");
		ps_number_of_rows.setString(1, origin);
		ps_number_of_rows.setString(2, destination);
		ResultSet rs_number_of_rows = ps_number_of_rows.executeQuery();
		int number_of_rows=0;
		while(rs_number_of_rows.next())
		{
			number_of_rows++;
		}
		ps_number_of_rows.close();
		String[] routes = new String[number_of_rows];
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM routes WHERE Source_airport=? AND Destination_airport=?;");
		ps.setString(1, origin);
		ps.setString(2, destination);
		ResultSet rs = ps.executeQuery();
		int route_num = 0;
		while(rs.next())
		{
			routes[route_num] = "Airline: "+rs.getString("Airline")+" Origin Airport: "+rs.getString("Source_airport")
					+" Destination Airport: "
					+rs.getString("Destination_airport")+" Number of stops: "+
					rs.getString("Stops")+" Available aircraft(s) "+ rs.getString("Equipment")+"\n";
			route_num++;
		
		} 
		if(route_num==0)
		{
			return("No route found.");
		}
		System.out.println(Arrays.asList(routes));
		return "" + Arrays.asList(routes);
	}
	
	@GET
	@Path("/ShowFleet")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String test() throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps_number_of_rows = conn.prepareStatement("SELECT * FROM fleet;");
		ResultSet rs_number_of_rows = ps_number_of_rows.executeQuery();
		int number_of_rows=0;
		while(rs_number_of_rows.next())
		{
			number_of_rows++;
		}
		ps_number_of_rows.close();
		String[] fleet = new String[number_of_rows];
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM fleet;");
		ResultSet rs = ps.executeQuery();
		int fleet_num = 0;
		while(rs.next())
		{
			fleet[fleet_num] = "Name: "+rs.getString("Name")+" IATA code: "+rs.getString("IATA_code")
			+" ICAO  code: "+rs.getString("ICAO_code");
			fleet_num++;
		
		} 
		System.out.println(Arrays.asList(fleet));
		return "" + Arrays.asList(fleet);
	}
	
	@GET
	@Path("/AvailableAirports")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String availableAirports() throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps_number_of_rows = conn.prepareStatement("SELECT Source_airport FROM fleet;");
		ResultSet rs_number_of_rows = ps_number_of_rows.executeQuery();
		int number_of_rows=0;
		while(rs_number_of_rows.next())
		{
			number_of_rows++;
		}
		ps_number_of_rows.close();
		String[] airport = new String[number_of_rows];
		PreparedStatement ps = conn.prepareStatement("SELECT Source_airport FROM fleet;");
		ResultSet rs = ps.executeQuery();
		int airport_num = 0;
		while(rs.next())
		{
			airport[airport_num] = rs.getString("Source_airport");
			airport_num++;
		
		} 
		System.out.println(Arrays.asList(airport));
		return "" + Arrays.asList(airport);
	}
	
	
	@GET
	@Path("/CalculateDistance/{origin}/{destination}")
	@Produces(MediaType.TEXT_PLAIN)
	public static String distFrom(@PathParam("origin") String origin,
			@PathParam("destination") String destination) throws SQLException, ClassNotFoundException
	{
		float lat1 = 0;
		float lng1 = 0; 
		float lat2 = 0; 
		float lng2 = 0;
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement origin_lat_ps = conn.prepareStatement("SELECT Latitude_deg FROM airports WHERE Iata_code=?;");
		origin_lat_ps.setString(1, origin);
		ResultSet origin_lat_rs = origin_lat_ps.executeQuery();
		while(origin_lat_rs.next())
		{
			lat1 = origin_lat_rs.getFloat("Latitude_deg");
		}
		
		PreparedStatement origin_lng_ps = conn.prepareStatement("SELECT Longitude_deg FROM airports WHERE Iata_code=?;");
		origin_lng_ps.setString(1, origin);
		ResultSet origin_lng_rs = origin_lng_ps.executeQuery();
		while(origin_lng_rs.next())
		{
			lng1 = origin_lng_rs.getFloat("Longitude_deg");
		}
		
		PreparedStatement destination_lat_ps = conn.prepareStatement("SELECT Latitude_deg FROM airports WHERE Iata_code=?;");
		destination_lat_ps.setString(1, destination);
		ResultSet destination_lat_rs = destination_lat_ps.executeQuery();
		while(destination_lat_rs.next())
		{
			lat2 = destination_lat_rs.getFloat("Latitude_deg");
		}
		
		PreparedStatement destination_lng_ps = conn.prepareStatement("SELECT Longitude_deg FROM airports WHERE Iata_code=?;");
		destination_lng_ps.setString(1, destination);
		ResultSet destination_lng_rs = destination_lng_ps.executeQuery();
		while(destination_lng_rs.next())
		{
			lng2 = destination_lng_rs.getFloat("Longitude_deg");
		}
		conn.close();
		
		
	    double earthRadius = 6371000; //meters
	    double dLat = Math.toRadians(lat2-lat1);
	    double dLng = Math.toRadians(lng2-lng1);
	    double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
	               Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
	               Math.sin(dLng/2) * Math.sin(dLng/2);
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    float dist = (float) (earthRadius * c);
	    float dist_in_km = dist/1000;

	    return "The distance between the selected airports is: " +dist_in_km+ " kilometers.";
	    }
	
	
	
	@GET
	@Path("/CalculateCost/{origin}/{destination}")
	@Produces(MediaType.TEXT_PLAIN)
	public static String calculateCost(@PathParam("origin") String origin,
			@PathParam("destination") String destination) throws SQLException, ClassNotFoundException
	{
		float lat1 = 0;
		float lng1 = 0; 
		float lat2 = 0; 
		float lng2 = 0;
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement origin_lat_ps = conn.prepareStatement("SELECT Latitude_deg FROM airports WHERE Iata_code=?;");
		origin_lat_ps.setString(1, origin);
		ResultSet origin_lat_rs = origin_lat_ps.executeQuery();
		while(origin_lat_rs.next())
		{
			lat1 = origin_lat_rs.getFloat("Latitude_deg");
		}
		
		PreparedStatement origin_lng_ps = conn.prepareStatement("SELECT Longitude_deg FROM airports WHERE Iata_code=?;");
		origin_lng_ps.setString(1, origin);
		ResultSet origin_lng_rs = origin_lng_ps.executeQuery();
		while(origin_lng_rs.next())
		{
			lng1 = origin_lng_rs.getFloat("Longitude_deg");
		}
		
		PreparedStatement destination_lat_ps = conn.prepareStatement("SELECT Latitude_deg FROM airports WHERE Iata_code=?;");
		destination_lat_ps.setString(1, destination);
		ResultSet destination_lat_rs = destination_lat_ps.executeQuery();
		while(destination_lat_rs.next())
		{
			lat2 = destination_lat_rs.getFloat("Latitude_deg");
		}
		
		PreparedStatement destination_lng_ps = conn.prepareStatement("SELECT Longitude_deg FROM airports WHERE Iata_code=?;");
		destination_lng_ps.setString(1, destination);
		ResultSet destination_lng_rs = destination_lng_ps.executeQuery();
		while(destination_lng_rs.next())
		{
			lng2 = destination_lng_rs.getFloat("Longitude_deg");
		}
		conn.close();
		
		
	    double earthRadius = 6371000; //meters
	    double dLat = Math.toRadians(lat2-lat1);
	    double dLng = Math.toRadians(lng2-lng1);
	    double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
	               Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
	               Math.sin(dLng/2) * Math.sin(dLng/2);
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    float dist = (float) (earthRadius * c);
	    float dist_in_km = dist/1000;
	    
	    double cost = Math.floor(dist_in_km/10);
	    return ""+cost;
	    }
	
	
	
	
	@POST
	@Path("/Book/{username}/{email}/{ddate}/{origin}/{destination}"
			+ "/{card_num}/{cvv}/{cost}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String book(@PathParam("username") String username,
			 @PathParam("email") String email
			, @PathParam("ddate") String ddate, @PathParam("origin") String origin
			, @PathParam("destination") String destination, @PathParam("card_num") String card_num, 
			@PathParam("cvv") String cvv
			, @PathParam("cost") String cost) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("INSERT INTO bookings (username, email"
				+ ", ddate, origin, destination, card_num, cvv, cost, checked_in) VALUES (?,?,?,?,?,?,?,?,?)");
		ps.setString(1,username);
		ps.setString(2,email);
		ps.setString(3,ddate);
		ps.setString(4,origin);
		ps.setString(5,destination);
		ps.setString(6,card_num);
		ps.setString(7,cvv);
		ps.setString(8,cost);
		ps.setString(9,"NO");
		ps.executeUpdate();
		conn.close();
		return(username+", your seat is booked!");
	}
	
	
	
	
	
	
	@GET
	@Path("/Announcements")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String announcements() throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps_number_of_rows = conn.prepareStatement("SELECT announcement FROM announcements;");
		ResultSet rs_number_of_rows = ps_number_of_rows.executeQuery();
		int number_of_rows=0;
		while(rs_number_of_rows.next())
		{
			number_of_rows++;
		}
		ps_number_of_rows.close();
		String[] announcements = new String[number_of_rows];
		PreparedStatement ps = conn.prepareStatement("SELECT announcement FROM announcements;");
		ResultSet rs = ps.executeQuery();
		int announcements_num = 0;
		while(rs.next())
		{
			announcements[announcements_num] = rs.getString("announcement");
			announcements_num++;
		
		} 
		System.out.println(Arrays.asList(announcements));
		return "" + Arrays.asList(announcements);
	}
	
	
	
	
	
	
	
	
	
	
	@POST
	@Path("/CheckType/{username}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String checkType(@PathParam("username") String username) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		int count = 0;
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM users WHERE username=? AND type=?;");
		ps1.setString(1, username);
		ps1.setString(2, "admin");
		ResultSet number_of_users = ps1.executeQuery();
		while(number_of_users.next())
		{
			count++;
		}
		System.out.println(count);
		
		if(count!=0)
		{
			return "admin";
		}
		else if(count==0) 
		{
			return "simple";
		}
		conn.close();
		return("Oops");
	}
	
	
	@POST
	@Path("/Checkin/{username}/{date}/{origin}/{destination}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String checkin(@PathParam("username") String username,@PathParam("date") String date
			,@PathParam("origin") String origin,@PathParam("destination") String destination) throws SQLException, ClassNotFoundException, ParseException 
	{
		//create boarding number to return if check in is successful
		char[] chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder((100000 + rnd.nextInt(900000)) + "-");
		for (int i = 0; i < 5; i++)
		    sb.append(chars[rnd.nextInt(chars.length)]);
		 
	    
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
	    LocalDateTime now = LocalDateTime.now();  
	    String currentDate = dtf.format(now); 
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM bookings WHERE username=? AND ddate=? AND origin=?"
				+ "AND destination=?;");
		ps1.setString(1, username);
		ps1.setString(2, date);
		ps1.setString(3, origin);
		ps1.setString(4, destination);
		ResultSet number_of_users = ps1.executeQuery();
		while(number_of_users.next())
		{
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			String bookedDate = number_of_users.getString("ddate");
			Date date1 = format.parse(currentDate);
		    Date date2 = format.parse(bookedDate);
		    if ((date1.compareTo(date2) <= 0) && number_of_users.getString("checked_in").contentEquals("NO")) {
		    	PreparedStatement ps2 = conn.prepareStatement("UPDATE bookings SET checked_in=?, boarding_num=? WHERE username=? AND ddate=? AND origin=?"
						+ "AND destination=?;");
		    	ps2.setString(1, "YES");
				ps2.setString(2, sb.toString());
		    	ps2.setString(3, username);
				ps2.setString(4, date);
				ps2.setString(5, origin);
				ps2.setString(6, destination);
				ps2.executeUpdate();
		        return "Your check in is successfull. Your boarding number is "+sb.toString()+". It will be available in My Trips section in case you forget it.";
		    }
		    else return "You either have not booked this flight or you have already checked in. Please check your booked flights.";
		}
		conn.close();
		return("Oops");
	}
	
	
	
	
	
	
	
	
	
	@GET
	@Path("/ShowBoardingNumber/{username}/{date}/{origin}/{destination}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String showBoardingNumber(@PathParam("username") String username,@PathParam("date") String date
			,@PathParam("origin") String origin,@PathParam("destination") String destination) throws SQLException, ClassNotFoundException, ParseException 
	{
		int count = 0;
		String boarding_num = null;
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps1 = conn.prepareStatement("SELECT boarding_num FROM bookings WHERE username=? AND ddate=? AND origin=?"
				+ "AND destination=?;");
		ps1.setString(1, username);
		ps1.setString(2, date);
		ps1.setString(3, origin);
		ps1.setString(4, destination);
		ResultSet number_of_users = ps1.executeQuery();
		while(number_of_users.next())
		{
		    boarding_num = number_of_users.getString("boarding_num");
		    count++;
		}
		conn.close();
		if(count == 0 )
		{
			return "It looks like you have not booked or checked in.";
		}
		else if (count == 1)
		{
			return "Your boarding number is: "+boarding_num;
		}
		else return "Something went wrong.";
		
	}
	
	
	
	
	
	@GET
	@Path("/ShowTrips/{username}")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String showTrips(@PathParam("username") String username) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM bookings WHERE username=? AND checked_in=?;");
		ps1.setString(1, username);
		ps1.setString(2, "YES");
		ResultSet rs1 = ps1.executeQuery();
		int number_of_rows=0;
		while(rs1.next())
		{
			number_of_rows++;
		}
		rs1.close();
		String[] trips = new String[number_of_rows];
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM bookings WHERE username=? AND checked_in=?;");
		ps.setString(1, username);
		ps.setString(2, "YES");
		ResultSet rs = ps.executeQuery();
		int trips_num = 0;
		while(rs.next())
		{
			trips[trips_num] = "Origin: "+rs.getString("origin")+" Destination: "+rs.getString("destination")
			+" Date: "+rs.getString("ddate");
			trips_num++;
		
		} 
		System.out.println(Arrays.asList(trips));
		return "" + Arrays.asList(trips);
	}
	
	
	
	
	
	@POST
	@Path("/MakeComment/{username}/{comment}")
	@Produces(MediaType.TEXT_PLAIN)
	public String makeComment(@PathParam("username") String username,
			@PathParam("comment") String comment) throws SQLException, ClassNotFoundException
	{
		comment = comment.replaceAll("\\+"," ");
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("INSERT INTO comments (username, comment) VALUES (?,?)");
		ps.setString(1,username);
		ps.setString(2,comment);
		ps.executeUpdate();
		return "Thank you for your comment "+username+" !";
	}
	
	
	
	
	
	@GET
	@Path("/ShowComments")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String showComments() throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps1 = conn.prepareStatement("SELECT username,comment FROM comments;");
		ResultSet rs1 = ps1.executeQuery();
		int number_of_rows=0;
		while(rs1.next())
		{
			number_of_rows++;
		}
		rs1.close();
		String[] comments = new String[number_of_rows];
		PreparedStatement ps = conn.prepareStatement("SELECT username,comment FROM comments;");
		ResultSet rs = ps.executeQuery();
		int comments_num = 0;
		while(rs.next())
		{
			comments[comments_num] = "Username: "+rs.getString("username")+" Comment: "+rs.getString("comment");
			comments_num++;
		
		} 
		System.out.println(Arrays.asList(comments));
		return "" + Arrays.asList(comments);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---------------------------Administration Services-----------------------------------------
	
	
	@POST
	@Path("/AddRoute/{source_airport}/{destination_airport}/{stops}/{equipment}")
	@Produces(MediaType.TEXT_PLAIN)
	public String addRoute(@PathParam("source_airport") String source_airport,
			@PathParam("destination_airport") String destination_airport,
			@PathParam("stops") String stops,
			@PathParam("equipment") String equipment) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("INSERT INTO routes (Airline, Source_airport, Destination_airport, Stops, Equipment) VALUES (?,?,?,?,?)");
		ps.setString(1,"AA");
		ps.setString(2,source_airport);
		ps.setString(3,destination_airport);
		ps.setString(4,stops);
		ps.setString(5,equipment);
		ps.executeUpdate();
		return "The route from "+source_airport+" to "+destination_airport+" was successfully added.";
	}
	
	@DELETE
	@Path("/RemoveRoute/{source_airport}/{destination_airport}")
	@Produces(MediaType.TEXT_PLAIN)
	public String removeRoute(@PathParam("source_airport") String source_airport,
			@PathParam("destination_airport") String destination_airport) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("DELETE FROM routes WHERE Source_airport=? AND Destination_airport=?");
		ps.setString(1,source_airport);
		ps.setString(2,destination_airport);
		ps.executeUpdate();
		return "The route from "+source_airport+" to "+destination_airport+" was successfully deleted.";
	}
	
	
	@POST
	@Path("/AddAnnouncement/{aname}/{announcement}")
	@Produces(MediaType.TEXT_PLAIN)
	public String addAnnouncement(@PathParam("aname") String aname,
			@PathParam("announcement") String announcement) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("INSERT INTO announcements (name, announcement) VALUES (?,?)");
		ps.setString(1,aname);
		ps.setString(2,announcement);
		ps.executeUpdate();
		return "The announcement named "+aname+" was successfully added.";
	}
	
	
	
	@DELETE
	@Path("/RemoveAnnouncement/{aname}")
	@Produces(MediaType.TEXT_PLAIN)
	public String removeAnnouncement(@PathParam("aname") String aname) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("DELETE FROM announcements WHERE name=?");
		ps.setString(1,aname);
		ps.executeUpdate();
		return "The announcement named "+aname+" was successfully removed.";
	}
	
	
	@PUT 
	@Path("/ChangeType/{username}/{type}")
	@Produces(MediaType.TEXT_PLAIN)
	public String changeType(@PathParam("username") String username,
			@PathParam("type") String type) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("UPDATE users SET type=? WHERE username=?");
		ps.setString(1,type);
		ps.setString(2,username);
		ps.executeUpdate();
		return "The type of the user named "+username+" was successfully changed to: "+type;
	}
	
	
	
	@DELETE
	@Path("/RemoveComment/{commentID}")
	@Produces(MediaType.TEXT_PLAIN)
	public String removeComment(@PathParam("commentID") int commentID) throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps = conn.prepareStatement("DELETE FROM comments WHERE comment_id=?");
		ps.setInt(1,commentID);
		ps.executeUpdate();
		return "The comment with the ID "+commentID+" was successfully removed.";
	}
	
	
	
}
