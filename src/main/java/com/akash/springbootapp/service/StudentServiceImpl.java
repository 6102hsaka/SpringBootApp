package com.akash.springbootapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akash.springbootapp.dao.StudentDao;
import com.akash.springbootapp.model.CountryEntity;
import com.akash.springbootapp.model.Student;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;

	@Override
	public Student validateLoginCredential(String id, String pass) {
		return studentDao.validate(id, pass);
	}

	@Override
	public boolean insert(Student student) {
		return studentDao.insert(student);
	}

	@Override
	public List<Object> getCountries() {
		return studentDao.getCountries();
	}

	@Override
	public CountryEntity getCountryById(int id) {
		return studentDao.getCountryById(id);
	}

	@Override
	public List<Object> getStates(int countryId) {
		return studentDao.getStates(countryId);
	}

	@Override
	public List<Object> getCities(int stateId) {
		return studentDao.getCities(stateId);
	}

}
