package recharge.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recharge.model.Transaction;

public interface TransactionDao {
	
	public int insert(Transaction trans);
	public List<Transaction> history(String his_mob);
}
