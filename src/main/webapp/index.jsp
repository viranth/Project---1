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
            String str = (String)session.getAttribute("user");
        %>
        <div class="container">
        <div>
        <div><h3>Hello, <%=str %> Welcome to panel</h3></div>
            <div class="row">
                <div class="col-md-3">
                    <marquee behavior="" direction="">
                        <h3>Question List</h3>
                    </marquee>
                </div>
                <div class="col-md-3">
                    <form action="" method="get">
                        <input type="text" name="q" id="q" class="form-control" placeholder="Search Here..." >
                        
                    </form>
                </div>
                  <% 
                         if(str.equals("Admin")){
                         %><div class="col-md-3">
                    <a href="addnew.jsp" class="btn btn-primary">Add New</a>
                </div>
 							<div class="col-md-3">
                    			<h3><a href="usersession.jsp" class="btn btn-success">Users Session</a></h3>
               				 </div>
               				 <div class="col-md-3">
                    			<h3><a href="userdetails.jsp" class="btn btn-success">User details</a></h3>
               				 </div>
                         <%
                         }else{
                         %>
                         <div class="col-md-3">
                    		<h3><a href="usersession2.jsp" class="btn btn-success">Users Session</a></h3>
                		</div>
                         <% }%>
                          <div class="col-md-3">
                    		<h3><a href="logout.jsp" class="btn btn-success">logout</a></h3>
                		</div>
            </div>
            <hr>
            <table class = "table table-bordered table-striped table-hover">
                <thead>
                
                     <tr>
                         <th>ID</th>
                         <th>branch</th>
                         <th>Regulation</th>
                         <th>month</th>
                         <th>Year</th>
                         <th>subject code</th>
                         <th>subject name</th>
                         <th>link</th>
                         <th class="text-center">View</th>
                         <% 
                         if(str.equals("Admin")){
                         %>
                         <th>Action</th>
                         <%
                         }
                         %>
                     </tr>
                </thead>
                <tbody>
                    <%
                         String query = request.getParameter("q");
                         String data;
                         if(query!=null){
                            data = "select *from questions where branch like'%"+query+"%' or regulation like'%"+query+"%' or month like'%"+query+"%' or year like'%"+query+"%' or subcode like'%"+query+"%' or subname like'%"+query+"%'";
                            %>
                            <a href="index.jsp" class="btn btn-primary">back</a>
                            <hr>
                            
                       <% }
                        else
                            data =  "select *from questions order by id desc";
                           rs = stmt.executeQuery(data);
                         while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getInt("id")%></td>
                        <!-- <td><%=rs.getString("deptid")%></td> -->
                        <td><%=rs.getString("branch")%></td>
                        <td><%=rs.getString("regulation")%></td>
                        <td><%=rs.getString("month")%></td>
                        <td><%=rs.getString("year")%></td>
                        <td><%=rs.getString("subcode")%></td>
                        <td><%=rs.getString("subname")%></td>
                        <td><a href='<%=rs.getString("link")%>' target="_blank" class="btn btn-primary">click</a></td>
                        <td><a href='view.jsp?u=<%=rs.getInt("id")%>' class="btn btn-primary">view</a></td>
                         <% 
                         if(str.equals("Admin")){
                         %>
 							<td class="text-center">
                            <a href='edit.jsp?u=<%=rs.getInt("id")%>' class="btn btn-warning">Edit</a>
                            <a href='delete.jsp?d=<%=rs.getInt("id")%>' class="btn btn-danger">Delete</a>
                        </td>
                         <%
                         }
                         %>
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
