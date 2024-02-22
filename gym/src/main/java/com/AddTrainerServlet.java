package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddTrainerServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddTrainerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	    String appPath = request.getServletContext().getRealPath("/");

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

		String tname = request.getParameter("tname");
		String gender = request.getParameter("gender");
		String type = request.getParameter("type");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String bdate = request.getParameter("bdate");
		String jdate = request.getParameter("jdate");

		con.createStatement().executeUpdate("insert into trainer(t_name, t_gender, t_type, t_address, t_phone, t_email, t_birthdate, t_joindate) values('"+tname+"','"+gender+"','"+type+"','"+addr+"','"+phone+"','"+email+"','"+bdate+"','"+jdate+"')");

		ResultSet rs = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'gym_db' AND TABLE_NAME = 'trainer';");
		rs.next();
		int tid = rs.getInt(1);

	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);

		    if(!fileName.equals(""))
		    {
                    	part.write(appPath + "trainers/"+tid+".jpg");
		    }
	        }

		response.sendRedirect("manage_trainers.jsp");
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
