package recharge.dao;

import java.util.List;

import recharge.model.Account;
import recharge.model.Register;
import recharge.model.Transaction;

public interface AccountDao {
	
	public int add(List<Account> lstacc);
	public List<Account> approve();
	public int recharge(Transaction trans,float bal);
}
