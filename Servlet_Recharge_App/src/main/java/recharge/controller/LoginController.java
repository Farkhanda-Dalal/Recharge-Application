package recharge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recharge.dao.RegisterDao;
import recharge.dao.RegisterDaoImpl;
import recharge.model.Register;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mobNo=request.getParameter("mobNo");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Register re=new Register(null, email, mobNo, password);
		
		RegisterDao rdao=new RegisterDaoImpl();
		List<Register> lstlog=rdao.login();
		PrintWriter pw=response.getWriter();
		
		boolean b=false;
		for(Register r:lstlog)
		{
			if((request.getParameter("email").equals(r.getEmail()))&&(request.getParameter("password").equals(r.getPassword())))
			{
				b=true;
				break;
			}
			else
			{
				b=false;
			}
		}
		
		HttpSession session=request.getSession();
		if(b==true)
		{
			response.sendRedirect("Dashboard.jsp");
		}
		else
		{
			Boolean bool=b;
			session.setAttribute("message", bool);
			response.sendRedirect("Login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
