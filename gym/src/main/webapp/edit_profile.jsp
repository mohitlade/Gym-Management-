<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");

	con.createStatement().executeUpdate("update members set m_pwd='"+pwd+"' where m_id="+mid);

	response.sendRedirect("user_home.jsp");
%>
