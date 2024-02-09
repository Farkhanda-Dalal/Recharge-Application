package recharge.model;

public class Register {

	private String name;
	private String email;
	private String mobNo;
	private String password;
	
	public Register(String name, String email, String mobNo, String password) {
		super();
		this.name = name;
		this.email = email;
		this.mobNo = mobNo;
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}



}
