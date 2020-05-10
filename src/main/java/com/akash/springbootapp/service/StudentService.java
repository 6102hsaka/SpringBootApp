package com.akash.springbootapp.service;

import java.util.List;

import com.akash.springbootapp.model.CountryEntity;
import com.akash.springbootapp.model.Student;

public interface StudentService {
	
	public Student validateLoginCredential(String id,String pass);
	public boolean insert(Student student);
	
	public List<Object> getCountries();
	public CountryEntity getCountryById(int id);
	public List<Object> getStates(int countryId);
	public List<Object> getCities(int stateId);
}
