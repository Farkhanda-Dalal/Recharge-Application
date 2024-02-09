package recharge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recharge.dao.RegisterDao;
import recharge.dao.RegisterDaoImpl;
import recharge.dao.TransactionDao;
import recharge.dao.TransactionDaoImpl;
import recharge.model.Register;
import recharge.model.Transaction;

/**
 * Servlet implementation class HistoryController
 */
@WebServlet("/HistoryController")
public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		HttpSession session=request.getSession();
		
		if(request.getParameter("done")!=null)
		{
			RegisterDao rdao=new RegisterDaoImpl();
			List<Register> lstlog=rdao.login();
			
			String his_mob=request.getParameter("his_mob");
			boolean b=false;
			for(Register r:lstlog)
			{
				if(his_mob.equals(r.getMobNo()))
				{
					b=true;
					break;
				}
			}
			
			if(b==true)
			{
				TransactionDao tdao=new TransactionDaoImpl();
				List<Transaction> lsth=tdao.history(his_mob);
				if(lsth!=null)
				{	
					for(Transaction tra:lsth)
					{
						request.setAttribute("hist_list", lsth);
						request.getRequestDispatcher("History.jsp").forward(request, response);
					}

				}
				else
				{
					pw.println("null");
				}
			}
			else
			{
				session.setAttribute("mob", his_mob);
				response.sendRedirect("History.jsp");
			}
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
