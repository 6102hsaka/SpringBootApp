package com.akash.springbootapp.model;

import java.io.Serializable;

public class CountryEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;

	public CountryEntity() {
		
	}
	
	public CountryEntity(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CountryEntity [id=" + id + ", name=" + name + "]";
	}

}
