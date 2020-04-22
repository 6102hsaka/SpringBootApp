package com.akash.springbootapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akash.springbootapp.dao.StudentDao;
import com.akash.springbootapp.model.Student;

@Service
public class StudentServiceImpl implements StudentService{

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

}
