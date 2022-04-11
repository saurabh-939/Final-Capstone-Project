package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MedicareDao;
import com.db.DBConnection;
import com.entity.EditProducts;
import com.entity.RegisterUser;
@WebServlet("/registeruser")
/**
 * Servlet implementation class registeruser
 */
public class registeruser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registeruser() {
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
			String email =request.getParameter("email");
			String password=request.getParameter("password");
			MedicareDao dao= new MedicareDao(DBConnection.getCon());
			RegisterUser ru=new RegisterUser(email,password);
			
			boolean f=dao.addUser(ru);
			HttpSession session=request.getSession();
			
			session.setAttribute("yes", "Register User Successfully!");
			response.sendRedirect("signup.jsp");
			
		}catch(Exception e) {
			
		}
	}

}
