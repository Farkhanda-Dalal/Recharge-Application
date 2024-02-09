package recharge.model;

import java.sql.Date;

public class Account {
	
//	private String mobNo;
	private String accNo;
	private String accName;
	private float accBal;
	private int cvv;
	private String exp;
	
	public Account(String accNo, String accName, float accBal, int cvv, String exp) {
		super();
//		this.mobNo = mobNo;
		this.accNo = accNo;
		this.accName = accName;
		this.accBal = accBal;
		this.cvv = cvv;
		this.exp = exp;
	}
//	public String getMobNo() {
//		return mobNo;
//	}
//	public void setMobNo(String mobNo) {
//		this.mobNo = mobNo;
//	}
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public float getAccBal() {
		return accBal;
	}
	public void setAccBal(float accBal) {
		this.accBal = accBal;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}

	
}
