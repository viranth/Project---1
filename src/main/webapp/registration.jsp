<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up page</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						 <form class= "form-group"action="" method="get">
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control form-control"name="uname" id="uname" placeholder="Enter the username">
                                <br>
                            </div>
                                <div class="col">
                                    <input type="text" class="form-control form-control"name="ureg" id="uname" placeholder="Enter the reg no">
                                    <br>
                                </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <!-- <input type="text" class="form-control form-control"name="udept" id="upass" placeholder="Enter the department"> -->
                                <select class="form-select form-select-md mb-3" name="udept">
                                    <option disabled="disabled" selected="selected" value="">Select your Department</option>
                                    <option value="IT">IT</option>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH">MECH</option>
                                    <option value="CIVIL">CIVIL</option>
                                </select>
                                <br>
                            </div>
                            <div class="col">
                                <select class="form-select form-select-md mb-3" name="uyear">
                                    <option disabled="disabled" selected="selected" value="">select your year</option>
                                    <option value="I">1</option>
                                    <option value="II">2</option>
                                    <option value="III">3</option>
                                    <option value="IV">4</option>
                                </select>
                                <br>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control form-control"name="umail" id="upass" placeholder="Mail ID">
                                <br>
                              </div>
                              <div class="col">
                                <input type="text" class="form-control form-control"name="uphone" id="uname" placeholder="phone no">
                                <br>
                              </div>
                        </div>
                            <input type="password" class="form-control form-control-lg"name="upass" id="upass" placeholder="Enter the password">
                        <div class=""><br><p class="me-3"></p>
                            <button class="btn btn-lg btn-primary me-5">signup</button>
                        </div>
                    </form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
<%
    String a = request.getParameter("uname");
    String b = request.getParameter("ureg");
    String c = request.getParameter("udept");
    String d = request.getParameter("uyear");
    String e = request.getParameter("umail");
    String f = request.getParameter("uphone");
    String g = request.getParameter("upass");
    String host= "jdbc:mysql://localhost:3306/mydata";
    Connection con = null;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    if(a!=null && b!=null && c!=null && d!=null){
        con = DriverManager.getConnection(host,"root","");
        stmt = con.prepareStatement("INSERT INTO login(name, mail, phone, regNo, dept, year, pass) VALUES(?,?,?,?,?,?,?);");
        stmt.setString(1,a);
        stmt.setString(2,e);
        stmt.setString(3,f);
        stmt.setString(4,b);
        stmt.setString(5,c);
        stmt.setString(6,d);
        stmt.setString(7,g);
        stmt.executeUpdate();
        response.sendRedirect("login.jsp");
    }
%>