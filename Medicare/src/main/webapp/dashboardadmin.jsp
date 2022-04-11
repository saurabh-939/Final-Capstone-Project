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
<style>
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
</head>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" onclick="logout()" href="index.jsp">Medicare</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active"> 
        <a class="nav-link" href="changepwd.jsp">Change Password</a>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <span class="mr-2">Welcome : Admin</span>
     <a href="adminlogin.jsp" class="btn btn-outline-success my-2 my-sm-0" onclick="logout()">Logout</a> 
    
    </form>
  </div>
</nav>

    <title>Admin Dashboard</title>
  </head>
  <body>
    <h3 class="text-center display-4 mt-2">Add Products</h3>
    <div class="container">
    
    
      <div class="col-md-6 offset-md-2 mb-2"> 
   <form action="addproducts" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">Product Name</label>
    <input type="text" class="form-control" name="pname" >
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Description</label>
    <input type="text" class="form-control" name="pdesc">
  </div>
  
    <div class="form-group">
    <label for="exampleInputPassword1">Product Price</label>
    <input type="number" class="form-control" name="pprice">
    <input type="hidden" name="status" value="1">
  </div>
      <div class="form-group">
    <label for="exampleInputPassword1">Product Image</label>
    <input type="file" class="form-control" name="img">

  </div>

  <button type="submit" class="btn btn-primary">Add Product</button>
	</form>
	</div>
    
    
    
    
    
    
    
    	<table class="table table-dark mt-4">
  <thead>
    <tr>
      <th scope="col">#</th>
       <th scope="col">Image:</th>
      <th scope="col">Product Name:</th>
      <th scope="col">Description</th>
      <th scope="col">Price</th>
      <th scope="col">Status</th>
      <th scope="col">Edit</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <%
try
{
	String id= request.getParameter("id"); 
	
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost/medicare";
	String username="root";
	String password="root";

	String query="select * from products";
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query); 
	
	
	
	%>


<% while(rs.next())
{

%>
<tbody>
   <tr>
      <th scope="row"><%= rs.getInt("pid") %></th>
         <td><img src="<%= rs.getString("img") %>" width="50px; height="50px"></td>
      <td><%= rs.getString("pname") %></td>
      <td><%=rs.getString("pdesc") %></td>
      <td><%=rs.getString("pprice") %></td>
       <td>
       <div class="form-check form-check-inline">
       <input type="hidden" id="status" value="<%=rs.getString("status") %>">
  	   <label class="switch">
 	    <input type="checkbox" id="checkbox1" checked>
  		<span class="slider round"></span>
        </label>
 
 
       </td>
      <td><a href="productedit.jsp?id=<%=rs.getString("pid") %>">Edit </a></td>
       <td><a href="dashboardadmin.jsp?id=<%=rs.getString("pid") %>">Delete </a></td>
       </tr>
   <%} %>
  </tbody>
 
   
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
 
     <%
     
     String id= request.getParameter("id");
     try
     {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicare", "root", "root");
     Statement st=conn.createStatement();
     int i=st.executeUpdate("DELETE FROM products WHERE pid="+id);
     if(i==1){
    	 response.sendRedirect("dashboardadmin.jsp");
    	 
     }

     }
     catch(Exception e)
     {
     System.out.print(e);
     e.printStackTrace();
     }
     %>

</table>
    
    </div>

<footer class="bg-light py-3 mt-4"><h3 class="text-center">All Rights Reserved &copy 2022</h3></footer>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="js/jquery.slim.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(){

 var status =  $("#status").val();

 if(status==1){
	 $("#checkbox1").prop('checked')
	
	
 }else {
	 
	 $("#checkbox1").removeAttr('checked');
 }
 
});
</script>
<script type="text/javascript">
	function logout(){
		<% session.invalidate();%>
	}
	</script>
   
  </body>
</html>