<link rel="stylesheet"href="css/style.css">
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");
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
		
    		alert("Invalid joining date");
		x.focus();
    		return false;
  	}

	return true;
} 
</script>

<form method='post' action='AddTrainerServlet' enctype="multipart/form-data" name='myForm' onsubmit='return validateForm()'>
<center>
<table class='eqtab'>
<tr>
	<td colspan=2 align='center'><a href='admin_home.jsp' class='linkbtn'>Home</a></td>
</tr>
<tr>
	<td colspan=2 align='center'><h3>Trainer Details</h3></td>
</tr>
<tr>
	<td><b>Trainer Name:</b></td>
	<td><input type='text' name='tname' required></td>
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
	<td><b>Type:</b></td>
	<td>
	<select name='type' required>
	<option value=''>Select Type</option>
	<option value='Bronze'>Bronze</option>
	<option value='Silver'>Silver</option>
	<option value='Gold'>Gold</option>
	<option value='Platinuim'>Platinuim</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td>
	<textarea rows=5 cols=40 name='addr' required></textarea>
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
	<td><b>Joining Date:</b></td>
	<td><input type='text' name='jdate' required></td>
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
	ResultSet rs = con.createStatement().executeQuery("select * from trainer order by t_id");
	while(rs.next()){
%>
<center>
<table width=600 height=400 style='background:linen;'>
<tr>
	<td align='center'>
		<table>
		<tr><td><b>ID:</b></td><td><%=rs.getString(1)%></td>
		<tr><td><b>Name:</b></td><td><%=rs.getString(2)%></td>
		<tr><td><b>Gender:</b></td><td><%=rs.getString(3)%></td>
		<tr><td><b>Type:</b></td><td><%=rs.getString(4)%></td>
		<tr><td><b>Address:</b></td><td><%=rs.getString(5)%></td>
		<tr><td><b>Phone:</b></td><td><%=rs.getString(6)%></td>
		<tr><td><b>Email:</b></td><td><%=rs.getString(7)%></td>
		<tr><td><b>Birth Date:</b></td><td><%=rs.getString(8)%></td>
		<tr><td><b>Join Date:</b></td><td><%=rs.getString(9)%></td>
		</table>
	</td>
	<td align='center'>
	<img src='trainers/<%=rs.getString(1)+".jpg"%>' width='200px' height='200px'/>
	</td>
</tr>
<tr>
	<td align='center'><a href='delete_trainer.jsp?tid=<%=rs.getString(1)%>' class='linkbtn'>Delete</a></td>
	<td align='center'><a href='update_trainer.jsp?tid=<%=rs.getString(1)%>' class='linkbtn'>Update</a></td>
</tr>
</table>
</center><br>
<%
	}
%>

