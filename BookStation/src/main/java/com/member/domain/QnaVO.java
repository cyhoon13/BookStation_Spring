package com.member.domain;

import java.sql.Date;

public class QnaVO {

	private int qna_id;
	private String member_id;
	private Date qna_date;
	private int qna_type;
	private String qna_title;
	private String qna_content;
	private String qna_state;
	
    @Override
    public String toString() {
    	String txt = "qna_id: " + qna_id + "\n"
    			+ "member_id" + member_id + "\n"
    			+ "qna_date: " + qna_date + "\n"
    			+ "qna_type: " + qna_type + "\n"
    			+ "qna_title: " + qna_title + "\n"
    			+ "qna_content: " + qna_content + "\n"
    			+ "qna_state: " + qna_state;
        return txt;
    }
	
	public int getQna_id() {
		System.out.println("getQna_id "+qna_id);
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
		System.out.println("setQna_id "+qna_id);
	}
	public String getMember_id() {
		System.out.println("getMember_id "+member_id);
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
		System.out.println("setMember_id "+member_id);
	}
	public Date getQna_date() {
		System.out.println("getQna_date "+qna_date);
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
		System.out.println("setQna_date "+qna_date);
	}
	public int getQna_type() {
		System.out.println("getQna_type "+qna_type);
		return qna_type;
	}
	public void setQna_type(int qna_type) {
		this.qna_type = qna_type;
		System.out.println("setQna_type "+qna_type);
	}
	public String getQna_title() {
		System.out.println("getQna_title "+qna_title);
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
		System.out.println("setQna_title "+qna_title);
	}
	public String getQna_content() {
		System.out.println("getQna_content "+qna_content);
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
		System.out.println("setQna_content "+qna_content);
	}
	
	public String getQna_state() {
		System.out.println("setQna_state "+qna_state);
		return qna_state;
	}
	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
		System.out.println("getQna_state "+qna_state);
	}
}
