<link rel="stylesheet"href="css/style.css">
<body style='height: 100%; background-image: url("images/background.jpg"); background-position: center; background-repeat: no-repeat; background-size: cover;'>
<jsp:include page="header.jsp"/>
<div class='main'>
<center>
<form action="login.jsp"method="post">
<img src="images/logo.jpg" width='30%' height='20%'>
<table width="30%" height="40%" class='logtab'>
<tr>
	<td colspan=2 align='center'><b>LOGIN</b></td>
</tr>
<tr>
	<td><b>Login ID:</b></td>
	<td><input type="text" name="uname" class='txt' required></td>
</tr>
<tr>
	<td><b>Password:</b></td>
	<td><input type="password" name="pass" class='txt' required></td>
</tr>
<tr>
	<td><b>User Type:</b></td>
	<td>
	<select name="utype" class='txt' required>
	<option value=''>Select User Type</option>
        <option value='admin'>ADMIN</option>
        <option value='customer'>CUSTOMER</option>
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
