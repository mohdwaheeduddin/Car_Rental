package models;

public class registermodel {

	String firstname;
	String lastname;
	String password;
    String email;
    String phone;
    
    public registermodel() {
    	
    }
    
    
    
	public registermodel(String firstname, String lastname, String password, String email, String phone) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.password = password;
		this.email = email;
		this.phone = phone;
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



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone2) {
		this.phone = phone2;
	}
    
	
	
    
}
