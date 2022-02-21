package com.pp.boot.common.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	
	  @Override public void addInterceptors(InterceptorRegistry registry) {
	  
	  registry.addInterceptor(new LoginInterceptor()) //인터셉터 등록 .addPathPatterns()
	  .addPathPatterns("/member/memberInfoView.do")
	  .addPathPatterns("/resume/memberResumeList.do")
	  .addPathPatterns("/resume/insertResumeView.do")
	  .addPathPatterns("/resume/memberResumeList.do")
	  .addPathPatterns("/applicant/applyList.do")
	  .addPathPatterns("/applicant/apply.do")
	  .addPathPatterns("/board/insertBoard.do")
	  .addPathPatterns("/board/updateBoardView.do")
	  .addPathPatterns("/resume/updateResumeView.do")
	  .addPathPatterns("/applicant/apply.do")
	  .addPathPatterns("/member/insertScrap.do")
	  .addPathPatterns("/member/insertLikeCompany.do")
	  .addPathPatterns("/interview/interviewEnrollView.do")
	  .addPathPatterns("/interview/selectInterview.do")
	  .addPathPatterns("/member/memberScrapList.do")
	  .addPathPatterns("/member/memberlikeCompanyList.do")
	  .addPathPatterns("/applicant/applyList.do");
	  
	  
	  WebMvcConfigurer.super.addInterceptors(registry); }
	 
	 

}
