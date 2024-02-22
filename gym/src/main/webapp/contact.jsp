<link rel="stylesheet"href="css/style.css">
<body style='height: 100%; background-image: url("images/background.jpg"); background-position: center; background-repeat: no-repeat; background-size: cover;'>
<jsp:include page="header.jsp"/>

<script>
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

	return true;
} 
</script>

<div class='main'>
<center>
<form action="contact1.jsp"method="post" name='myForm' onsubmit='return validateForm()'>
<table width="40%" height="40%" class='logtab'>
<tr>
	<td colspan=2 align='center'><b>CONTACT</b></td>
</tr>
<tr>
	<td><b>Name:</b></td>
	<td><input type="text" name="name" class='txt' required></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><input type="text" name="phone" class='txt' required></td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><input type="text" name="email" class='txt' required></td>
</tr>
<tr>
	<td><b>Plan Interested:</b></td>
	<td>
	<select name="plan" class='txt' required>
	<option value=''>Select Plan</option>

<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	ResultSet rs = con.createStatement().executeQuery("select * from membership_plans order by plan_id");
	while(rs.next()){
%>
        <option value='<%=rs.getString(1)%>'><%=rs.getString(2)%></option>
<%
	}
%>
        </select>
	</td>
</tr>
<tr>
	<td align='center'><input type="submit" value="OK" class="btn"></td>
	<td align='center'><input type="reset" value="CLEAR" class="btn"></td>
</tr>
</table>
</form>
</center>
</div>
<jsp:include page="footer.jsp"/>
</body>
