package com.pp.boot.interview.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pp.boot.common.PageFactory;
import com.pp.boot.interview.model.service.InterviewService;
import com.pp.boot.interview.model.vo.InterviewCareer;
import com.pp.boot.interview.model.vo.InterviewReview;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/interview")
@Slf4j
public class InterviewController {
	
	@Autowired
	private InterviewCareer ic;
	
	@Autowired 
	private InterviewReview i;
	
	@Autowired
	private InterviewService service;
	
	@RequestMapping("/interviewList.do")
	public ModelAndView interviewList(ModelAndView mv, @RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage", defaultValue="10")int numPerpage) {
		
		Map<String,Integer> pageParam=Map.of("cPage",cPage,"numPerpage",numPerpage);
		
		List<InterviewReview> list=service.interviewList(pageParam);
		int totalCount=service.interviewListCount();
		
		
		mv.addObject("list",list);
		mv.addObject("pageBar",PageFactory.getPageBar(totalCount, cPage, numPerpage, 5, "interviewList.do"));
		mv.addObject("totalCount",totalCount);
		mv.setViewName("interview/interviewList");
		return mv;
	}
	@RequestMapping("/interviewEnrollView.do")
	public ModelAndView interviewEnrollView(ModelAndView mv,@RequestParam String memberId) {
		
		
		List<InterviewCareer> list=service.careerList(memberId);
		
		
		mv.addObject("list",list);
		mv.setViewName("interview/interviewEnroll");
		return mv;
	}
	
	 @RequestMapping("/interviewEnroll.do") 
	 public String interviewEnroll(InterviewReview i,Model model) {
		
		 int result=service.interviewEnroll(i);
		 String msg = "";
		 String loc = "";
		 if(result>0) {
			 msg ="면접후기 등록이 완료되었습니다.";
			  loc ="selectInterview.do?interviewReviewNo="+result;	 
		 }
		 
		 model.addAttribute("msg",msg);
		 model.addAttribute("loc",loc);
		 
		 return "common/msg"; 
	 }
	 @RequestMapping("/selectInterview.do")
	 public ModelAndView selectInterview(ModelAndView mv, @RequestParam int interviewReviewNo) {
		 
		 InterviewReview ir=service.selectInterview(interviewReviewNo);
		
		 mv.addObject("ir",ir);
		 mv.setViewName("interview/selectInterview");
		 return mv;
	 }
	 @RequestMapping("/deleteInterview.do")
	 @ResponseBody
	 public int deleteInterview(@RequestParam int interviewReviewNo) {
		 
		 int count=service.deleteInterview(interviewReviewNo);
		 
		 return count;
	 }
	 @RequestMapping("/updateInterviewView.do")
	 public ModelAndView updateInterviewView(ModelAndView mv,@RequestParam String memberId, @RequestParam int interviewReviewNo) {
		 
		 
		 List<InterviewCareer> list=service.careerList(memberId);
			
			
		 mv.addObject("list",list);
		 mv.setViewName("interview/updateInterviewView");
		 
		 return mv;
	 }
	 @RequestMapping("/interviewUpdate.do")
	 public String interviewUpdate(InterviewReview ir,Model model) {
		 
		 int result=service.interviewUpdate(ir);
		 String msg = "";
		 String loc = "";
		 if(result>0) {
			 msg ="면접후기 수정이 완료되었습니다";
			  loc ="selectInterview.do?interviewReviewNo="+result;	 
		 }
		 
		 model.addAttribute("msg",msg);
		 model.addAttribute("loc",loc);
		 
		 
		 return "common/msg"; 
	 }
}
