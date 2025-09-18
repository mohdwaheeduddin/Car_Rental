package models;

public class carmodels {

	    
	   
        private String cid;
		private String cname;
	    private String specifications;
	    private String model;
	    private String variant;
	    private String costPerDay;
	    private String carimage;
	    
	    public carmodels() {
	    	
	    }
	    
		public carmodels(String cid, String cname, String specifications, String model, String variant, String costPerDay,String carimage) {
			super();
			
			this.cid=cid;
			this.cname = cname;
			this.specifications = specifications;
			this.model = model;
			this.variant = variant;
			this.costPerDay = costPerDay;
			this.carimage=carimage;
		}

		
		public String getCid() {
			return cid;
		}

		public void setCid(String cid) {
			this.cid = cid;
		}
		
		public String getCname() {
			return cname;
		}

		public void setCname(String cname) {
			this.cname = cname;
		}

		public String getSpecifications() {
			return specifications;
		}

		public void setSpecifications(String specifications) {
			this.specifications = specifications;
		}

		public String getModel() {
			return model;
		}

		public void setModel(String model) {
			this.model = model;
		}

		public String getVariant() {
			return variant;
		}

		public void setVariant(String variant) {
			this.variant = variant;
		}

		public String getCostPerDay() {
			return costPerDay;
		}

		public void setCostPerDay(String costPerDay2) {
			this.costPerDay = costPerDay2;
		}
		
		public String getCarimage() {
			return carimage;
		}

		public void setCarimage(String carimage) {
			this.carimage = carimage;
		}
         
		
	    
}
