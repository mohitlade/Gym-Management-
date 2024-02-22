<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String pname = request.getParameter("pname");
	String ptype = request.getParameter("ptype");
	String pprice = request.getParameter("pprice");
	String pdisc = request.getParameter("pdisc");

	if(pname!=null && ptype!=null && pprice!=null && pdisc!=null){
		PreparedStatement ps = con.prepareStatement("insert into membership_plans(plan_name,plan_type,plan_price,plan_disc) values(?,?,?,?)");
		ps.setString(1,pname);
		ps.setString(2,ptype);
		ps.setFloat(3,Float.parseFloat(pprice));
		ps.setInt(4,Integer.parseInt(pdisc));
		ps.executeUpdate();
	}
%>
<form method='post' action='manage_membership_plans.jsp'>
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Membership Plan Details</h3></td>
</tr>
<tr>
	<td><b>Plan Name:</b></td>
	<td><input type='text' name='pname' required></td>
</tr>
<tr>
	<td><b>Type:</b></td>
	<td>
	<select name='ptype' required>
	<option value=''>Select Plan Type</option>
	<option value='1 Day'>1 Day</option>
	<option value='7 Days'>7 Days</option>
	<option value='Monthly'>Monthly</option>
	<option value='Half Yearly'>Half Yearly</option>
	<option value='Annually'>Annually</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Price:</b></td>
	<td><input type='text' name='pprice' required></td>
</tr>
<tr>
	<td><b>Discount:</b></td>
	<td><input type='text' name='pdisc' required></td>
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
	ResultSet rs = con.createStatement().executeQuery("select * from membership_plans");
	if(rs.next()){
%>
<center>
<table width=900 height=300 style='background:linen;'>
<tr>
	<td style='padding:20px;'><b>ID</b></td>
	<td><b>Name</b></td>
	<td><b>Type</b></td>
	<td><b>Price</b></td>
	<td><b>Discount</b></td>
	<td></td>
	<td></td>
</tr>
<%
		do{
%>
<tr>
	<td style='padding:20px;'><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td align='center'><a href='delete_membership_plan.jsp?pid=<%=rs.getString(1)%>' class='linkbtn'>Delete</a></td>
	<td align='center'><a href='update_membership_plan.jsp?pid=<%=rs.getString(1)%>' class='linkbtn'>Update</a></td>
</tr></tr>
<%
		}while(rs.next());
	}
%>
</center>


