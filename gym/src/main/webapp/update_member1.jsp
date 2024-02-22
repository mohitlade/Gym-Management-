<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	String mid = request.getParameter("mid");
	String mname = request.getParameter("mname");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String bdate = request.getParameter("bdate");
	String jdate = request.getParameter("jdate");
	String diet = request.getParameter("diet");
	String mem = request.getParameter("mem");

	con.createStatement().executeUpdate("update members set m_name='"+mname+"',m_gender='"+gender+"',m_phone='"+phone+"',m_email='"+email+"',m_bdate='"+bdate+"',m_jdate='"+jdate+"',diet_plan_id="+diet+",plan_id="+mem+" where m_id="+mid);

	response.sendRedirect("manage_members.jsp");
%>

