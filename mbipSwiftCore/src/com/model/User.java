package com.model;

public class User {
		
		
		String username;
		String email;
		String password;
		String address;
		String state;
		String postcode;
		String noResidents;
		String buildingType;
		String userType;
		String phoneNumber;
		
		public String getPhoneNumber() {
			return phoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getPostcode() {
			return postcode;
		}
		public void setPostcode(String postcode) {
			this.postcode = postcode;
		}
		public String getNoResidents() {
			return noResidents;
		}
		public void setNoResidents(String noResidents) {
			this.noResidents = noResidents;
		}
		public String getBuildingType() {
			return buildingType;
		}
		public void setBuildingType(String buildingType) {
			this.buildingType = buildingType;
		}
		public String getUserType() {
			return userType;
		}
		public void setUserType(String userType) {
			this.userType = userType;
		}
		
		public User(String username, String email, String password, String address, String state, String postcode,
				String noResidents, String buildingType, String userType, String phoneNumber) {
			super();
			this.username = username;
			this.email = email;
			this.password = password;
			this.address = address;
			this.state = state;
			this.postcode = postcode;
			this.noResidents = noResidents;
			this.buildingType = buildingType;
			this.userType = userType;
			this.phoneNumber = phoneNumber;
		}
		
		public User()
		{
			
		}
}
