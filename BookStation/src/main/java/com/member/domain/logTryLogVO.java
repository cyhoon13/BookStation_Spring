package com.member.domain;

import java.sql.Date;

public class logTryLogVO {
	private int rnum;
	private String logID;
	private String member_id;
	private String logTry;
	private Date logTime;
	private String logSeccess;
	private String logFail;
	
    @Override
    public String toString() {
    	String txt = "logID: " + logID + "\n"
    			+ "member_id: " + member_id + "\n"
    			+ "logTry: " + logTry + "\n"
    			+ "logTime: " + logTime + "\n"
    			+ "logSeccess: " + logSeccess + "\n"
    			+ "logFail: " + logFail;
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
	public String getLogTry() {
		return logTry;
	}
	public void setLogTry(String logTry) {
		this.logTry = logTry;
	}
	public Date getLogTime() {
		return logTime;
	}
	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
	public String getLogSeccess() {
		return logSeccess;
	}
	public void setLogSeccess(String logSeccess) {
		this.logSeccess = logSeccess;
	}
	public String getLogFail() {
		return logFail;
	}
	public void setLogFail(String logFail) {
		this.logFail = logFail;
	}
}
