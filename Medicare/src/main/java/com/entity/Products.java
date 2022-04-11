package com.entity;

import java.io.InputStream;

public class Products {
	private String pname;
	private String pdesc;
	private String pprice;
	private String status;
	private String img;

	public Products(String pname,String pdesc,String pprice,String status,String img ) {
		super();
		
		this.pname=pname;
		this.pdesc=pdesc;
		this.pprice=pprice;
		this.status=status;
		this.img=img;
		
		
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
