package recharge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recharge.dao.AccountDao;
import recharge.dao.AccountDaoImpl;
import recharge.dao.RegisterDao;
import recharge.dao.RegisterDaoImpl;
import recharge.dao.TransactionDao;
import recharge.dao.TransactionDaoImpl;
import recharge.model.Account;
import recharge.model.Register;
import recharge.model.Transaction;

/**
 * Servlet implementation class DashboardController
 */
@WebServlet("/DashboardController")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DashboardController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	boolean b;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DashboardController dc=new DashboardController();
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		
		if(request.getParameter("done")!=null)
		{	
			String sim=request.getParameter("sim");
			session.setAttribute("sim", sim);
			response.sendRedirect("Dashboard.jsp");
		}
		
		if(request.getParameter("Family_Pack")!=null)
		{
			String transPlan="Family Pack";
			float transPrice=2999;
			Transaction t=dc.plan(request, response, transPlan, transPrice);
		}

		if(request.getParameter("Super_Saver")!=null)
		{
			String transPlan="Super Saver";
			float transPrice=299;
			Transaction t=dc.plan(request, response, transPlan, transPrice);
		}

		if(request.getParameter("Combo_Pack")!=null)
		{
			String transPlan="Combo Pack";
			float transPrice=600;
			Transaction t=dc.plan(request, response, transPlan, transPrice);
			
		}

		if(request.getParameter("Super_Fast")!=null)
		{
			String transPlan="Super Fast";
			float transPrice=399;
			Transaction t=dc.plan(request, response, transPlan, transPrice);
		}
		
		if(request.getParameter("submit_card")!=null)
		{
			pw.println("reached card");
			String mobNo=request.getParameter("mobNo");
			String re_mobNo=request.getParameter("re_mobNo");
			String accNo=request.getParameter("accNo");
			int cvv=Integer.parseInt(request.getParameter("cvv"));
			String plan=request.getParameter("plan");
			float price=Float.parseFloat(request.getParameter("price"));
			
			Transaction trans=new Transaction(mobNo, re_mobNo, 0, null, plan, price, accNo, cvv);
			
			Boolean bool=(Boolean)request.getAttribute("result");
			if(bool!=null)
			{
				if(bool==true)
				{
					
					dc.saveTrans(request, response, trans);
				}
			}
			
			dc.transaction(request, response, trans);
			
		}
		
	} 
	
	public void saveTrans(HttpServletRequest request, HttpServletResponse response,Transaction trans)throws ServletException, IOException
	{
		request.setAttribute("trans",trans);
		RequestDispatcher req = request.getRequestDispatcher("TransactionController");
		req.forward(request, response);
	}
	
	public Transaction plan(HttpServletRequest request, HttpServletResponse response,String transPlan,float transPrice)throws ServletException, IOException
	{
		
		Transaction t=new Transaction(null, null, 0, null, transPlan, transPrice, null, 0);
		HttpSession session=request.getSession();
		session.setAttribute("plan", t);
		response.sendRedirect("Dashboard.jsp");
		return t;
	}
	
	public void transaction(HttpServletRequest request, HttpServletResponse response,Transaction trans)throws ServletException, IOException
	{
		AccountDao adao=new AccountDaoImpl();
		List<Account> lst=adao.approve();
		
		for(Account a:lst)
		{
			if((trans.getAccNo().equals(a.getAccNo()))&&(trans.getCvv()==a.getCvv()))
			{
				b=true;
				break;
			}
			else
			{
				b=false;
			}	
		}
		
		PrintWriter pw=response.getWriter();
		if(b==true)
		{
			request.setAttribute("trans",trans);
			RequestDispatcher req = request.getRequestDispatcher("AddCardController");
			req.forward(request, response);
			
		}
		else
		{
			pw.println("not found");
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
