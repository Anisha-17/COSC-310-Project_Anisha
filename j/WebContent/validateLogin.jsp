<%@ page language="java" import="java.io.*,java.sql.*, org.apache.hc.client5.http.fluent.*, org.apache.http.client.*"%>

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
		response.sendRedirect("logs.jsp");		// Successful login
	else
		response.sendRedirect("login.jsp");		// Failed login - redirect back to login page with a message  --%>

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


			getConnection();

			// TODO: Check if userId and password match some customer account. If so, set retStr to be the username.
			String q = "SELECT username, password FROM account WHERE username = ? AND password = ?";
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

		HttpClient client = HttpClientBuilder.create().build();
		HttpClient httpClient = new DefaultHttpClient();
		HttpGet request = new HttpGet("https://api.myip.com");
		try {
			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();
			String content = EntityUtils.toString(entity);

			String address = content.subString(7,18);

			String add = "INSERT INTO ip VALUES ?, ? ;"
			PreparedStatement pr = con.prepareStatement(add); */
			pr.setString(1, username);
			pr.setString(2, address);
		p.execute(); }



		
			
		
		if(retStr != null)
		{	session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser",username);
			
		}
		else
			session.setAttribute("loginMessage","Could not connect to the system using that username/password.");

		return retStr;
	}
%>

