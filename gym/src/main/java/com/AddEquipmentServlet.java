package com;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddEquipmentServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddEquipmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	    String appPath = request.getServletContext().getRealPath("/");

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

		String ename = request.getParameter("ename");
		String qty = request.getParameter("qty");
		String company = request.getParameter("company");
		String price = request.getParameter("price");

		con.createStatement().executeUpdate("insert into equipment(eq_name, eq_qty, eq_company, eq_price) values('"+ename+"', "+qty+", '"+company+"', "+price+")");

		ResultSet rs = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'gym_db' AND TABLE_NAME = 'equipment';");
		rs.next();
		int eid = rs.getInt(1);

	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);

		    if(!fileName.equals(""))
		    {
                    	part.write(appPath + "equipments/"+eid+".jpg");
		    }
	        }

		response.sendRedirect("manage_equipments.jsp");
	}
	catch(Exception e){
		out.println("<h4>"+e+"</h4>");
	}	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
