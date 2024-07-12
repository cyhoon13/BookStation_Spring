package com.member.domain;

import java.sql.Date;

public class DataChangeLogVO {
	private int rnum;
	private String logID;
	private String member_id;
	private Date logTime;
	private String pageID;
	private String pageJsp;
	private String targetTable;
	private String targetColumn;
	private String chngCode;
	private String chngValue;
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
	public String getTargetTable() {
		return targetTable;
	}
	public void setTargetTable(String targetTable) {
		this.targetTable = targetTable;
	}
	public String getTargetColumn() {
		return targetColumn;
	}
	public void setTargetColumn(String targetColumn) {
		this.targetColumn = targetColumn;
	}
	public String getChngCode() {
		return chngCode;
	}
	public void setChngCode(String chngCode) {
		this.chngCode = chngCode;
	}
	public String getChngValue() {
		return chngValue;
	}
	public void setChngValue(String chngValue) {
		this.chngValue = chngValue;
	}
	
}
