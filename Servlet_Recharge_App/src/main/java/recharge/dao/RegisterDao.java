package recharge.dao;

import java.util.List;

import recharge.model.Register;

public interface RegisterDao {
	
	public int register(List<Register> lstr);
	public List<Register> login ();

}
