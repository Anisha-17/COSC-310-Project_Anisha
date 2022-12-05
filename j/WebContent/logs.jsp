<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>
<%@ include file="auth.jsp" %>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>







<div style="float:left;">
        <h2>Role</h2>
            <form method="get" action="logs.jsp">
                <input type="text" name="role" size="10">
                
            </form>
</div>

<div style="float:left;">
    <div style="margin: 10px;">
        <h2>Door</h2>
            <form method="get" action="logs.jsp">
                <input type="text" name="door" size="10">
                
            </form>
    </div>
</div>

<div style="float:left;">
    <div style="margin: 10px;">
        <h2>Access Status</h2>
            <form method="get" action="logs.jsp">
                <input type="text" name="accessStatus" size="10">
                
            </form>
    </div>
</div>

<div style="float:left;">
    <div style="margin: 10px;">
        <h2>Date</h2>
            <form method="get" action="logs.jsp">
                <input type="text" name="date" size="10">
                <input type="submit" value="Submit"><input type="reset" value="Reset"> 
            </form>
    </div>
</div>


<% 
String role = request.getParameter("role");
String door = request.getParameter("door");
String accessStatus = request.getParameter("accessStatus");
String date = "2022-11-14 20:19";
		
//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!


getConnection();

try{
	String sql = "SELECT RoleName, DoorToAccess, AccessStatus, Date " + 
    "FROM data WHERE RoleName LIKE ?, DoorToAccess ?, AccessStatus LIKE ?, Date ?";
	PreparedStatement p = con.prepareStatement(sql)	;
	
	ResultSet r = p.executeQuery();

    if(role == "null"){
        p.setString(1,"% ");
    } else {
        p.setString(1, "%" + role + "% ");
    }

    if(door == null){
        p.setString(2, "<> ANY (SELECT door FROM data) ");
    } else {
        p.setString(2,"=" + door);
    }

    if(accessStatus == null){
        p.setString(3,"% ");
    } else {
        p.setString(3,"%" + accessStatus + "% ");
    }

    if(date == null) {
        p.setString(4, "<> ANY (SELECT date FROM data) ");
    } else {
        p.setString(4, "=" + date);
    }


	while(r.next()){
		String role1 = r.getString("RoleName");
		String door1 = r.getString("DoorToAccess");
		String accessStatus1 = r.getString("AccessStatus").replace(' ','+');
		Double date1 = r.getDouble("Date");
        out.println("<table>");
		out.println("<tr><td>" + role1 + "</td><td>" + door1 + "</td><td>" + accessStatus1 +"</td><td>" + date1 + "</td></tr>");

	}

	out.println("</table>");
	con.close();

} catch( Exception e)
{
    out.println(e);
}




%>
</body>
</html>
=======
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

>>>>>>> 58f18b696a09873c362223a6b00fed8467a102f1
