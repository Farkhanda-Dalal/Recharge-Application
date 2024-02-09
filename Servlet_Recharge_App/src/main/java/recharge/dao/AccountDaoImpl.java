package recharge.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import org.apache.catalina.connector.Response;

import recharge.db.Dbconnection;
import recharge.model.Account;
import recharge.model.Register;
import recharge.model.Transaction;

public class AccountDaoImpl implements AccountDao {

	int i;
	PreparedStatement p=null;
	Connection con=Dbconnection.getConnection();
	
	@Override
	public int add(List<Account> lstacc) {
		// TODO Auto-generated method stub
		
		for(Account a:lstacc)
		{
			try {
				p=con.prepareStatement("insert into Account1 values(?,?,?,?,?)");
				p.setString(1, a.getAccNo());
				p.setString(2, a.getAccName());
				p.setFloat(3, a.getAccBal());
				p.setInt(4, a.getCvv());
				p.setString(5, a.getExp());
				
				i=p.executeUpdate();
			}

			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return i;
	}

	@Override
	public List<Account> approve() {
		// TODO Auto-generated method stub
		
		List<Account> lst= new ArrayList<Account>();
		String s="select * from Account1";
		try {
			Statement st=con.createStatement();

			ResultSet rs=null;

			rs=st.executeQuery(s);
			while(rs.next())
			{
				Account a=new Account(rs.getString(1), rs.getString(2), rs.getFloat(3),rs.getInt(4) , rs.getString(5));
				lst.add(a);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public int recharge(Transaction trans,float bal) {
		// TODO Auto-generated method stub
		float price=bal-trans.getTransPrice();
		
		try {
			p=con.prepareStatement("update account1 set accBal=? where accNo=?");
			p.setFloat(1, price);
			p.setString(2, trans.getAccNo());
			
			i=p.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	}

	


