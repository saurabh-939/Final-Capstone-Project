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
import com.entity.ChangePwd;
@WebServlet("/changepwd")

/**
 * Servlet implementation class changepwd
 */
public class changepwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changepwd() {
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
		String password=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
		MedicareDao dao= new MedicareDao(DBConnection.getCon());
		ChangePwd cp=new ChangePwd(password);
		boolean f=dao.changePwd(cp);
		response.setContentType("text/html");
	      
		HttpSession session=request.getSession();
		
		session.setAttribute("yes", "Password changed Successfully!");
		response.sendRedirect("changepwd.jsp");
	}

}
