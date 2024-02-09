package recharge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		String name=request.getParameter("name");
		String uname=request.getParameter("email");
		String mobNo=request.getParameter("mobNo");
		String password=request.getParameter("password");
		String con_password=request.getParameter("con_password");
		
		Register r=new Register(name, uname, mobNo, password);
		
		if(con_password.equals(password))
		{
			PrintWriter pw=response.getWriter();
			List<Register> lstr=new ArrayList<Register>();
			lstr.add(r);
			RegisterDao rdao=new RegisterDaoImpl();
			int i=rdao.register(lstr);
			
			Integer iobj=i;
			if(i>0)
			{
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			session.setAttribute("message", iobj);
			response.sendRedirect("Recharge.jsp");
		}
		else
		{
			boolean b=false;
			Boolean bool=Boolean.valueOf(b);
			session.setAttribute("result", bool);
			response.sendRedirect("Recharge.jsp");
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
