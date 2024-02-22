<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String pid = request.getParameter("pid");

	con.createStatement().executeUpdate("delete from diet_plans where diet_plan_id="+pid);

	String appPath = request.getServletContext().getRealPath("/");

	java.io.File f = new java.io.File(appPath+"diet_plans/"+pid+".jpg");
	f.delete();

	response.sendRedirect("manage_diet_plans.jsp");
%>
