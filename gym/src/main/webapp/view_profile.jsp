<link rel="stylesheet"href="css/style.css">
<center>
<div style='padding:10px;'><a href='user_home.jsp' class='linkbtn'>Home</a></div>
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String uid = session.getAttribute("uid").toString();
	ResultSet rs = con.createStatement().executeQuery("select m_id,m_pwd,m_name,m_gender,m_phone,m_email,m_bdate,m_jdate,diet_plan_name,plan_name from members,membership_plans,diet_plans where members.plan_id = membership_plans.plan_id and members.diet_plan_id=diet_plans.diet_plan_id and m_id="+uid);
	rs.next();
%>

<form method='post' action='edit_profile.jsp'>
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><h3>Member Details</h3></td>
</tr>
<tr>
	<td><b>Member ID:</b></td>
	<td><input type='text' name='mid' value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td><b>Password:</b></td>
	<td><input type='text' name='pwd' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td><b>Member Name:</b></td>
	<td><input type='text' name='mname' value='<%=rs.getString(3)%>' readOnly></td>
</tr>
<tr>
	<td><b>Gender:</b></td>
	<td><input type='text' name='mname' value='<%=rs.getString(4)%>' readOnly></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><input type='text' name='phone' value='<%=rs.getString(5)%>' readOnly></td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><input type='text' name='email' value='<%=rs.getString(6)%>' readOnly></td>
</tr>
<tr>
	<td><b>Birth Date:</b></td>
	<td><input type='text' name='bdate' value='<%=rs.getString(7)%>' readOnly></td>
</tr>
<tr>
	<td><b>Join Date:</b></td>
	<td><input type='text' name='jdate' value='<%=rs.getString(8)%>' readOnly></td>
</tr>
<tr>
	<td><b>Diet Plan:</b></td>
	<td><input type='text' name='diet' value='<%=rs.getString(9)%>' readOnly></td>
</tr>
<tr>
	<td><b>Membership Plan:</b></td>
	<td><input type='text' name='mem' value='<%=rs.getString(10)%>' readOnly></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='CHANGE PASSWORD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>
</center>

