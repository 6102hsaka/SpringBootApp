package com.akash.springbootapp.dao;

import com.akash.springbootapp.model.Student;

public interface StudentDao {
	
	public Student validate(String id,String pass);
	public boolean insert(Student student);
}
