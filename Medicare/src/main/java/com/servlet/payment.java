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
import com.entity.PaymentGetway;
@WebServlet("/payment")
/**
 * Servlet implementation class payment
 */
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payment() {
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
			String pname =request.getParameter("pname");
			int pprice=Integer.parseInt(request.getParameter("pprice"));
			MedicareDao dao= new MedicareDao(DBConnection.getCon());
			PaymentGetway p=new PaymentGetway (pname,pprice);
			boolean f=dao.pay(p);
			HttpSession session=request.getSession();
			
			session.setAttribute("pay", "Payment Done Successfully!");
			response.sendRedirect("dashboraduser.jsp");
			
			
		}catch(Exception e) {
			
		}
	}

}
