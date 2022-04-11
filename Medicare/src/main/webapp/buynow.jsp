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

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" onclick="logout()" href="index.jsp">Medicare</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
   
     <a href="login.jsp" class="btn btn-outline-success my-2 my-sm-0" onclick="logout()">Logout</a> 
    
    </form>
  </div>
</nav>

    <title>User Dashborad</title>
  </head>
  <body>
    <h3 class="text-center display-4 mt-2">Proceed to Pay</h3>
    <div class="container">
    
    
    
    
      <div class="col-md-8 offset-md-2 mb-2"> 
      
     <%
try
{
	String id= request.getParameter("id"); 
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost/medicare";
	String username="root";
	String password="root";
	String query="select * from products where pid="+id;
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query); %>


<% while(rs.next())
{

%>
<div class="border border-dark p-4">
   <form action="payment" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Product Name</label>
    <input type="text" class="form-control" value="<%= rs.getString("pname") %>"name="pname" >
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Description</label>
    <input type="text" class="form-control" value="<%=rs.getString("pdesc") %>"name="pdesc">
  </div>
  
    <div class="form-group">
    <label for="exampleInputPassword1">Product Price</label>
    <input type="number" class="form-control" value="<%=rs.getString("pprice") %>"name="pprice">
    <input type="hidden" name="pid" value="<%=rs.getInt("pid") %>">
  </div>
      <div class="form-group">
      <center>
      <img src="<%=rs.getString("img") %>" width="100px" height="100px">
   </center>
    
  </div>
  


  <button type="submit" class="btn btn-primary">Pay</button>
	</form>
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