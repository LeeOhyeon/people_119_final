package com.pp.boot.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggerInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		log.debug("------- 전처리 인터셉터 실행!--------");
		log.debug("요청주소 : {}",request.getRequestURI());
		log.debug("------- 전처리 인터셉터 끝!--------");		
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
		//return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 매핑메소드가 실행이 끝난 후 실행되는 로직을 구현
		/*
		 * log.debug("------- 매핑메소드 종료 후 호출 -------");
		 * log.debug("요청주소 :{}",request.getRequestURI());
		 * log.debug("---------- 인터셉터 종료 -----------");
		 */
		
		//super.postHandle(request, response, handler, modelAndView);
	}
	
}
