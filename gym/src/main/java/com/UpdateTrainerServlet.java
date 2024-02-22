package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/UpdateTrainerServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UpdateTrainerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	    String appPath = request.getServletContext().getRealPath("/");

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/gym_db","root","");

		String tid = request.getParameter("tid");
		String tname = request.getParameter("tname");
		String gender = request.getParameter("gender");
		String type = request.getParameter("type");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String bdate = request.getParameter("bdate");
		String jdate = request.getParameter("jdate");

	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);

		    if(!fileName.equals(""))
		    {
			java.io.File d = new java.io.File(appPath + "trainers/"+tid+".jpg");
			d.delete();
                    	part.write(appPath + "trainers/"+tid+".jpg");
		    }
	        }

		con.createStatement().executeUpdate("update trainer set t_name='"+tname+"', t_gender='"+gender+"', t_type='"+type+"', t_address='"+addr+"', t_phone='"+phone+"', t_email='"+email+"', t_birthdate='"+bdate+"', t_joindate='"+jdate+"' where t_id="+tid);

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
