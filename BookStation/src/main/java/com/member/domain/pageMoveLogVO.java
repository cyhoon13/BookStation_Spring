package com.member.domain;

import java.sql.Date;

public class pageMoveLogVO {
	private int rnum;
	private String logID;
	private String member_id;
	private Date logTime;
	private String pageID;
	private String pageJsp;
	private String pageName;
	
    @Override
    public String toString() {
    	String txt = "logID: " + logID + "\n"
    			+ "member_id: " + member_id + "\n"
    			+ "logTime: " + logTime + "\n"
    			+ "pageID: " + pageID;
        return txt;
    }
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getLogID() {
		return logID;
	}
	public void setLogID(String logID) {
		this.logID = logID;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getLogTime() {
		return logTime;
	}
	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
	public String getPageID() {
		return pageID;
	}
	public void setPageID(String pageID) {
		this.pageID = pageID;
	}
	public String getPageJsp() {
		return pageJsp;
	}
	public void setPageJsp(String pageJsp) {
		this.pageJsp = pageJsp;
	}
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
}
