<%@page import="java.io.IOException"%>
<%@page import="java.util.*" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*"%>
<%@page import="jakarta.servlet.*"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String newPassword = request.getParameter("password");
String confPassword = request.getParameter("confPassword");
RequestDispatcher dispatcher = null;
if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydata", "root","");
		PreparedStatement pst = con.prepareStatement("update login set pass = ? where mail = ? ");
		pst.setString(1, newPassword);
		pst.setString(2, (String) session.getAttribute("email"));

		int rowCount = pst.executeUpdate();
		if (rowCount > 0) {
			request.setAttribute("status", "resetSuccess");
			dispatcher = request.getRequestDispatcher("login.jsp");
		} else {
			request.setAttribute("status", "resetFailed");
			dispatcher = request.getRequestDispatcher("login.jsp");
		}
		dispatcher.forward(request, response);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>