package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MedicareDao;
import com.db.DBConnection;
import com.entity.AdminLogin;
import com.entity.UserLogin;
@WebServlet("/adminlogin")
/**
 * Servlet implementation class adminlogin
 */
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminlogin() {
        super();
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
		doGet(request, response);
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
		
			PrintWriter out= response.getWriter();
			out.print(email);
			MedicareDao dao= new MedicareDao(DBConnection.getCon());
			AdminLogin al=new AdminLogin(email,password);

			boolean f=dao.adminLogin(al);

			HttpSession session=request.getSession();
			 response.setContentType("text/html");
//	            PrintWriter out = response.getWriter();
//	            out.print(f);
			
			if(f) {
				session.setAttribute("success","Login Successfull");
				session.setAttribute("email",email);
				response.sendRedirect("dashboardadmin.jsp");
			
			}else {
				session.setAttribute("failed","Something went wrong");
				response.sendRedirect("adminlogin.jsp");
			}
			
		}catch(Exception e) {
			
		}
	}

}
