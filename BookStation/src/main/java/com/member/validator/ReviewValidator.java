package com.member.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.member.domain.ReviewVO;


public class ReviewValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ReviewVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "review_score", "error.required", "별점을 넣어주세요.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "review_content", "error.required", "내용을 입력해주세요.");
	}
}


