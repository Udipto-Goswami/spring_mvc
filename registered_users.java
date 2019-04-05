package com.telusko.projectHeades;
	import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="registered_users")//mind it! keep this same are class name
public class registered_users {
@Id
	private int id;  
	private String username,password;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password = password;
	}
	
	public String toStringAll() {
        return "Id: " + this.id + ", Name: " + this.username + " " + this.password;
    }
	
}
