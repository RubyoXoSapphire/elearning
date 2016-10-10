package com.softech.elearning.presentation.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import com.softech.elearning.business.services.UserService;
import com.softech.elearning.data.domain.User;
@Component
public class UserFormatter implements Formatter<User>{
	@Autowired
	UserService userService;
	@Override
	public String print(User user, Locale arg1) {
		// TODO Auto-generated method stub
		return user.getLastName()+" "+user.getFirstName();
	}

	@Override
	public User parse(String userId, Locale arg1) throws ParseException {
		// TODO Auto-generated method stub
		
		return userService.findOne(userId);
	}
	
}
