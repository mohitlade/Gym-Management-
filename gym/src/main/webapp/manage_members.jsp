<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

    int pwd = (int)(Math.random()*9000)+1000;
	String mname = request.getParameter("mname");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String bdate = request.getParameter("bdate");
	String diet = request.getParameter("diet");
	String mem = request.getParameter("mem");

	if(mname!=null && gender!=null && phone!=null && email!=null && bdate!=null && diet!=null && mem!=null){
		con.createStatement().executeUpdate("insert into members(m_pwd,	m_name,	m_gender, m_phone, m_email, m_bdate, m_jdate, diet_plan_id, plan_id) values('"+pwd+"','"+mname+"','"+gender+"','"+phone+"','"+email+"','"+bdate+"',current_date,"+diet+","+mem+")");
	}
%>
<script>
function validateDate(inputText)
{
	dateformat = /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/;
  
	if(inputText.match(dateformat))
  	{
		pdate = inputText.split('-');
		yy = parseInt(pdate[0]);
  		mm  = parseInt(pdate[1]);
  		dd = parseInt(pdate[2]);
		
		ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];
  		if (mm==1 || mm>2)
  		{
  			if(dd>ListofDays[mm-1])
  			{
				return false;
  			}
  		}
  		if (mm==2)
  		{
  			lyear = false;
  			if((yy % 4 == 0 && yy % 100 != 0) || (yy % 400!=0)) 
  			{
  				lyear = true;
  			}
  			if((lyear==false) && (dd>=29))
  			{
				return false;
 			}
  			if((lyear==true) && (dd>29))
  			{
				return false;
  			}
  		}
		return true;
  	}
  	else
  	{
		return false;
  	}
}

function validateForm() {
	x = document.forms["myForm"]["phone"];
  	if (!x.value.match(/^\d{10}$/)) {
    		alert("Invalid phone");
		x.focus();
    		return false;
  	}

	x = document.forms["myForm"]["email"];
  	if (!x.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
    		alert("Invalid email");
		x.focus();
    		return false;
  	}

	x = document.forms["myForm"]["bdate"];
  	if (!validateDate(x.value)) {
		
    		alert("Invalid birth date");
		x.focus();
    		return false;
  	}

	return true;
} 
</script>

<form method='post' action='manage_members.jsp' name='myForm' onsubmit='return validateForm()'>
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Member Details</h3></td>
</tr>
<tr>
	<td><b>Member Name:</b></td>
	<td><input type='text' name='mname' required></td>
</tr>
<tr>
	<td><b>Gender:</b></td>
	<td>
	<select name='gender' required>
	<option value=''>Select Gender</option>
	<option value='Male'>Male</option>
	<option value='Female'>Female</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><input type='text' name='phone' required></td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><input type='text' name='email' required></td>
</tr>
<tr>
	<td><b>Birth Date:</b></td>
	<td><input type='text' name='bdate' required></td>
</tr>
<tr>
	<td><b>Diet Plan:</b></td>
	<td>
	<select name='diet' required>
	<option value=''>Select Diet</option>
<%
	ResultSet rs = con.createStatement().executeQuery("select * from diet_plans order by diet_plan_id");
	while(rs.next()){
%>
	<option value='<%=rs.getInt(1)%>'><%=rs.getString(2)%></option>
<%
	}
%>
	</select>
	</td>
</tr>
<tr>
	<td><b>Membership Plan:</b></td>
	<td>
	<select name='mem' required>
	<option value=''>Select Membership</option>
<%
	rs = con.createStatement().executeQuery("select * from membership_plans order by plan_id");
	while(rs.next()){
%>
	<option value='<%=rs.getInt(1)%>'><%=rs.getString(2)%></option>
<%
	}
%>
	</select>
	</td>
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
	rs = con.createStatement().executeQuery("select m_id,m_name,m_gender,m_phone,m_email,m_bdate,m_jdate,diet_plan_name,plan_name from members,membership_plans,diet_plans where members.plan_id = membership_plans.plan_id and members.diet_plan_id=diet_plans.diet_plan_id order by m_id");
%>
<center>
<table style='background:linen;width:100%;'>
<tr style='background:black;color:white;'>
	<td>ID</td>
	<td>Name</td>
	<td>Gender</td>
	<td>Phone</td>
	<td>Email</td>
	<td>DOB</td>
	<td>Join Date</td>
	<td>Diet Plan</td>
	<td>Membership</td>
	<td></td>
	<td></td>
</tr>
<%
	while(rs.next()){
%>
	<tr>
		<td style='padding:10px;'><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(8)%></td>
		<td><%=rs.getString(9)%></td>
		<td align='center'><a href='delete_member.jsp?mid=<%=rs.getString(1)%>' class='linkbtn'>Delete</a></td>
		<td align='center'><a href='update_member.jsp?mid=<%=rs.getString(1)%>' class='linkbtn'>Update</a></td>
	</tr>
<%
	}
%>
</table>
</center>
