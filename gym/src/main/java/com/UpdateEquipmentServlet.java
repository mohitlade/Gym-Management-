package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/UpdateEquipmentServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UpdateEquipmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	    String appPath = request.getServletContext().getRealPath("/");

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

		String eid = request.getParameter("eid");
		String ename = request.getParameter("ename");
		String qty = request.getParameter("qty");
		String company = request.getParameter("company");
		String price = request.getParameter("price");

	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);

		    if(!fileName.equals(""))
		    {
			java.io.File d = new java.io.File(appPath + "equipments/"+eid+".jpg");
			d.delete();
                    	part.write(appPath + "equipments/"+eid+".jpg");
		    }
	        }

		con.createStatement().executeUpdate("update equipment set eq_name='"+ename+"', eq_qty="+qty+", eq_company='"+company+"', eq_price="+price+" where eq_id="+eid);

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
