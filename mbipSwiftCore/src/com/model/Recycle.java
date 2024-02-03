package com.model;

public class Recycle {
	
	private int id;
    private String noInvoice;
    private Double consumption;
    private String month;
    private Double carbonFootprint;
    private String username;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNoInvoice() {
		return noInvoice;
	}
	public void setNoInvoice(String noInvoice) {
		this.noInvoice = noInvoice;
	}
	public Double getConsumption() {
		return consumption;
	}
	public void setConsumption(Double consumption) {
		this.consumption = consumption;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Double getCarbonFootprint() {
		return carbonFootprint;
	}
	public void setCarbonFootprint(Double carbonFootprint) {
		this.carbonFootprint = carbonFootprint;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
