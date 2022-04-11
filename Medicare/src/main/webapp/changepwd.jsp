      <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
   </head>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" onclick="logout()" href="index.jsp">Medicare</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active"> 
        <a class="nav-link" href="#">Change Password</a>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <span class="mr-2">Welcome :  Admin </span>
     <a href="adminlogin.jsp" class="btn btn-outline-success my-2 my-sm-0" onclick="logout()">Logout</a> 
    
    </form>
  </div>
</nav>

    <title>Admin Dashboard</title>
  </head>
  <body>
    <h3 class="text-center display-4 mt-2">Change Password</h3>
    <div class="container">
    
    	<%
	String msg=(String)session.getAttribute("yes");
	if(msg!=null){ %>
			
		
		<div class="alert alert-success alert-dismissible fade show" role="alert">
  		<strong>Password change Successfully</strong> 
  	   <button type="button" onclick="logout"class="close" data-dismiss="alert" aria-label="Close">
    	<span aria-hidden="true">&times;</span>
  		</button>
		</div>
			
			
		<% }%>
    
      <div class="col-md-6 offset-md-2 mb-2"> 
      

   <form action="changepwd" id="form" method="post">
  <div class="form-group">
    <label for="password1">New Password</label>
    <input type="password" class="form-control" id="p1" value="" name="pass1">

  </div>
  <div class="form-group">
    <label for="password2">Confirm New Passsword</label>
    <input type="password" class="form-control" id="p2" value="" name="pass2">
  </div>

  <button type="submit"  class="btn btn-primary">Change Password</button>
	</form>
	</div>
    
  </tbody>
    
    </div>


<footer class="bg-light py-3 fixed-bottom"><h3 class="text-center">All Rights Reserved &copy 2022</h3></footer>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="js/jquery.slim.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	function logout(){
		<% session.invalidate();%>
	}
	
	</script>
   
  </body>
</html>