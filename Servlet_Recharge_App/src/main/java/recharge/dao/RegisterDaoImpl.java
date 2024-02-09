package recharge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import recharge.db.Dbconnection;
import recharge.model.*;

public class RegisterDaoImpl implements RegisterDao {

	int i;
	PreparedStatement p=null;
	Connection con=Dbconnection.getConnection();

	@Override
	public int register(List<Register> lstr){
		// TODO Auto-generated method stub
		for(Register r:lstr)
		{
			try {
				p=con.prepareStatement("insert into Register values(?,?,?,?)");
				p.setString(1,r.getName());
				p.setString(2,r.getEmail());
				p.setString(3,r.getMobNo());
				p.setString(4,r.getPassword());

				i=p.executeUpdate();
			}

			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return i;
	}

	public List<Register> login () {
		// TODO Auto-generated method stub
		List<Register> lstlog= new ArrayList<Register>();
		String s="select * from Register";
		try {
			Statement st=con.createStatement();

			ResultSet rs=null;

			rs=st.executeQuery(s);
			while(rs.next())
			{
				Register r=new Register(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				lstlog.add(r);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lstlog;
	}


}

