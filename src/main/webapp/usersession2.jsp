<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
   <style>
        body{
        	background-color : #377D71;
        }
            .container{
                width: 1500px;
        		background-color: #faf8f0;
        		padding: 20px 20px 20px 20px;
        		border-radius: 20px;
        }
        .con{
            width: 800px;
            margin-left: 50vh;
            background-color: #faf8f0;
            border-radius: 20px;
            padding: 10px 10px 10px 10px;
        }
        hr{
            border: #000000 1px solid;
        }
        .form-group{
        	padding : 5px 20px 5px 20px;
        }
        p{
        	font-weight : bold;
        	font-color : #000;
        	font-size : 20px;
        }
        .num{
        background-color : #000;
        }
        </style>
</style>    
<p><br/></p>
    <body>
        <%
            String host= "jdbc:mysql://localhost:3306/mydata";
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(host,"root","");
            stmt = con.createStatement(); 
        %>
        <div class="container">
        <div>
            <div class="row">
                <div class="col-md-3">
                    <marquee behavior="" direction="">
                        <h3>Session List</h3>
                    </marquee>
                </div>
                <div class="col-md-3">
                    <form action="" method="get">
                        <input type="text" name="q" id="q" class="form-control" placeholder="Search Here..." >
                    </form>
                </div>
                
                 <div class="col-md-3">
                   <a href="index.jsp" class="btn btn-warning">back</a>
                </div>
            </div>
            <hr>
            <table class = "table table-bordered table-striped table-hover">
                <thead>
                     <tr>
                         <th>Name</th>
                         <th>Register No</th>
                         <th>Mail ID</th>
                         <th>Session Date</th>
                     </tr>
                </thead>
                <tbody>
                    <%
                         String query = (String)session.getAttribute("user");
                         String  data = "select *from session where regno = '"+query+"'";
                           rs = stmt.executeQuery(data);
                         while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("regno")%></td>
                        <td><%=rs.getString("mail")%></td>
                        <td><%=rs.getString("date")%></td>
                    </tr>
                    <%
                     }
                    %>
                </tbody>
             </table>
          </div>
        </div>
    </body>
   
</html>
