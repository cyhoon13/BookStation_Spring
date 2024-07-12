package com.member.domain;

import java.util.Date;

public class OrderVO {
    private long order_id; // 주문번호
    private String member_id; // 아이디
    private int shipping_id; // 배송번호
    private String shipping_name; // 주문자
    private String shipping_phone; // 전화번호
    private String shippingAddr1; // 우편번호
    private String shippingAddr2; // 도로명주소
    private String shippingAddr3; // 상세주소
    private String shippingOption1; // 배송방법
    private String shippingOption2; // 요청사항
    private String payOption1; // 결제옵션
    private String payOption2; // 결제수단(카드)
    private String payOption3; // 결제수단(무통장)
    private Date orderDate; // 주문날짜
    private int savePoint; // 적립포인트
    private int usePoint; // 사용한 포인트
    private int totalPrice; // 총 주문금액
    private String orderState; // 주문상태

    @Override
    public String toString() {
    	String txt = "order_id: " + order_id + "\n"
    			+ "member_id: " + member_id + "\n"
    			+ "orderDate: " + orderDate + "\n"
    			+ "payOption1: " + payOption1 + "\n"
    			+ "payOption2: " + payOption2 + "\n"
    			+ "payOption3: " + payOption3 + "\n"
    			+ "savePoint: " + savePoint + "\n"
    			+ "usePoint: " + usePoint + "\n"
    			+ "totalPrice: " + totalPrice + "\n"
    			+ "orderState: " + orderState;
        return txt;
    }
    
    public long getOrder_id() {
        System.out.println("getOrder_id() => " + order_id);
        return order_id;
    }

    public void setOrder_id(long order_id) {
        System.out.println("setOrder_id => " + order_id);
        this.order_id = order_id;
    }

    public String getMember_id() {
        System.out.println("getMember_id() => " + member_id);
        return member_id;
    }

    public void setMember_id(String member_id) {
        System.out.println("setMember_id => " + member_id);
        this.member_id = member_id;
    }

    public int getShipping_id() {
        System.out.println("getShipping_id() => " + shipping_id);
        return shipping_id;
    }

    public void setShipping_id(int shipping_id) {
        System.out.println("setShipping_id => " + shipping_id);
        this.shipping_id = shipping_id;
    }

    public String getShipping_name() {
        System.out.println("getShipping_name() => " + shipping_name);
        return shipping_name;
    }

    public void setShipping_name(String shipping_name) {
        System.out.println("setShipping_name => " + shipping_name);
        this.shipping_name = shipping_name;
    }

    public String getShipping_phone() {
        System.out.println("getShipping_phone() => " + shipping_phone);
        return shipping_phone;
    }

    public void setShipping_phone(String shipping_phone) {
        System.out.println("setShipping_phone => " + shipping_phone);
        this.shipping_phone = shipping_phone;
    }

    public String getShippingAddr1() {
        System.out.println("getShippingAddr1() => " + shippingAddr1);
        return shippingAddr1;
    }

    public void setShippingAddr1(String shippingAddr1) {
        System.out.println("setShippingAddr1 => " + shippingAddr1);
        this.shippingAddr1 = shippingAddr1;
    }

    public String getShippingAddr2() {
        System.out.println("getShippingAddr2() => " + shippingAddr2);
        return shippingAddr2;
    }

    public void setShippingAddr2(String shippingAddr2) {
        System.out.println("setShippingAddr2 => " + shippingAddr2);
        this.shippingAddr2 = shippingAddr2;
    }

    public String getShippingAddr3() {
        System.out.println("getShippingAddr3() => " + shippingAddr3);
        return shippingAddr3;
    }

    public void setShippingAddr3(String shippingAddr3) {
        System.out.println("setShippingAddr3 => " + shippingAddr3);
        this.shippingAddr3 = shippingAddr3;
    }

    public String getShippingOption1() {
        System.out.println("getShippingOption1() => " + shippingOption1);
        return shippingOption1;
    }

    public void setShippingOption1(String shippingOption1) {
        System.out.println("setShippingOption1 => " + shippingOption1);
        this.shippingOption1 = shippingOption1;
    }

    public String getShippingOption2() {
        System.out.println("getShippingOption2() => " + shippingOption2);
        return shippingOption2;
    }

    public void setShippingOption2(String shippingOption2) {
        System.out.println("setShippingOption2 => " + shippingOption2);
        this.shippingOption2 = shippingOption2;
    }

    public String getPayOption1() {
        System.out.println("getPayOption1() => " + payOption1);
        return payOption1;
    }

    public void setPayOption1(String payOption1) {
        System.out.println("setPayOption1 => " + payOption1);
        this.payOption1 = payOption1;
    }

    public String getPayOption2() {
        System.out.println("getPayOption2() => " + payOption2);
        return payOption2;
    }

    public void setPayOption2(String payOption2) {
        System.out.println("setPayOption2 => " + payOption2);
        this.payOption2 = payOption2;
    }

    public String getPayOption3() {
        System.out.println("getPayOption3() => " + payOption3);
        return payOption3;
    }

    public void setPayOption3(String payOption3) {
        System.out.println("setPayOption3 => " + payOption3);
        this.payOption3 = payOption3;
    }

    public Date getOrderDate() {
        System.out.println("getOrderDate() => " + orderDate);
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        System.out.println("setOrderDate => " + orderDate);
        this.orderDate = orderDate;
    }

    public int getSavePoint() {
        System.out.println("getSavePoint() => " + savePoint);
        return savePoint;
    }

    public void setSavePoint(int savePoint) {
        System.out.println("setSavePoint => " + savePoint);
        this.savePoint = savePoint;
    }

    public int getUsePoint() {
        System.out.println("getUsePoint() => " + usePoint);
        return usePoint;
    }

    public void setUsePoint(int usePoint) {
        System.out.println("setUsePoint => " + usePoint);
        this.usePoint = usePoint;
    }

    public int getTotalPrice() {
        System.out.println("getTotalPrice() => " + totalPrice);
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        System.out.println("setTotalPrice => " + totalPrice);
        this.totalPrice = totalPrice;
    }

    public String getOrderState() {
        System.out.println("getOrderState() => " + orderState);
        return orderState;
    }

    public void setOrderState(String orderState) {
        System.out.println("setOrderState => " + orderState);
        this.orderState = orderState;
    }
}
