<%@ page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydata","root","");
String email=request.getParameter("uname");
String password=request.getParameter("upass");
if(email.equals("Admin") && password.equals("123456")){
    String a = "Admin";
    String b = "Admin";
    String c = "Admin@nec.edu.in";
    Connection con = null;
    PreparedStatement stmt = conn.prepareStatement("insert into session(name,regno,mail) values(?,?,?)");
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.executeUpdate();
        session.setAttribute("user",b);
    response.sendRedirect("index.jsp");

}else{
	try
	{
	   
	    PreparedStatement ps = conn.prepareStatement("select * from login where mail=? and pass=?");
	    ps.setString(1,email);
	    ps.setString(2,password);
	    ResultSet rs=ps.executeQuery();
	    if(rs.next())
	    {
	        String e=rs.getString("mail");
	        String p=rs.getString("pass");
	        if(e.equals(email) && p.equals(password))
	        {
	        	String a = rs.getString("name");
	            String b = rs.getString("regNo");
	            String c = rs.getString("mail");
	            Connection con = null;
	            PreparedStatement stmt = conn.prepareStatement("insert into session(name,regno,mail) values(?,?,?)");
	                stmt.setString(1,a);
	                stmt.setString(2,b);
	                stmt.setString(3,c);
	                stmt.executeUpdate(); 
	                session.setAttribute("user",b);
	        	response.sendRedirect("index.jsp");
	        }
	    }
	    else
	    {
	         session.setAttribute("status","failed"); 
	    	response.sendRedirect("login.jsp");
	    }
	}
	catch(Exception e)
	{
	    out.println(e);
	}

}

%>