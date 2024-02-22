<link rel="stylesheet"href="css/style.css">
<center>

<div style='padding:10px;'><a href='user_home.jsp' class='linkbtn'>Home</a></div>

<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
	ResultSet rs = con.createStatement().executeQuery("select * from equipment order by eq_id");
	while(rs.next()){
%>
<table width=500 height=300 style='background:linen;'>
<tr>
	<td align='center'>
		<table>
		<tr><td><b>ID:</b></td><td><%=rs.getString(1)%></td>
		<tr><td><b>Name:</b></td><td><%=rs.getString(2)%></td>
		<tr><td><b>Qty:</b></td><td><%=rs.getString(3)%></td>
		<tr><td><b>Company:</b></td><td><%=rs.getString(4)%></td>
		<tr><td><b>Price:</b></td><td><%=rs.getString(5)%></td>
		</table>
	</td>
	<td align='center'>
	<img src='equipments/<%=rs.getString(1)+".jpg"%>' width='100px' height='100px'/>
	</td>
</tr>
</table>
<br>
<%
	}
%>
</center>
