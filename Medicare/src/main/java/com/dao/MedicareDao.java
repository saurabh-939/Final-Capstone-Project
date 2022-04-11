package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.AdminLogin;
import com.entity.ChangePwd;
import com.entity.EditProducts;
import com.entity.PaymentGetway;
import com.entity.Products;
import com.entity.RegisterUser;
import com.entity.UserLogin;

public class MedicareDao {
	
	private Connection con;
	public MedicareDao(Connection con) {
		super();
		this.con=con;
	}
	 public boolean userLogin(UserLogin ul) {
		 boolean f=false;

		try {
			 String sql="select email,password from user where email=? and password= ?";
			 PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,ul.getEmail());
			 ps.setString(2,ul.getPassword());
			 ResultSet result=ps.executeQuery();
			f= result.next();
			 if(result.getRow()==1) {
				f=true;
			 }
			
		}catch(Exception e) {
			 e.printStackTrace();
		}
		return f;

		 
	 }
	 
	 public boolean adminLogin(AdminLogin al) {
		 boolean f=false;

		try {
			 String sql="select email,password from admin where email=? and password= ?";
			 PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,al.getEmail());
			 ps.setString(2,al.getPassword());
			 ResultSet result=ps.executeQuery();
			f= result.next();
			 if(result.getRow()==1) {
				f=true;
			 }
			
		}catch(Exception e) {
			 e.printStackTrace();
		}
		return f;

		 
	 }
	 
	 
	 public boolean addProducts(Products p) {
		 boolean f=false;
		 try {
			 String sql="insert into products(pname,pdesc,pprice,status,img)values(?,?,?,?,?)";
			 PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,p.getPname());
			 ps.setString(2,p.getPdesc());
			 ps.setString(3,p.getPprice());
			 ps.setString(4,p.getStatus());
			 ps.setString(5,p.getImg());
			
			 int result=ps.executeUpdate();
			 if(result==1) {
				 f=true;
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return f;
	 }
	 
	 public boolean updateProducts(EditProducts p) {
		 boolean f=false;

		try {
			 String sql="UPDATE products SET pname=? ,pdesc=?,pprice=?,status=? WHERE pid=?";
			 
			 PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,p.getPname());
			 ps.setString(2,p.getPdesc());
			 ps.setInt(3,p.getPprice());
			 ps.setInt(4,p.getStatus());
			 ps.setInt(5,p.getPid());
			int result=ps.executeUpdate();
		
			 if(result==1) {
				f=true;
			 }
			
		}catch(Exception e) {
			 e.printStackTrace();
		}
		return f;

		 
	 }
	 
	 public boolean changePwd(ChangePwd p) {
		 boolean f=false;

		try {
			 String sql="UPDATE admin SET password=?  WHERE id=1";
			 
			 PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,p.getPassword());
			 
			int result=ps.executeUpdate();
		
			 if(result==1) {
				f=true;
			 }
			
		}catch(Exception e) {
			 e.printStackTrace();
		}
		return f;

		 
	 }
	 
	 public boolean addUser(RegisterUser ru) {
		 boolean f=false;
		 try {
			 String sql="insert into user(email,password)values(?,?)";
			 PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,ru.getEmail());
			 ps.setString(2,ru.getPassword());
			
			 int result=ps.executeUpdate();
			 if(result==1) {
				 f=true;
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return f;
	 }
	 
	 public boolean pay(PaymentGetway p) {
		 boolean f=false;
		 try {
			 String sql="insert into buyproducts(pname,pprice)values(?,?)";
			 PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,p.getPname());
			 ps.setInt(2,p.getPprice());
			
			 int result=ps.executeUpdate();
			 if(result==1) {
				 f=true;
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return f;
	 }

}
