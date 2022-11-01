<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<style>
.container{
	width:900px;
	padding : 30px 30px;
}
</style>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <p><br/></p>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>User Details</h3>
            </div>
            <div class="col-md-4">
                <a href="index.jsp" class="btn btn-primary">Back</a>
            </div>
        </div>
        <hr>
        <table class = "table table-bordered table-striped table-hover">
            <thead>
                 <tr>
                     <th>ID</th>
                     <th>Name</th>
                     <th>Email</th>
                     <th>Phone</th>
                     <th>Register No</th>
                     <th>Department</th>
                     <th>Year</th>
                     <th>Date</th>
                 </tr>
            </thead>
            <tbody>
                <%
                     String host= "jdbc:mysql://localhost:3306/mydata";
                     Connection con = null;
                     Statement stmt = null;
                     ResultSet rs = null;
                     Class.forName("com.mysql.jdbc.Driver");
                     con = DriverManager.getConnection(host,"root","");
                     stmt = con.createStatement(); 
                     String query = request.getParameter("q");
                     String data =  "select *from login order by id desc";
                     rs = stmt.executeQuery(data);
                     while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt("id")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("mail")%></td>
                    <td><%=rs.getString("phone")%></td>
                    <td><%=rs.getString("regNo")%></td>
					<td><%=rs.getString("dept")%></td>
			        <td><%=rs.getString("year")%></td>
			        <td><%=rs.getString("date")%></td>
                  </tr>
                  <%} %>
            </tbody>
         </table>
    </div>
</html>
