<%@page import="java.sql.*" %>
<%
	String ptype=request.getParameter("s");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

	ResultSet rs = con.createStatement().executeQuery("select plan_name, plan_price, plan_disc from membership_plans where plan_type='"+ptype+"'");

	while(rs.next()){
%>
<b><%=rs.getString(1)%></b><br>
<b>Price:</b> Rs.<%=rs.getString(2)%>/-<br>
<b>Discount:</b> <%=rs.getString(3)%>%<br><br>
<%
	}
%>


