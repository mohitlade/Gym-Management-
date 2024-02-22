<link rel="stylesheet"href="css/style.css">
<div class='main'>
<center>
<img src="images/logo.jpg" width='40%' height='20%'><br>
<table width="100%" height="40%">
<tr>
	<td align="center" colspan=3><h1>WELCOME ADMIN - <%=session.getAttribute("aname")%></h1></td>
</tr>
<tr>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="manage_equipments.jsp";'>EQUIPMENTS</button></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="manage_trainers.jsp";'>TRAINERS</a></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="manage_members.jsp";'>MEMBERS</a></td>
</tr>
<tr>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="view_enquiry.jsp";'>VIEW ENQUIRY</button></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="manage_membership_plans.jsp";'>MEMBERSHIP PLANS</a></td>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="manage_diet_plans.jsp";'>DIET PLANS</a></td>
</tr>
<tr>
      	<td align="center"><button class='linkbtn' onclick='window.location.href="logout.jsp";'>LOGOUT</a></td>
</tr>
</table>
</center>
</div>
