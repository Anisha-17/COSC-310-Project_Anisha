<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>
<%
	String authenticatedUser = null;
	session = request.getSession(true);

	out.println("Test");

	try
	{
		authenticatedUser = validateLogin(out,request,session);
		
	}
	catch(IOException e)
	{	System.err.println(e); }

	if(authenticatedUser != null)
		response.sendRedirect("index.jsp");		// Successful login
	else
<<<<<<< HEAD
		response.sendRedirect("logs.jsp");		// Failed login - redirect back to login page with a message  --%>
=======
		response.sendRedirect("login.jsp");		// Failed login - redirect back to login page with a message  --%>
>>>>>>> 58f18b696a09873c362223a6b00fed8467a102f1
%>


<%!
	String validateLogin(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String retStr = null;

		out.println(username);
		out.println(password);

		if(username == null || password == null)
				return null;
		if((username.length() == 0) || (password.length() == 0))
				return null;

		try 
		{

<<<<<<< HEAD
			getConnection();
=======
			getConnectionForOrders();
>>>>>>> 58f18b696a09873c362223a6b00fed8467a102f1
			// TODO: Check if userId and password match some customer account. If so, set retStr to be the username.
			String q = "SELECT username, password FROM account WHERE userid = ? AND password = ?";
			PreparedStatement p = con.prepareStatement(q);
			p.setString(1, username);
			p.setString(2, password);
			ResultSet r = p.executeQuery();
			while (r.next()) {
				retStr = username;
			}		
		} 
		catch (Exception ex) {
			out.println(ex);
		}
			
		
		if(retStr != null)
		{	session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser",username);
		}
		else
			session.setAttribute("loginMessage","Could not connect to the system using that username/password.");

		return retStr;
	}
%>

