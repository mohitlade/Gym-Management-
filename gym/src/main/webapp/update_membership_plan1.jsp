<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
	String pid = request.getParameter("pid");
	String pname = request.getParameter("pname");
	String ptype = request.getParameter("ptype");
	String pprice = request.getParameter("pprice");
	String pdisc = request.getParameter("pdisc");

	con.createStatement().executeUpdate("update membership_plans set plan_name='"+pname+"',plan_type='"+ptype+"',plan_price="+pprice+",plan_disc="+pdisc+" where plan_id="+pid);
	response.sendRedirect("manage_membership_plans.jsp");
%>

