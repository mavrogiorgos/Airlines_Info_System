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
		PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?;");
		ps1.setString(1, username);
		ps1.setString(2, password);
		ResultSet number_of_users = ps1.executeQuery();
		while(number_of_users.next())
		{
			count++;
		}
		System.out.println(count);
		
		if(count!=0)
		{
			return username;
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
			routes[route_num] = "Airline: "+rs.getString("Airline")+" Source Airport: "+rs.getString("Source_airport")
					+" Destination Airport: "
					+rs.getString("Destination_airport")+" Number of stops: "+
					rs.getString("Stops")+" Available aircraft(s) "+ rs.getString("Equipment")+"\n";
			route_num++;
		
		} 
		System.out.println(Arrays.asList(routes));
		return "Available routes: " + Arrays.asList(routes);
	}
	
	@GET
	@Path("/Test")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces("text/plain")
	public String test() throws SQLException, ClassNotFoundException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		PreparedStatement ps_number_of_rows = conn.prepareStatement("SELECT * FROM users;");
		ResultSet rs_number_of_rows = ps_number_of_rows.executeQuery();
		int number_of_rows=0;
		while(rs_number_of_rows.next())
		{
			number_of_rows++;
		}
		ps_number_of_rows.close();
		String[] routes = new String[number_of_rows];
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM users;");
		ResultSet rs = ps.executeQuery();
		int route_num = 0;
		while(rs.next())
		{
			routes[route_num] = "Username: "+rs.getString("username")+" Password: "+rs.getString("Password");
			route_num++;
		
		} 
		System.out.println(Arrays.asList(routes));
		return "Users: " + Arrays.asList(routes);
	}
	
	
}
