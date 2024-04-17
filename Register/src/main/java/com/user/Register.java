package com.user;
import jakarta.servlet.ServletContext;

import java.sql.*;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import jakarta.servlet.annotation.MultipartConfig;
@MultipartConfig
/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
response.setContentType("text/html;charset=UTF-8");
		
		
		String name=request.getParameter("user_name");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		
		Part part=request.getPart("image");
		String filename=part.getSubmittedFileName();
		
		PrintWriter out=response.getWriter();
		//out.println(filename);
		//connection....
		try {
			// Old class name (deprecated)
			// Class.forName("com.mysql.jdbc.Driver");

			Thread.sleep(3000);
			// New class name
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/youtube?useSSL=false&serverTimezone=UTC";


			
			Connection con=DriverManager.getConnection(url,"root","root123");
			
			//query
			
			
		
	     String q="insert into user(name,password,email,imageName) values(?,?,?,?)";
		
	     PreparedStatement pstmt=con.prepareStatement(q);
	     pstmt.setString(1,name);
	     pstmt.setString(2,password);
	     pstmt.setString(3,email);
	     pstmt.setString(4,filename);
	     
	     pstmt.executeUpdate();
	     
	     //upload
	     
	     InputStream is=part.getInputStream();
	     byte []data=new byte[is.available()];
	     
	     is.read(data); 
	     ServletContext servletContext = request.getServletContext();
	     String path=servletContext.getRealPath("/")+"img"+File.separator+filename;
	     
	     
	    //out.println(path);
	     FileOutputStream fos=new FileOutputStream(path);
	     
	     fos.write(data);
	     fos.close();
	     
			out.println("done");
		}
		catch(Exception e) {
			e.printStackTrace();
			out.println("error....");
		}
		
		
		
		//query.....
		
		
	
		
	}
	

}
