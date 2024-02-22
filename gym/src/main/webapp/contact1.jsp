<link rel="stylesheet"href="css/style.css">
<body style='height: 100%; background-image: url("images/background.jpg"); background-position: center; background-repeat: no-repeat; background-size: cover;'>
<jsp:include page="header.jsp"/>
<div class='main'>
<center>

<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String pid = request.getParameter("plan");

	con.createStatement().executeUpdate("insert into enquiry(name,phone,email,enq_date,plan_id) values('"+name+"','"+phone+"','"+email+"',current_date,"+pid+")");
%>
<h3>Your enquiry is submitted successfully. Our representative will contact you soon.</h3>
</center>
</div>
<jsp:include page="footer.jsp"/>
</body>
