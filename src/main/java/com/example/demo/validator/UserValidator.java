package com.example.demo.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty","This field is required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phonenumber", "NotEmpty","This field is required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty","This field is required");
        if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size","Please use valid emial id");
        }
        if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate","Duplicate Email Id.");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size","password lenght should be minimum 8 characters.");
        }

        if (!user.getConfirmpassword().equals(user.getPassword())) {
            errors.rejectValue("confirmpassword", "Diff","Passwords didnt matched");
        }
    }
}