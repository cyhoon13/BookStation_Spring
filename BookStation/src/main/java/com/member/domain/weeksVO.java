package com.member.domain;

import java.sql.Date;

public class weeksVO {
	private Date week_start;
	private Date week_end;
	private String thisyear;
	private String thismonth;
	private String week_of_month;
	
	public Date getWeek_start() {
		return week_start;
	}
	public void setWeek_start(Date week_start) {
		this.week_start = week_start;
	}
	public Date getWeek_end() {
		return week_end;
	}
	public void setWeek_end(Date week_end) {
		this.week_end = week_end;
	}
	public String getThisyear() {
		return thisyear;
	}
	public void setThisyear(String thisyear) {
		this.thisyear = thisyear;
	}
	public String getThismonth() {
		return thismonth;
	}
	public void setThismonth(String thismonth) {
		this.thismonth = thismonth;
	}
	public String getWeek_of_month() {
		return week_of_month;
	}
	public void setWeek_of_month(String week_of_month) {
		this.week_of_month = week_of_month;
	}
	

	
}
