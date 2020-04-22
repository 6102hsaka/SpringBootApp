package com.akash.springbootapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.akash.springbootapp.model.Student;


@Repository
public class StudentDaoImpl implements StudentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public Student validate(String id, String pass) {
		String sql = "SELECT * FROM student WHERE id=? AND password=?";
		List<Object> students = jdbcTemplate.query(sql,new Object[] {id,pass}, (rs,rowNum)-> new Student(
				rs.getString(1),rs.getString(2),rs.getString(3),rs.getDouble(4),rs.getString(5),rs.getString(6)));
		if(students.size()==0) {
			return null;
		}
		return (Student)students.get(0);
	}

	@Override
	public boolean insert(Student student) {
		String sql = "INSERT INTO student VALUES(?,?,?,?,?,?)";
		int row = jdbcTemplate.update(sql,student.getId(),student.getFname(),student.getLname(),
				student.getAge(),student.getCity(),student.getPass());
		return (row==1);
	}
}