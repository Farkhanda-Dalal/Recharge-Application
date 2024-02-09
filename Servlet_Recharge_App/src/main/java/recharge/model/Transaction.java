package recharge.model;

import java.sql.Date;

public class Transaction {
	
	private String mobNo;
	private String re_mobNo;
	private int transId;
	private Date transDate;
	private String transPlan;
	private float transPrice;
	private String accNo;
	private int cvv;
	public Transaction(String mobNo, String re_mobNo, int transId, Date transDate, String transPlan, float transPrice,
			String accNo, int cvv) {
		super();
		this.mobNo = mobNo;
		this.re_mobNo = re_mobNo;
		this.transId = transId;
		this.transDate = transDate;
		this.transPlan = transPlan;
		this.transPrice = transPrice;
		this.accNo = accNo;
		this.cvv = cvv;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getRe_mobNo() {
		return re_mobNo;
	}
	public void setRe_mobNo(String re_mobNo) {
		this.re_mobNo = re_mobNo;
	}
	public int getTransId() {
		return transId;
	}
	public void setTransId(int transId) {
		this.transId = transId;
	}
	public Date getTransDate() {
		return transDate;
	}
	public void setTransDate(Date transDate) {
		this.transDate = transDate;
	}
	public String getTransPlan() {
		return transPlan;
	}
	public void setTransPlan(String transPlan) {
		this.transPlan = transPlan;
	}
	public float getTransPrice() {
		return transPrice;
	}
	public void setTransPrice(float transPrice) {
		this.transPrice = transPrice;
	}
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
	
}
