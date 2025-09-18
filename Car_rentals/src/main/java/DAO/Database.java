package DAO;

import java.util.List;

import models.bookingmodel;
import models.carmodels;
import models.loginmodel;
import models.registermodel;

public interface Database {

	public String insertdata(registermodel rm);
	public loginmodel selectdata(loginmodel lm);
	public List getAllCars();
	public boolean bookedcar(bookingmodel bm);
}
