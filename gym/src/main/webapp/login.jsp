<%@page import="java.sql.*" errorPage="err.jsp"%>
<%
	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass");
	String utype=request.getParameter("utype");
 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	if(utype.equals("admin")){
		PreparedStatement ps = con.prepareStatement(
				"select * from admin where admin_id=? and admin_pwd=?");
		ps.setString(1,uname);
		ps.setString(2,pass);

		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			session.setAttribute("aid",uname);
			session.setAttribute("aname",rs.getString(3));
			response.sendRedirect("admin_home.jsp");
		}
		else{
			response.sendRedirect("err.jsp");		
		}
	}
	if(utype.equals("customer")){
		PreparedStatement ps = con.prepareStatement(
				"select * from members where m_id=? and m_pwd=?");
		ps.setInt(1,Integer.parseInt(uname));
		ps.setString(2,pass);

		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			session.setAttribute("uid",uname);
			session.setAttribute("uname",rs.getString(3));
			response.sendRedirect("user_home.jsp");
		}
		else{
			response.sendRedirect("err.jsp");
		}
	}

%>
