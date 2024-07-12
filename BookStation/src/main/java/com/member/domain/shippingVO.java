package com.member.domain;

public class shippingVO {
	
	// 작성완료 
	private int shipping_id;
    private long order_id;
    private String shipping_name;
    private String shipping_phone;
    private String shippingAddr1;
    private String shippingAddr2;
    private String shippingAddr3;
    private String shippingOption1;
    private String shippingOption2;
    
    @Override
    public String toString() {
    	String txt = "shipping_id: " + shipping_id + "\n"
    			+ "order_id: " + order_id + "\n"
    			+ "shipping_name: " + shipping_name + "\n"
    			+ "shipping_phone: " + shipping_phone + "\n"
    			+ "shippingAddr1: " + shippingAddr1 + "\n"
    			+ "shippingAddr2: " + shippingAddr2 + "\n"
    			+ "shippingAddr3: " + shippingAddr3 + "\n"
    			+ "shippingOption1: " + shippingOption1 + "\n"
    			+ "shippingOption2: " + shippingOption2;
        return txt;
    }
    
	public int getShipping_id() {
		return shipping_id;
	}
	public void setShipping_id(int shipping_id) {
		this.shipping_id = shipping_id;
	}
	public long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	public String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(String shipping_name) {
		this.shipping_name = shipping_name;
	}
	public String getShipping_phone() {
		return shipping_phone;
	}
	public void setShipping_phone(String shipping_phone) {
		this.shipping_phone = shipping_phone;
	}
	public String getShippingAddr1() {
		return shippingAddr1;
	}
	public void setShippingAddr1(String shippingAddr1) {
		this.shippingAddr1 = shippingAddr1;
	}
	public String getShippingAddr2() {
		return shippingAddr2;
	}
	public void setShippingAddr2(String shippingAddr2) {
		this.shippingAddr2 = shippingAddr2;
	}
	public String getShippingAddr3() {
		return shippingAddr3;
	}
	public void setShippingAddr3(String shippingAddr3) {
		this.shippingAddr3 = shippingAddr3;
	}
	public String getShippingOption1() {
		return shippingOption1;
	}
	public void setShippingOption1(String shippingOption1) {
		this.shippingOption1 = shippingOption1;
	}
	public String getShippingOption2() {
		return shippingOption2;
	}
	public void setShippingOption2(String shippingOption2) {
		this.shippingOption2 = shippingOption2;
	}
    
    

}