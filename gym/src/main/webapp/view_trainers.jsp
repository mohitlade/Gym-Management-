<link rel="stylesheet"href="css/style.css">
<center>

<div style='padding:10px;'><a href='user_home.jsp' class='linkbtn'>Home</a></div>

<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	ResultSet rs = con.createStatement().executeQuery("select * from trainer order by t_id");
	while(rs.next()){
%>
<table width=600 height=400 style='background:linen;'>
<tr>
	<td align='center'>
		<table>
		<tr><td><b>ID:</b></td><td><%=rs.getString(1)%></td>
		<tr><td><b>Name:</b></td><td><%=rs.getString(2)%></td>
		<tr><td><b>Gender:</b></td><td><%=rs.getString(3)%></td>
		<tr><td><b>Type:</b></td><td><%=rs.getString(4)%></td>
		<tr><td><b>Address:</b></td><td><%=rs.getString(5)%></td>
		<tr><td><b>Phone:</b></td><td><%=rs.getString(6)%></td>
		<tr><td><b>Email:</b></td><td><%=rs.getString(7)%></td>
		<tr><td><b>Birth Date:</b></td><td><%=rs.getString(8)%></td>
		<tr><td><b>Join Date:</b></td><td><%=rs.getString(9)%></td>
		</table>
	</td>
	<td align='center'>
	<img src='trainers/<%=rs.getString(1)+".jpg"%>' width='200px' height='200px'/>
	</td>
</tr>
</table>
<br>
<%
	}
%>
</center>
