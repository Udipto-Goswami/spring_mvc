package com.telusko.projectHeades;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name="User_Details")//mind it! keep this same are class name
public class User_Details {
   @Id
    private int id;
	private String fullname;
    private int age;
    private String gender;
    private String current_address;
    private String permanent_address;
    
    
	public int getId() {
	return id;
	}
	public void setId(int id) {
	this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCurrent_address() {
		return current_address;
	}
	public void setCurrent_address(String current_address) {
		this.current_address = current_address;
	}
	public String getPermanent_address() {
		return permanent_address;
	}
	public void setPermanent_address(String permanent_address) {
		this.permanent_address = permanent_address;
	}
    
}
