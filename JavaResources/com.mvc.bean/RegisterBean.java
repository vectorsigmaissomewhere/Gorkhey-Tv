package com.mvc.bean;

public class RegisterBean {

 private String fullName;
 private String email;
 private String userName;
 private String password;
 private String phonenumber;
 private String city;
 private String state;
 private String country;
 
 public String getUserName() {
 return userName;
 }
 public void setUserName(String userName) {
 this.userName = userName;
 }
 public String getPassword() {
 return password;
 }
 public void setPassword(String password) {
 this.password = password;
 }
 public void setFullName(String fullName) {
 this.fullName = fullName;
 }
 public String getFullName() {
 return fullName;
 }
 public void setEmail(String email) {
 this.email = email;
 }
 public String getEmail() {
 return email;
 }
 
 public String getPhoneNumber() {
	 return phonenumber;
}
 
 public void setPhoneNumber(String phonenumber) {
	 this.phonenumber = phonenumber;
 }

 public String getCity() {
	 return city;
 }
 
 public void setCity(String city) {
	 this.city = city;
 }
 
 public String getState(){
	 return state;
 }
 
 public void setState(String state) {
	 this.state = state;
 }
 
 public String getCountry() {
	 return country;
 }
 
 public void setCountry(String country) {
	 this.country = country;
 }

}
