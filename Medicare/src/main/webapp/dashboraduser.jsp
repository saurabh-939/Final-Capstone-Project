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

    <title> User Dashboard</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Medicare</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Transaction History</a>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <span class="mr-2">Welcome : User</span>
     <a href="login.jsp" class="btn btn-outline-success my-2 my-sm-0" onclick="logout()">Logout</a> 
    
    </form>
  </div>
</nav>
  

  
   <div class="container">
    <h3 class="text-center display-4">Products</h3>
    
    <%
	String msg=(String)session.getAttribute("pay");
	if(msg!=null){ %>
			
		
		<div class="alert alert-success alert-dismissible fade show" role="alert">
  		<strong>Payment Done Successfully</strong> 
  	   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    	<span aria-hidden="true">&times;</span>
  		</button>
		</div>
			
			
		<% }%>
    
    <div class="jumbotron">
    <div class="row mb-4">
      <%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost/medicare";
	String username="root";
	String password="root";
	String query="select * from products where status=1";
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query); %>


<% while(rs.next())
{

%>
    <div class="col-md-4">
    <div class="card" style="width: 18rem;">
  <img src="<%=rs.getString("img") %>" style=" width:250px";height:286px;"class="card-img-top" alt="...">
  <div class="card-body">
  	<strong>Product Name:- <%=rs.getString("pname") %></strong>
  	
    <p class="card-text"><%=rs.getString("pdesc") %></p>
    <strong> Rs:- <%=rs.getString("pprice") %></strong>
    
     <a href="buynow.jsp?id=<%=rs.getString("pid") %>"  class="btn btn-outline-primary">Buy Now</a>
  </div>
</div>
</div>

 <%} %>

 
   
   <%

    rs.close();
    stmt.close();
    conn.close();
    
    
    }
catch(Exception e)
{
    e.printStackTrace();
    }

%>
   
    </div>
    </div>
    </div>
      <footer class="bg-light py-3 mt-4"><h3 class="text-center">All Rights Reserved &copy 2022</h3></footer>
   

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