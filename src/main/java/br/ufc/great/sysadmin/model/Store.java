package br.ufc.great.sysadmin.model;

import javax.persistence.Entity;

@Entity
public class Store extends AbstractModel<Long>{
	private static final long serialVersionUID = 1L;
	private String name;
	private String address;
	private String city;
	private String state;
	private double latitude;
	private double longitude;
	private double radius;

	public Store() {
	}
	
	public Store(String name, String address, String city, String state) {
		super();
		this.name = name;
		this.address = address;
		this.city = city;
		this.state = state;
	}
	
	public Long getId() {
		return super.getId();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public double getRadius() {
		return radius;
	}

	public void setRadius(double radius) {
		this.radius = radius;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
		
}