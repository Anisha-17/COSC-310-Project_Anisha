<%@ page import="java.sql.*"%>

<%!
	// User id, password, and server information
	private String url = "jdbc:sqlserver://cosc304_sqlserver:1433;TrustServerCertificate=True";
	private String urlOrders = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=orders;TrustServerCertificate=True";
	private String uid = "sa";
	private String pw = "304#sa#pw";

	// Connection
	private Connection con = null;
%>

<%!
	public void getConnection() throws SQLException 
	{
		try
		{	// Load driver class
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}
		catch (java.lang.ClassNotFoundException e)
		{
			throw new SQLException("ClassNotFoundException: " +e);
		}
	
		con = DriverManager.getConnection(url, uid, pw);
	}

	public void closeConnection() throws SQLException 
	{
		if (con != null)
			con.close();
		con = null;
	}
%>