<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String mid = request.getParameter("mid");
	ResultSet rs = con.createStatement().executeQuery("select * from members where m_id="+mid);
	rs.next();
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

	x = document.forms["myForm"]["jdate"];
  	if (!validateDate(x.value)) {
		
    		alert("Invalid join date");
		x.focus();
    		return false;
  	}

	return true;
} 
</script>

<form method='post' action='update_member1.jsp' name='myForm' onsubmit='return validateForm()'>
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Member Details</h3></td>
</tr>
<tr>
	<td><b>Member ID:</b></td>
	<td><input type='text' name='mid' value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td><b>Member Name:</b></td>
	<td><input type='text' name='mname' value='<%=rs.getString(3)%>' required></td>
</tr>
<tr>
	<td><b>Gender:</b></td>
	<td>
	<select name='gender' required>
	<option value=''>Select Gender</option>
	<option value='Male' <% if(rs.getString(4).equals("Male")) out.print(" selected");%>>Male</option>
	<option value='Female' <% if(rs.getString(4).equals("Female")) out.print(" selected");%>>Female</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><input type='text' name='phone' value='<%=rs.getString(5)%>' required></td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><input type='text' name='email' value='<%=rs.getString(6)%>' required></td>
</tr>
<tr>
	<td><b>Birth Date:</b></td>
	<td><input type='text' name='bdate' value='<%=rs.getString(7)%>' required></td>
</tr>
<tr>
	<td><b>Join Date:</b></td>
	<td><input type='text' name='jdate' value='<%=rs.getString(8)%>' required></td>
</tr>
<tr>
	<td><b>Diet Plan:</b></td>
	<td>
	<select name='diet' required>
	<option value=''>Select Diet</option>
<%
	ResultSet rs1 = con.createStatement().executeQuery("select * from diet_plans order by diet_plan_id");
	while(rs1.next()){
%>
	<option value='<%=rs1.getInt(1)%>' <% if(rs.getInt(9)==rs1.getInt(1)) out.print(" selected");%>><%=rs1.getString(2)%></option>
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
	rs1 = con.createStatement().executeQuery("select * from membership_plans order by plan_id");
	while(rs1.next()){
%>
	<option value='<%=rs1.getInt(1)%>' <% if(rs.getInt(10)==rs1.getInt(1)) out.print(" selected");%>><%=rs1.getString(2)%></option>
<%
	}
%>
	</select>
	</td>
</tr>
<tr>
	<td align='center'><input type='submit' value='UPDATE' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</center>
</form>

</center>
