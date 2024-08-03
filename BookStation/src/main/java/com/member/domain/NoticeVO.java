package com.member.domain;

import java.sql.Date;

public class NoticeVO {

	private int notice_id;
	private String notice_writer;
	private Date notice_date;
	private String notice_title;
	private String notice_content;
	private long notice_views;
	
	public int getNotice_id() {
		System.out.println("getNotice_id "+notice_id);
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
		System.out.println("setNotice_id "+notice_id);
	}
	public String getNotice_writer() {
		System.out.println("getNotice_writer "+notice_writer);
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
		System.out.println("setNotice_writer "+notice_writer);
	}
	public Date getNotice_date() {
		System.out.println("getNotice_date "+notice_date);
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
		System.out.println("setNotice_date "+notice_date);
	}
	public String getNotice_title() {
		System.out.println("getNotice_title "+notice_title);
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
		System.out.println("setNotice_title "+notice_title);
	}
	public String getNotice_content() {
		System.out.println("getNotice_content "+notice_content);
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
		System.out.println("setNotice_content "+notice_content);
	}
	
	public long getNotice_views() {
		System.out.println("getNotice_views "+notice_views);
		return notice_views;
	}
	public void setNotice_views(long notice_views) {
		this.notice_views = notice_views;
		System.out.println("setNotice_views "+notice_views);
	}
	@Override
	public String toString() {
		return "notice_id="+notice_id + "notice_writer="+notice_writer + "notice_date="+notice_date
					+"notice_title="+notice_title+"notice_content="+notice_content+"notice_views="+notice_views;
	}
	
	
}
