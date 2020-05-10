package com.akash.springbootapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.akash.springbootapp.model.CityEntity;
import com.akash.springbootapp.model.CountryEntity;
import com.akash.springbootapp.model.StateEntity;
import com.akash.springbootapp.model.Student;

@Repository
public class StudentDaoImpl implements StudentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public Student validate(String id, String pass) {
		String sql = "SELECT * FROM student WHERE id=? AND password=?";
		List<Object> students = jdbcTemplate.query(sql, new Object[] { id, pass },
				(rs, rowNum) -> new Student(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
		if (students.size() == 0) {
			return null;
		}
		return (Student) students.get(0);
	}

	@Override
	public boolean insert(Student student) {
		String sql = "INSERT INTO student VALUES(?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(sql, student.getId(), student.getFname(), student.getLname(), student.getAge(),
				student.getGender(), student.getCity(), student.getPass());
		return (row == 1);
	}

	@Override
	public List<Object> getCountries() {
		String sql = "SELECT * FROM country";
		List<Object> countries = jdbcTemplate.query(sql,
				(rs, rowNum) -> new CountryEntity(rs.getInt(1), rs.getString(2)));
		return countries;
	}

	@Override
	public CountryEntity getCountryById(int id) {
		String sql = "SELECT * FROM country WHERE country_id=?";
		List<CountryEntity> countries = jdbcTemplate.query(sql, new Object[] { id },
				(rs, rowNum) -> new CountryEntity(rs.getInt(1), rs.getString(2)));
		return countries.get(0);
	}

	@Override
	public List<Object> getStates(int countryId) {
		String sql = "SELECT state_id,state_name FROM state WHERE state_country_id=?";
		List<Object> states = jdbcTemplate.query(sql, new Object[] { countryId },
				(rs, rowNum) -> new StateEntity(rs.getInt(1), rs.getString(2)));
		return states;
	}

	@Override
	public List<Object> getCities(int stateId) {
		String sql = "SELECT city_id,city_name FROM city WHERE city_state_id=?";
		List<Object> cities = jdbcTemplate.query(sql, new Object[] { stateId },
				(rs, rowNum) -> new CityEntity(rs.getInt(1), rs.getString(2)));
		return cities;
	}
}