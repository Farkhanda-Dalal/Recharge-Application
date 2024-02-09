package recharge.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import recharge.db.Dbconnection;
import recharge.model.Transaction;

public class TransactionDaoImpl implements TransactionDao {
	
	int i;
	Connection con=Dbconnection.getConnection();
	PreparedStatement p=null;

	@Override
	public int insert(Transaction trans) {
		// TODO Auto-generated method stub
		
		try {
			p=con.prepareStatement("insert into Transactions values(?,?,trans_id.nextval,sysdate,?,?,?,?)");
			p.setString(1, trans.getMobNo());
			p.setString(2, trans.getRe_mobNo());
			p.setString(3, trans.getTransPlan());
			p.setFloat(4, trans.getTransPrice());
			p.setString(5, trans.getAccNo());
			p.setInt(6, trans.getCvv());
			
			i=p.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public List<Transaction> history(String his_mob) {
		// TODO Auto-generated method stub
		List<Transaction> lsth=new ArrayList<Transaction>();
		
		try {
			p=con.prepareStatement("select mobNo,re_mobNo,transId,transDate,transPlan,transPrice,accNo from transactions where mobNo=?");
			p.setString(1, his_mob);
			
			ResultSet rs=p.executeQuery();
			
			Transaction tra=null;
			while(rs.next())
			{
				tra=new Transaction(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDate(4), rs.getString(5), rs.getFloat(6), rs.getString(7), 0);
				lsth.add(tra);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lsth;
	}

}
