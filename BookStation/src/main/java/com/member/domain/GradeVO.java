package com.member.domain;

public class GradeVO {

	private String grade_name;
	private int grade_totalPrice;
	private int grade_plusPoint;
	private int grade_ratePoint;
	
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getGrade_totalPrice() {
		return grade_totalPrice;
	}
	public void setGrade_totalPrice(int grade_totalPrice) {
		this.grade_totalPrice = grade_totalPrice;
	}
	public int getGrade_plusPoint() {
		return grade_plusPoint;
	}
	public void setGrade_plusPoint(int grade_plusPoint) {
		this.grade_plusPoint = grade_plusPoint;
	}
	public int getGrade_ratePoint() {
		return grade_ratePoint;
	}
	public void setGrade_ratePoint(int grade_ratePoint) {
		this.grade_ratePoint = grade_ratePoint;
	}
	
	@Override
	public String toString() {
		return "grade : "+grade_name+" "+grade_totalPrice+" "+grade_plusPoint+" "+grade_ratePoint;
	}
	
}
