package recharge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recharge.dao.AccountDao;
import recharge.dao.AccountDaoImpl;
import recharge.model.Account;
import recharge.model.Register;
import recharge.model.Transaction;

/**
 * Servlet implementation class AddCardController
 */
@WebServlet("/AddCardController")
public class AddCardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		if(request.getParameter("submit")!=null)
		{
			String accNo=request.getParameter("accNo");
			String accName=request.getParameter("accName");
			String exp=request.getParameter("month")+"/"+request.getParameter("year");
			float accBal=Float.parseFloat(request.getParameter("accBal"));
			int cvv=Integer.parseInt(request.getParameter("cvv"));
			
			Account a=new Account( accNo, accName, accBal, cvv, exp);
			List<Account> lstacc=new ArrayList<Account>();
			lstacc.add(a);
			
			AccountDao adao=new AccountDaoImpl();
			int i=adao.add(lstacc);
			Integer iobj=i;
			
			if(i>0)
			{
				session.setAttribute("card", iobj);
				response.sendRedirect("Dashboard.jsp");
				
			}
			else
			{
				pw.println("OOPS! SOMETHING WENT WRONG");
			}

		}
		
		
		float bal=0;
		Transaction trans=(Transaction)request.getAttribute("trans");
		if(trans!=null)
		{
			AccountDao adao=new AccountDaoImpl();
			List<Account> lst=adao.approve();
			for(Account a:lst)
			{
				if((trans.getAccNo().equals(a.getAccNo())))
				{
					bal=a.getAccBal();
					break;
				}
					
			}
			
			int i=adao.recharge(trans, bal);
			boolean b=false;
			if(i>0)
			{
				b=true;
			}
			else
			{
				pw.println("update not done");
			}	
			
			if(b==true)
			{
				Boolean bool=Boolean.valueOf(b);
				request.setAttribute("result", bool);
				RequestDispatcher req=request.getRequestDispatcher("DashboardController");
				req.forward(request, response);
			}
		}
		else
		{
			pw.println("trans is null");
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
