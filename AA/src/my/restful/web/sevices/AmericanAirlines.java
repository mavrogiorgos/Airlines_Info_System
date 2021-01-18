package my.restful.web.sevices;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

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
			return username +" " +type;
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
	
}
