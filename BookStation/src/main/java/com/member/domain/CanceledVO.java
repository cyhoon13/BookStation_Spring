package com.member.domain;

public class CanceledVO {
	private long order_id;
	private String cancel_reason;
	@Override
	public String toString() {
		String txt = "order_id: " + order_id + "\n"
				+ "cancel_reason: " + cancel_reason;
		return txt;
	}
	
	public long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
}
