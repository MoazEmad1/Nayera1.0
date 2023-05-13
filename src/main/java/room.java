
public class room {
	    private String number ;
	    private String description;
	    private String type;
	    private double price;
	    private String state;
		public room(String number , String description, String type, double price, String state) {
			this.number = number;
			this.description = description;
			this.type = type;
			this.price = price;
			this.state = state;
		}
		
		
		public String getNumber() {
			return number;
		}


		public void setNumber(String number) {
			this.number = number;
		}


		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		

	    
	    
	    
	    
}
