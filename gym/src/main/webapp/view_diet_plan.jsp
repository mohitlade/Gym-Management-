<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String uid = session.getAttribute("uid").toString();

	ResultSet rs = con.createStatement().executeQuery("select diet_plan_id from members where m_id="+uid);
	rs.next();
%>
<center>
<div style='padding:10px;'><a href='user_home.jsp' class='linkbtn'>Home</a></div>
<image width='80%' height='80%' src='diet_plans/<%=rs.getInt(1)%>.jpg'/>
</center>
