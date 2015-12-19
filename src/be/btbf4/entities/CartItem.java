package be.btbf4.entities;

public class CartItem {
	
	private String name;
	
	private Double price;
	
	private int qte;

	public CartItem(String name, Double price2) {
		this.name = name;
		this.price = price2;
		this.qte=0;
	}
	
	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getQte() {
		return qte;
	}

	public void setQte(int qte) {
		this.qte = qte;
	}

}
