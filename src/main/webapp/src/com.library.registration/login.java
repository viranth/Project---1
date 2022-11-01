package com.library.registration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RequestDispatcher dipatcher;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String uname = request.getParameter("username");
			String upass = request.getParameter("password"); 
			HttpSession session = request.getSession();
		    dipatcher = null;
		try {
				String host= "jdbc:mysql://localhost:3306/mydata";
			    Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection(host,"root","");
                String data = "select * from login where mail=? and pass=?;";
			    PreparedStatement stmt = con.prepareStatement(data);
			    stmt.setString(1,uname);
			    stmt.setString(2,upass);
			    ResultSet rs = stmt.executeQuery();
			    if(rs.next()) {
//					session.setAttribute("name",rs.getString(uname));
					dipatcher = request.getRequestDispatcher("index.jsp");
			    }else{
					dipatcher = request.getRequestDispatcher("signup.jsp");
			    }
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
