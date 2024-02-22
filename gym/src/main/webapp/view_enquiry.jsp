<link rel="stylesheet"href="css/style.css">
<div class='main'>
<center>
<div style='padding:10px;'><a href='admin_home.jsp' class='linkbtn'>Home</a></div>
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	ResultSet rs = con.createStatement().executeQuery("select enq_id,name,phone,email,enq_date,plan_name from enquiry,membership_plans where enquiry.plan_id = membership_plans.plan_id order by enq_id");
	
	if(rs.next()){
%>
<table width='100%'>
<tr style='background:black;color:white;'>
	<td>ID</td>
	<td>Name</td>
	<td>Phone</th>
	<th>Email</th>
	<th>Date</th>
	<th>Plan</th>
</tr>
<%
		do{
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
</tr>
<%
		}while(rs.next());
%>
</table>
<%
	}
	else{
%>
<h3>No data found.</h3>
<%
	}
%>
</center>
</div>
