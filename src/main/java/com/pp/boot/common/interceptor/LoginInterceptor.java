package com.pp.boot.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.pp.boot.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	
		//login여부 확인하기
	
	 log.debug("인터셉터 실행");
	 
	 HttpSession session = request.getSession(); Member loginMember =
	 (Member)session.getAttribute("loginMember"); if(loginMember == null) {
	 request.setAttribute("msg", "로그인 후 이용가능한 서비스 입니다!");
	 request.setAttribute("loc", "/");
	 request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(
	 request, response); return false; }else { return
	 HandlerInterceptor.super.preHandle(request, response, handler); }
	
			
		
	}
	

	
}
