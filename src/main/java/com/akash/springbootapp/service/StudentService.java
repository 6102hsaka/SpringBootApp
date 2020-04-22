package com.akash.springbootapp.service;

import com.akash.springbootapp.model.Student;

public interface StudentService {
	
	public Student validateLoginCredential(String id,String pass);
	public boolean insert(Student student);
}
