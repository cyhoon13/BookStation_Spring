package com.member.domain;

public class LoginVO {

	private String member_id;
	private String member_password;
	private int member_point;
	private String grade_name;
	
    @Override
    public String toString() {
    	String txt = "member_id: " + member_id + "\n"
    			+ "member_password: " + member_password + "\n"
    			+ "member_point: " + member_point + "\n"
    			+ "grade_name: " + grade_name;
        return txt;
    }
	
    public String getMember_id() {
		//System.out.println("getMember_id()=>"+member_id);
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = convert(member_id);
		//System.out.println("setMember_id()=>"+member_id);
	}
	public String getMember_password() {
		//System.out.println("getMember_password()=>"+member_password);
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = convert(member_password);
		//System.out.println("setMember_password()=>"+member_password);
	}
	public int getMember_point() {
		//System.out.println("getMember_point()=>"+member_point);
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
		//System.out.println("setMember_point()=>"+member_point);
	}
	public String getGrade_name() {
		//System.out.println("getGrade_name()=>"+grade_name);
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
		//System.out.println("setGrade_name()=>"+grade_name);
	}
	
	//이 클래스에서만 사용하기위해서 접근지정자 private <,>,(,)=>변경메서드
	private static String convert(String name) {
		if(name!=null){
			   //2.입력받은 문자열중에서 자바스크립트 구문을 실행시킬수 있는 특수기호를 입력X(<,>)
			   //문자열메서드->replaceAll(1.변경전문자열,2.변경후 문자열)
			   name=name.replaceAll("<","&lt");
			   name=name.replaceAll(">","&gt");
			   name=name.replaceAll("&","&amp");
			   //추가 eval(" " or ' ')
			   name=name.replaceAll("\\(","&#40");
			   name=name.replaceAll("\\)","&#41");
			   //"test"  'test'
			   name=name.replaceAll("\"","&quot");
			   name=name.replaceAll("\'","&apos");
		}else{ //name==null
			   return null; //입력을 하지 않았다면 더 이상 실행X
		}
			   return name;
	}
}
