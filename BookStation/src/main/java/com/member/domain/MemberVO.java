package com.member.domain;

import java.sql.Date;

public class MemberVO {
	
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_gender;
	private String member_email;
	private String member_phone;
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private String member_birthday;
	private int member_point;
	private int member_totalPrice;
	private String grade_name;
	private Date reg_date;
	
	@Override
	public String toString() {	// data 변경 기록용
		String txt = "member_id: " + member_id + "\n"
				+ "member_password: " + member_password + "\n"
				+ "member_name: " + member_name + "\n"
				+ "member_gender: " + member_gender + "\n"
				+ "member_email: " + member_email + "\n"
				+ "member_phone: " + member_phone + "\n"
				+ "member_zipcode: " + member_zipcode + "\n"
				+ "member_address1: " + member_address1 + "\n"
				+ "member_address2: " + member_address2 + "\n"
				+ "member_birthday: " + member_birthday + "\n"
				+ "member_point: " + member_birthday + "\n"
				+ "member_totalPrice: " + member_totalPrice + "\n"
				+ "grade_name: " + grade_name + "\n"
				+ "reg_date: " + reg_date;
		return txt;
	}
	
	public String getMember_id() {
		System.out.println("getUser_id()=>"+member_id);
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
		System.out.println("setMember_id()=>"+member_id);
	}
	public String getMember_password() {
		System.out.println("getMember_password()=>"+member_password);
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
		System.out.println("setMember_password()=>"+member_password);
	}
	public String getMember_name() {
		System.out.println("getMember_name()=>"+member_name);
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
		System.out.println("setMember_name()=>"+member_name);
	}
	public String getMember_gender() {
		System.out.println("getMember_gender()=>"+member_gender);
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
		System.out.println("setMember_gender()=>"+member_gender);
	}
	public String getMember_email() {
		System.out.println("getMember_email()=>"+member_email);
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
		System.out.println("setMember_email()=>"+member_email);
	}
	public String getMember_phone() {
		System.out.println("getMember_phone()=>"+member_phone);
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
		System.out.println("setMember_phone()=>"+member_phone);
	}
	public String getMember_zipcode() {
		System.out.println("getMember_zipcode()=>"+member_zipcode);
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
		System.out.println("setMember_zipcode()=>"+member_zipcode);
	}
	public String getMember_address1() {
		System.out.println("getMember_address1()=>"+member_address1);
		return member_address1;
	}
	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
		System.out.println("setMember_address1()=>"+member_address1);
	}
	public String getMember_address2() {
		System.out.println("getMember_address2()=>"+member_address2);
		return member_address2;
	}
	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
		System.out.println("setMember_address2()=>"+member_address2);
	}
	public String getMember_birthday() {
		System.out.println("getMember_birthday()=>"+member_birthday);
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
		System.out.println("setMember_birthday()=>"+member_birthday);
	}
	public int getMember_point() {
		System.out.println("getMember_point()=>"+member_point);
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
		System.out.println("setMember_point()=>"+member_point);
	}
	public int getMember_totalPrice() {
		System.out.println("getMember_totalPrice()=>"+member_totalPrice);
		return member_totalPrice;
	}
	public void setMember_totalPrice(int member_totalPrice) {
		this.member_totalPrice = member_totalPrice;
		System.out.println("setMember_totalPrice()=>"+member_totalPrice);
	}
	public String getGrade_name() {
		System.out.println("getGrade_name()=>"+grade_name);
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
		System.out.println("setGrade_name()=>"+grade_name);
	}
	public Date getReg_date() {
		System.out.println("getReg_date()=>"+reg_date);
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
		System.out.println("setReg_date()=>"+reg_date);
	}
	
    
	
}
