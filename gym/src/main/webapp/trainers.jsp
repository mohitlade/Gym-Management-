<link rel="stylesheet"href="css/style.css">
<body style='height: 100%; background-image: url("images/background.jpg"); background-position: center; background-repeat: no-repeat; background-size: cover;'>
<jsp:include page="header.jsp"/>
<div class='main' style='overflow:auto;height:500px;'>
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from trainer order by t_id");
	while(rs.next()){
%>
<center>
<table width=600 height=400 style='background:linen;'>
<tr>
	<td align='center'>
		<table>
		<tr><td><b>ID:</b></td><td><%=rs.getString(1)%></td>
		<tr><td><b>Name:</b></td><td><%=rs.getString(2)%></td>
		<tr><td><b>Gender:</b></td><td><%=rs.getString(3)%></td>
		<tr><td><b>Type:</b></td><td><%=rs.getString(4)%></td>
		<tr><td><b>Join Date:</b></td><td><%=rs.getString(9)%></td>
		</table>
	</td>
	<td align='center'>
	<img src='trainers/<%=rs.getString(1)+".jpg"%>' width='200px' height='200px'/>
	</td>
</tr>
</table>
</center><br>
<%
	}
%>

</div>
<jsp:include page="footer.jsp"/>
</body>
