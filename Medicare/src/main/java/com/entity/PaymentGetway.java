package com.entity;

public class PaymentGetway {
	private String pname;
	private int pprice;

	public PaymentGetway(String pname,int pprice) {
		super();
		this.pname=pname;
		this.pprice=pprice;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	
}
