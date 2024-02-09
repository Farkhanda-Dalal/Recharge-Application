package recharge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import recharge.dao.TransactionDao;
import recharge.dao.TransactionDaoImpl;
import recharge.db.Dbconnection;
import recharge.model.Transaction;

/**
 * Servlet implementation class TransactionController
 */
@WebServlet("/TransactionController")
public class TransactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TransactionController() {
        super();
        // TODO Auto-generated constructor stub
    }

    int i;
    Connection con=Dbconnection.getConnection();
    PreparedStatement p=null;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		
		Transaction trans=(Transaction) request.getAttribute("trans");
		if(trans!=null)
		{
			TransactionDao tdao=new TransactionDaoImpl();
			int i=tdao.insert(trans);
			if(i>0)
			{
				request.setAttribute("tdetails", trans);
				request.getRequestDispatcher("Dashboard.jsp").forward(request, response);

			}
			else
			{
				pw.println("not completed");
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
