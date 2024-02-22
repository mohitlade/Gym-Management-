<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String pid = request.getParameter("pid");

	con.createStatement().executeUpdate("delete from membership_plans where plan_id="+pid);

	response.sendRedirect("manage_membership_plans.jsp");
%>
