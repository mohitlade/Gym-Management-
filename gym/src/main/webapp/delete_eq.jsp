<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String eid = request.getParameter("eid");

	con.createStatement().executeUpdate("delete from equipment where eq_id="+eid);

	String appPath = request.getServletContext().getRealPath("/");

	java.io.File f = new java.io.File(appPath+"equipments/"+eid+".jpg");
	f.delete();

	response.sendRedirect("manage_equipments.jsp");
%>
