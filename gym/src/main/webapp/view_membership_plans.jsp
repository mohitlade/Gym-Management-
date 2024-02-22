<link rel="stylesheet"href="css/style.css">
<script>
function show(s)
{
	x = new XMLHttpRequest()
	x.open("GET","get_membership_plans.jsp?s="+s)
	x.send()
	x.onreadystatechange = function()
	{
		if(x.readyState==4 && x.status==200)
		{
			document.getElementById('result').innerHTML=
				x.responseText
		}
	}
}
</script>

<center>
<div style='padding:10px;'><a href='user_home.jsp' class='linkbtn'>Home</a></div>
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	ResultSet rs = con.createStatement().executeQuery("select distinct plan_type from membership_plans order by plan_type");
%>
<select id='pid' required class='txt'>
<option value=''>Select Your Plan Type</option>
<%
	while(rs.next()){
%>
<option value='<%=rs.getString(1)%>'><%=rs.getString(1)%></option>
<%
	}
%>
<input type='button' value='Show' class='btn' onclick='show(pid.value)'><br>
<div id='result' class='scroll'></div>
</center>
