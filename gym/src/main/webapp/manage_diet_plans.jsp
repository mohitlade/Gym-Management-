<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
%>
<form method='post' action='AddPlanServlet' enctype="multipart/form-data">
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Diet Plan Details</h3></td>
</tr>
<tr>
	<td><b>Plan Name:</b></td>
	<td><input type='text' name='pname' required></td>
</tr>
<tr>
	<td><b>Image File:</b></td>
	<td><input type="file" name="pimg" id="fileToUpload"></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='ADD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</center>
</form>
<br>
<%
	ResultSet rs = con.createStatement().executeQuery("select * from diet_plans order by diet_plan_id");
	while(rs.next()){
%>
<center>
<table style='background:linen;width:80%;height:80%;'>
<tr>
	<td align='center'>
		<table>
		<tr><td><b>ID:</b></td><td><%=rs.getString(1)%></td>
		<tr><td><b>Name:</b></td><td><%=rs.getString(2)%></td>
		</table>
	</td>
	<td align='center'>
	<img src='diet_plans/<%=rs.getString(1)+".jpg"%>' width='500px' height='500px'/>
	</td>
</tr>
<tr>
	<td align='center' style='padding:10px;'><a href='delete_diet_plan.jsp?pid=<%=rs.getString(1)%>' class='linkbtn'>Delete</a></td>
</tr>
</table>
</center><br>
<%
	}
%>

