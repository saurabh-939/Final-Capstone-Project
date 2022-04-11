package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MedicareDao;
import com.db.DBConnection;
import com.entity.EditProducts;
import com.entity.Products;
@WebServlet("/editproducts")
@MultipartConfig(maxFileSize = 16177215)  
/**
 * Servlet implementation class editproduct
 */
public class editproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		String id=request.getParameter("id");
//		
//		PrintWriter out = response.getWriter();
//		out.print(id);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
	
		int pid=Integer.parseInt(request.getParameter("pid"));
		int pprice=Integer.parseInt(request.getParameter("pprice"));
		int status=Integer.parseInt(request.getParameter("status"));
		String pname=request.getParameter("pname");
		String pdesc=request.getParameter("pdesc");
		
		
		MedicareDao dao= new MedicareDao(DBConnection.getCon());
		EditProducts p=new EditProducts(pdesc,pname,pprice,pid,status);
		
		boolean f=dao.updateProducts(p);
		
		HttpSession session=request.getSession();
		 response.setContentType("text/html");
//           PrintWriter out = response.getWriter();
//           out.print(f);
		
		if(f) {
			session.setAttribute("success","Product Update  Successfully");
			
			response.sendRedirect("dashboardadmin.jsp");
		
		}else {
			session.setAttribute("failed","Something went wrong");
			response.sendRedirect("dashboardadmin.jsp");
		}
		
	}catch(Exception e) {
		
	}
	}

}
