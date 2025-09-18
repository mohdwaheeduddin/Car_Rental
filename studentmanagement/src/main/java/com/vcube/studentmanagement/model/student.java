package com.vcube.studentmanagement.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student")

public class student {
	
	@Id
	int id;
	String name;
	long phone;
	String domain;
	
	public student() {
		
		
	}
	
	
	
	@Override
	public String toString() {
		return "student [id=" + id + ", name=" + name + ", phone=" + phone + ", domain=" + domain + "]";
	}



	public student(int id, String name, long phone, String domain) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.domain = domain;
	}


	public  int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public long getPhone() {
		return phone;
	}


	public void setPhone(long phone) {
		this.phone = phone;
	}


	public String getDomain() {
		return domain;
	}


	public void setDomain(String domain) {
		this.domain = domain;
	}
	

}
