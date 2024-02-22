<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String tid = request.getParameter("tid");

	con.createStatement().executeUpdate("delete from trainer where t_id="+tid);

	String appPath = request.getServletContext().getRealPath("/");

	java.io.File f = new java.io.File(appPath+"trainers/"+tid+".jpg");
	f.delete();

	response.sendRedirect("manage_trainers.jsp");
%>
