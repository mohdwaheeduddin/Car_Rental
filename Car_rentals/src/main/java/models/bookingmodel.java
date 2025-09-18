package models;

import java.time.LocalDate;

public class bookingmodel {

	    private int sno; 
	    private int userId;
	    private int carId;
	    private String carName;
	    private String imageUrl;
	    private double pricePerDay;
	    private LocalDate fromDate;
	    private LocalDate toDate;
	    private int days;
	    private String licenseNo;
	    private double totalPrice;
	    
	    public bookingmodel() {
	    	
	    }
	    
		public bookingmodel(int sno, int userId, int carId, String carName, String imageUrl, double pricePerDay,
				LocalDate fromDate, LocalDate toDate, int days, String licenseNo, double totalPrice) {
			super();
			this.sno = sno;
			this.userId = userId;
			this.carId = carId;
			this.carName = carName;
			this.imageUrl = imageUrl;
			this.pricePerDay = pricePerDay;
			this.fromDate = fromDate;
			this.toDate = toDate;
			this.days = days;
			this.licenseNo = licenseNo;
			this.totalPrice = totalPrice;
		}
		public int getSno() {
			return sno;
		}
		public void setSno(int sno) {
			this.sno = sno;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public int getCarId() {
			return carId;
		}
		public void setCarId(int carId) {
			this.carId = carId;
		}
		public String getCarName() {
			return carName;
		}
		public void setCarName(String carName) {
			this.carName = carName;
		}
		public String getImageUrl() {
			return imageUrl;
		}
		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}
		public double getPricePerDay() {
			return pricePerDay;
		}
		public void setPricePerDay(double pricePerDay) {
			this.pricePerDay = pricePerDay;
		}
		public LocalDate getFromDate() {
			return fromDate;
		}
		public void setFromDate(LocalDate fromDate) {
			this.fromDate = fromDate;
		}
		public LocalDate getToDate() {
			return toDate;
		}
		public void setToDate(LocalDate toDate) {
			this.toDate = toDate;
		}
		public int getDays() {
			return days;
		}
		public void setDays(int days) {
			this.days = days;
		}
		public String getLicenseNo() {
			return licenseNo;
		}
		public void setLicenseNo(String licenseNo) {
			this.licenseNo = licenseNo;
		}
		public double getTotalPrice() {
			return totalPrice;
		}
		public void setTotalPrice(double totalPrice) {
			this.totalPrice = totalPrice;
		}

		
	    
	
}
