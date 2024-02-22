<link rel="stylesheet"href="css/style.css">
<div class='main'>
<center>
<img src="images/logo.jpg" width='40%' height='20%'><br>
<table width="100%" height="40%">
<tr>
	<td align="center" colspan=3><h1>WELCOME MEMBER - <%=session.getAttribute("uname")%></h1></td>
</tr>
<tr>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="view_profile.jsp";'>VIEW PROFILE</button></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="view_trainers.jsp";'>VIEW TRAINERS</a></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="view_equipments.jsp";'>VIEW EQUIPMENTS</a></td>
</tr>
<tr>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="view_diet_plan.jsp";'>VIEW DIET PLAN</button></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="view_membership_plans.jsp";'>VIEW MEMBERSHIP PLANS</a></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="logout.jsp";'>LOGOUT</a></td>
</tr>
</table>
</center>
</div>
