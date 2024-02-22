<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
	String eid = request.getParameter("eid");
	ResultSet rs = con.createStatement().executeQuery("select * from equipment where eq_id="+eid);
	rs.next();
%>
<form method='post' action='http://localhost:8080/gym/updateeq' enctype="multipart/form-data">
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Equipment Details</h3></td>
</tr>
<tr>
	<td><b>Equipment ID:</b></td>
	<td><input type='text' name='eid' value=<%=rs.getString(1)%> readOnly></td>
</tr>
<tr>
	<td><b>Equipment Name:</b></td>
	<td><input type='text' name='ename' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td><b>Quantity:</b></td>
	<td><input type='number' name='qty' max=10 min=1 value=<%=rs.getString(3)%> required></td>
</tr>
<tr>
	<td><b>Company:</b></td>
	<td><input type='text' name='company' value='<%=rs.getString(4)%>' required></td>
</tr>
<tr>
	<td><b>Price:</b></td>
	<td><input type='number' name='price' value=<%=rs.getString(5)%> required></td>
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

