<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Login</title>
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
     <a href="login.jsp" class="btn btn-outline-success my-2 my-sm-0">User Login</a>
      <a href="signup.jsp" class="btn btn-outline-success mx-2 my-sm-0">SignUp</a>
    </form>
  </div>
</nav>
    <h1 class="text-center display-4">Admin Login</h1>

   <div clas="container">
   
   <div class="col-md-4 offset-md-4">
   <form action="adminlogin" method="post">
  <div class="form-group">
    <label for="InputEmail1">Email address</label>
    <input type="email" class="form-control" name="email" >
   
  </div>
  <div class="form-group">
    <label for="InputPassword1">Password</label>
    <input type="password" class="form-control" name="password">
  </div>

  <button type="submit" class="btn btn-primary">Login</button>
</form>
</div>
   </div>
<footer class="bg-light py-3 fixed-bottom"><h3 class="text-center">All Rights Reserved &copy 2022</h3></footer>
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="js/jquery.slim.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
  
  </body>
</html>