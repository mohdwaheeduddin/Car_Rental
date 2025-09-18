package models;

public class loginmodel {

	int userid;
	String firstname;
	String lastname;
	String password;
	
	
	public loginmodel() {
		
	}
	
	
	public loginmodel(int userid ,String firstname, String lastname, String password) {
		super();
		this.userid=userid;
		this.firstname = firstname;
		this.lastname = lastname;
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
}
