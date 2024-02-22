<%
	session.removeAttribute("aid");
	session.removeAttribute("aname");
	
	session.invalidate();

	response.sendRedirect("index.jsp");
%>
