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

      
     <%
     
     String id= request.getParameter("id");
     try
     {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicare", "root", "root");
     Statement st=conn.createStatement();
     int i=st.executeUpdate("DELETE FROM products WHERE pid="+id);

     }
     catch(Exception e)
     {
     System.out.print(e);
     e.printStackTrace();
     }
     %>
     
     <footer class="bg-light py-3 fixed-bottom"><h3 class="text-center">All Rights Reserved &copy 2022</h3></footer>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="js/jquery.slim.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	windows.location.href="dashboradadmin.jsp";
	</script>
   
  </body>
</html>