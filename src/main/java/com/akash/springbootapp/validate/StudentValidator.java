package com.akash.springbootapp.validate;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.akash.springbootapp.model.Student;

public class StudentValidator implements Validator {

	private static final Pattern PATTERN = Pattern.compile("((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$]).{8,20})");
	
	@Override
	public boolean supports(Class<?> arg0) {
		return Student.class.equals(arg0);
	}

	@Override
	public void validate(Object object, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "id", "id.empty");
		ValidationUtils.rejectIfEmpty(errors,"fname","fname.empty");
		ValidationUtils.rejectIfEmpty(errors,"lname","lname.empty");
		ValidationUtils.rejectIfEmpty(errors,"age","age.empty");
		ValidationUtils.rejectIfEmpty(errors,"city","city.empty");
		ValidationUtils.rejectIfEmpty(errors,"pass","pass.empty");
		ValidationUtils.rejectIfEmpty(errors,"confirmPass","confirmPass.empty");
				
		Student student = (Student)object;
		
		if(student.getPass()!=null && !PATTERN.matcher(student.getPass()).matches()) {
			errors.rejectValue("pass", "pass.invalid");
		}
	}

}
