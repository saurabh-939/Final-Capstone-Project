package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.MedicareDao;
import com.db.DBConnection;
import com.entity.Products;
import com.entity.UserLogin;
@WebServlet("/addproducts")
@MultipartConfig(maxFileSize = 16177215)  
/**
 * Servlet implementation class Products
 */
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Product() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
		
		String pname=request.getParameter("pname");
		String pdesc=request.getParameter("pdesc");
		String pprice=request.getParameter("pprice");
		String status=request.getParameter("status");
	
		  InputStream inputStream = null; 
	         
	        
	        Part filePart = request.getPart("img");
	        String img1 = filePart.getSubmittedFileName();
	        String img="ProductImg/"+img1;
	        String fileName = filePart.getSubmittedFileName();
	        for (Part part : request.getParts()) {
	          part.write("C:\\Users\\Saurabh\\Desktop\\WebProjects\\Medicare\\src\\main\\webapp\\ProductImg\\" + fileName);
	        }
	    
		MedicareDao dao= new MedicareDao(DBConnection.getCon());
		Products p=new Products(pname,pdesc,pprice,status,img);
		
		boolean f=dao.addProducts(p);

		HttpSession session=request.getSession();
		 response.setContentType("text/html");
//            PrintWriter out = response.getWriter();
//            out.print(f);
		
		if(f) {
			session.setAttribute("success","Product Added Successfully");
			
			response.sendRedirect("dashboardadmin.jsp");
		
		}else {
			session.setAttribute("failed","Something went wrong");
			response.sendRedirect("dashboardadmin.jsp");
		}
		
	}catch(Exception e) {
		
	}
	}

}
