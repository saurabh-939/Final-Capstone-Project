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
    <title>Medicare</title>
  </head>
  <body>
 


 <!-- Nav -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Medicare</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
     <a href="login.jsp" class="btn btn-outline-success my-2 my-sm-0">Login</a>
      <a href="signup.jsp" class="btn btn-outline-success mx-2 my-sm-0">SignUp</a>
    </form>
  </div>
</nav>
  <!-- - -->
  
 
  
  <!-- --carousel -->
  
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/img-1.png" class="d-block w-100  alt="medicare">
    </div>
    <div class="carousel-item">
      <img src="img/img-2.jpg" class="d-block w-100" alt="medicare">
    </div>
   
  </div>
 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>
  <!-- - -->
  <div class="container-fluid">
  <div class="jumbotron">
  <h1 class="text-center display-4">Medicare Health Products</h1>
  </div>
  </div>
  <div class="container">
    <h3 class="text-center display-4">Our Products</h3>
  
    <div class="row mb-4 mt-4">
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
    
    <a href="login.jsp"  class="btn btn-outline-primary">Buy Now</a>
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
  <div class="container-fluid">
  <div class="jumbotron">
  <div class="row">
  <div class="col-md-6"> <h1 class="text-center display-4">About Us</h1></div>
   <div class="col-md-6"> <h4 class="display-8">Medicare is a fast-growing online pharmacy that empowers people to buy medicines and other health care products from the convenience of home 24/7 and 365 days a year </h4></div>
   </div>
 
  </div>
  </div>
  
  
  <div class="container mt-5 mb-5">
        <h1 class="display-4 text-center mt-2 mb-4 ">Our Cutsomer Reviews</h1>
        	
        <div class="row g-2">
            <div class="col-md-4 ">
                <div class="card p-3 text-center px-4" style="border-style: outset;">
                    <div class="user-image"> <img src="https://i.imgur.com/PKHvlRS.jpg" class="rounded-circle" width="80"> </div>
                    <div class="user-content">
                        <h5 class="mb-0">Bruce Hardy</h5>
                        <p>All types of medicines are in one place good service.</p>
                    </div>
                    <div class="ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 text-center px-4" style="border-style: outset;">
                    <div class="user-image"> <img src="https://i.imgur.com/w2CKRB9.jpg" class="rounded-circle" width="80"> </div>
                    <div class="user-content">
                        <h5 class="mb-0">Mark Smith</h5>
                        <p>24/7 Service on time supprort highly recommended.</p>
                    </div>
                    <div class="ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 text-center px-4" style="border-style: outset;">
                    <div class="user-image"> <img src="https://i.imgur.com/ACeArwY.jpg" class="rounded-circle" width="80"> </div>
                    <div class="user-content">
                        <h5 class="mb-0">Veera Duncan</h5>
                        <p> Good Service Highly Recommended </p>
                    </div>
                    <div class="ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div>
                </div>
            </div>
        </div>
    </div>
  
  <div class="jumbotron mb-0 ">
        <div class="container ">
            <h2 class="display-4 text-center mb-4 ">Contact Us</h2>
            <form>
                <div class="form-row ">
                    <div class="form-group col-md-6 ">
                        <label for="fname ">First Name</label>
                        <input type="text " class="form-control ">
                    </div>
                    <div class="form-group col-md-6 ">
                        <label for="lname ">Last Name</label>
                        <input type="text " class="form-control ">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="inputAddress ">Address</label>
                    <input type="text " class="form-control " placeholder="1234 Main St ">
                </div>
                <div class="form-row ">
                    <div class="form-group col-md-6 ">
                        <label for="email ">Email</label>
                        <input type="email " class="form-control " placeholder="test@gmail.com ">
                    </div>

                    <div class="form-group col-md-6 ">
                        <label for="phone ">Mobile Number</label>
                        <input type="number " class="form-control ">
                    </div>
                </div>
                <div class="form-row ">
                    <div class="form-group col-md-6 ">
                        <label for="inputCity ">City</label>
                        <input type="text " class="form-control " id="inputCity ">
                    </div>
                    <div class="form-group col-md-4 ">
                        <label for="inputState ">State</label>
                        <select id="inputState " class="form-control ">
                <option selected>Choose...</option>
                <option>...</option>
              </select>
                    </div>
                    <div class="form-group col-md-2 ">
                        <label for="inputZip ">Zip</label>
                        <input type="text " class="form-control " id="inputZip ">
                    </div>
                </div>

                <button type="submit " class="btn btn-primary ">Submit</button>
            </form>
        </div>
    </div>
  
 
  <footer class="bg-light py-3 "><h3 class="text-center">All Rights Reserved &copy 2022</h3></footer>
  
  
  
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="js/jquery.slim.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    
  </body>
</html>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 