<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
%>
<form method='post' action='AddEquipmentServlet' enctype="multipart/form-data">
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Equipment Details</h3></td>
</tr>
<tr>
	<td><b>Equipment Name:</b></td>
	<td><input type='text' name='ename' required></td>
</tr>
<tr>
	<td><b>Quantity:</b></td>
	<td><input type='number' name='qty' max=10 min=1 required></td>
</tr>
<tr>
	<td><b>Company:</b></td>
	<td><input type='text' name='company' required></td>
</tr>
<tr>
	<td><b>Price:</b></td>
	<td><input type='number' name='price' required></td>
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
	ResultSet rs = con.createStatement().executeQuery("select * from equipment order by eq_id");
	while(rs.next()){
%>
<center>
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
<tr>
	<td align='center'><a href='delete_eq.jsp?eid=<%=rs.getString(1)%>' class='linkbtn'>Delete</a></td>
	<td align='center'><a href='update_eq.jsp?eid=<%=rs.getString(1)%>' class='linkbtn'>Update</a></td>
</tr>
</table>
</center><br>
<%
	}
%>

