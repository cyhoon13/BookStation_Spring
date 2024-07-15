package com.member.configurer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.member.interceptor.AuthInterceptor;

@Configuration
@EnableWebMvc
public class WebConfig extends WebMvcConfigurerAdapter{

	@Autowired
	private AuthInterceptor authInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	//	registry.addInterceptor(authInterceptor);
		registry.addInterceptor(authInterceptor)
				.addPathPatterns("/**")
				.excludePathPatterns("/memberFind.do","/logout.do","/mailCheck.do","/mailCheck2.do","/checkId.do",
									"/main.do","/login.do","/idSearch.do","/pwChange.do","/register.do","/updatePassword.do",
									"/registerSuccess.do","/customerService.do","/faq.do","/detail.do","/bestseller.do",
									"/category.do","/categoryDetail.do","/newbook.do","/searchbook.do","/notice.do",
									"/css/**","/fonts/**","/images/**","/js/**", "/scss/**","/vendor/**");
	}
}
