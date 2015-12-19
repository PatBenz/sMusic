package be.btbf4.entities;

import java.util.ArrayList;
//import java.util.HashMap;
import java.util.List;
/**
 *
 * @author rajat
 */
public class Cart {
    //HashMap<String, Integer> cartItems;
	private int total;
	
	private int numberOfItems;
	
	List<CartItem> cartItems;
	
    public Cart(){
     //cartItems = new HashMap<>();
    	cartItems = new ArrayList<CartItem>();
    	this.total=0;
    	this.numberOfItems=0;
      
    }
    /*public HashMap getCartItems(){
        return cartItems;
    }*/
    public List<CartItem> getCartItems(){
        return cartItems;
    }
    public void addToCart(String name, Double price){
    	
   
       CartItem ci = findCartItem(name);
       
      if(ci!=null){
    	  ci.setQte(ci.getQte()+1);
    	  
      }
      else {
    	  
    	ci = new CartItem(name, price);
    	ci.setQte(ci.getQte()+1);
    	cartItems.add(ci);
    	numberOfItems++;
      }
    	
    	
    	this.total+= price;
    }
    
    public int getTotal() {
		return this.total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getNumberOfItems() {
		return numberOfItems;
	}
	public void setNumberOfItems(int numberOfItems) {
		this.numberOfItems = numberOfItems;
	}
	public CartItem findCartItem(String name){
		
		//boolean bool = false;
		
		 for(int i=0; i<cartItems.size(); i++){
	    	   
	    	   if(cartItems.get(i).getname().equals(name))
	    	   {
	    		   return cartItems.get(i);
	    		   }
	           //out.println("<tr><td>"+key+" - </td><td>"+"$"+items.get(key)+"</td></tr>");
	       }
		 
		 return null;
	}
     
}