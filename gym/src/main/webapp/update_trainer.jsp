<link rel="stylesheet"href="css/style.css">
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
		
    		alert("Invalid joining date");
		x.focus();
    		return false;
  	}

	return true;
} 
</script>

<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
	String tid = request.getParameter("tid");
	ResultSet rs = con.createStatement().executeQuery("select * from trainer where t_id="+tid);
	rs.next();
%>

<form method='post' action='UupdateTrainerServlet' enctype="multipart/form-data" name='myForm' onsubmit='return validateForm()'>
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Trainer Details</h3></td>
</tr>
<tr>
	<td><b>Trainer ID:</b></td>
	<td><input type='text' name='tid' value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td><b>Trainer Name:</b></td>
	<td><input type='text' name='tname' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td><b>Gender:</b></td>
	<td>
	<select name='gender' required>
	<option value=''>Select Gender</option>
	<option value='Male' <% if(rs.getString(3).equals("Male")) out.print(" selected");%>>Male</option>
	<option value='Female' <% if(rs.getString(3).equals("Female")) out.print(" selected");%>>Female</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Type:</b></td>
	<td>
	<select name='type' required>
	<option value=''>Select Type</option>
	<option value='Bronze' <% if(rs.getString(4).equals("Bronze")) out.print(" selected");%>>Bronze</option>
	<option value='Silver' <% if(rs.getString(4).equals("Silver")) out.print(" selected");%>>Silver</option>
	<option value='Gold' <% if(rs.getString(4).equals("Gold")) out.print(" selected");%>>Gold</option>
	<option value='Platinuim' <% if(rs.getString(4).equals("Platinuim")) out.print(" selected");%>>Platinuim</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td>
	<textarea rows=5 cols=40 name='addr' required><%=rs.getString(5)%></textarea>
	</td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><input type='text' name='phone' value='<%=rs.getString(6)%>' required></td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><input type='text' name='email' value='<%=rs.getString(7)%>' required></td>
</tr>
<tr>
	<td><b>Birth Date:</b></td>
	<td><input type='text' name='bdate' value='<%=rs.getString(8)%>' required></td>
</tr>
<tr>
	<td><b>Joining Date:</b></td>
	<td><input type='text' name='jdate' value='<%=rs.getString(9)%>' required></td>
</tr>
<tr>
	<td><b>Image File:</b></td>
	<td><input type="file" name="pimg" id="fileToUpload"></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='UPDATE' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</center>
</form>

