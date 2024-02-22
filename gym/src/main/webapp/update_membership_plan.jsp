<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
	String pid = request.getParameter("pid");
	ResultSet rs = con.createStatement().executeQuery("select * from membership_plans where plan_id="+pid);
	rs.next();
%>
<form method='post' action='update_membership_plan1.jsp'>
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td><b>Plan ID:</b></td>
	<td><input type='text' name='pid' value=<%=rs.getString(1)%> readOnly></td>
</tr>
<tr>
	<td><b>Plan Name:</b></td>
	<td><input type='text' name='pname' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td><b>Type:</b></td>
	<td>
	<select name='ptype' required>
	<option value=''>Select Plan Type</option>
	<option value='1 Day' <% if(rs.getString(3).equals("1 Day")) out.print(" selected");%>>1 Day</option>
	<option value='7 Days' <% if(rs.getString(3).equals("7 Days")) out.print(" selected");%>>7 Days</option>
	<option value='Monthly' <% if(rs.getString(3).equals("Monthly")) out.print(" selected");%>>Monthly</option>
	<option value='Half Yearly' <% if(rs.getString(3).equals("Half Yearly")) out.print(" selected");%>>Half Yearly</option>
	<option value='Annually' <% if(rs.getString(3).equals("Annually")) out.print(" selected");%>>Annually</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Price:</b></td>
	<td><input type='text' name='pprice' value=<%=rs.getString(4)%> required></td>
</tr>
<tr>
	<td><b>Discount:</b></td>
	<td><input type='text' name='pdisc' value=<%=rs.getString(5)%> required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='UPDATE' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</center>
</form>
