<%@page import="java.sql.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	int eid = Integer.parseInt(request.getParameter("eid"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String comments = request.getParameter("comments");
	int pid = Integer.parseInt(request.getParameter("loc"));

	PreparedStatement ps = con.prepareStatement("insert into enquiry values(?,?,?,?,?,?,?)");
	ps.setInt(1,eid);
	ps.setString(2,name);
	ps.setString(3,addr);
	ps.setString(4,phone);
	ps.setString(5,email);
	ps.setString(6,comments);
	ps.setInt(7,pid);

	ps.executeUpdate(); 
%>

<link rel='stylesheet' type='text/css' href='style.css'>
<div class="fullscreen-bg">
<video autoplay loop preload=metadata width='100%' height='100%' class="fullscreen-bg__video">
    <source src='videos/video.webm' type='video/webm'>
</video>
</div>

<header>
<div style='text-align:center;'>
	<img src='images/logo1.jpg' width=100 height=100/>
</div>
<div>
<a href='index.jsp' class='op'>HOME</a>
<a href='admin_login.jsp' class='op'>ADMIN LOGIN</a>
<a href='customer_login.jsp' class='op'>CUSTOMER LOGIN</a>
<a href='view_all_projects.jsp' class='op'>VIEW ALL PROJECTS</a>
<a href='about_us.jsp' class='op'>ABOUT US</a>
<a href='contact_us.jsp' class='op'>CONTACT US</a>
<a href='enquire.jsp' class='op'>ENQUIRE NOW</a>
</div>
</header>

<article style='padding:30px;'>
<h1>Your enquiry is received by us.</h1>
<h3>Soon our representative will contact you.</h3>
</article>

<footer>
<div>
<p>Copyright &copy; 2017 AISHWARYA. All Rights Reserved.</p>
<p>Made by Aishwarya Technologies.</p>
</div>
</footer>
