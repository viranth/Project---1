<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int value=Integer.parseInt(request.getParameter("otp"));
session=request.getSession();
int otp=(int)session.getAttribute("otp");
RequestDispatcher dispatcher=null;		
if (value==otp) 
{
	
		request.setAttribute("email", request.getParameter("email"));
		request.setAttribute("status", "success");
	  dispatcher=request.getRequestDispatcher("newPassword.jsp");
	dispatcher.forward(request, response);
	
}
else
{
	request.setAttribute("message","wrong otp");
	
   dispatcher=request.getRequestDispatcher("EnterOtp.jsp");
	dispatcher.forward(request, response);

}

%>