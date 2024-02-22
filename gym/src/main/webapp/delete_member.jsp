<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String mid = request.getParameter("mid");

	con.createStatement().executeUpdate("delete from members where m_id="+mid);

	response.sendRedirect("manage_members.jsp");
%>
