package com.entity;


import java.io.InputStream;

public class EditProducts {
	private String pname;
	private String pdesc;
	private int pprice;
	private int status;
	


	private int pid;
	public EditProducts(String pname,String pdesc,int pprice,int pid, int status) {
		super();
		this.pid=pid;
		this.pname=pname;
		this.pdesc=pdesc;
		this.pprice=pprice;
		this.status=status;
	
		
		
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}


}
