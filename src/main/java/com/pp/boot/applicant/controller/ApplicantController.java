package com.pp.boot.applicant.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pp.boot.applicant.model.service.ApplicantService;
import com.pp.boot.applicant.model.vo.Applicant;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/applicant")
@Slf4j
public class ApplicantController {

	@Autowired
	private ApplicantService service;
	
	// 지원하고 나서 지원내역 화면 전환
	@RequestMapping("/apply.do")
	public String apply(@RequestParam Map param, Model model, String memberId) {
		int result = service.apply(param);
		
		int total = service.countApply(memberId);
		
		List<Applicant> list = service.selectApplyList(memberId);
		
		model.addAttribute("applyList", list);
		model.addAttribute("total", total);
		
		return "applicant/applyList";
	}
	
	// 그냥 지원내역 전환
	@RequestMapping("/applyList.do")
	public String applyList(@RequestParam String memberId, Model model) {
		List<Applicant> list = service.selectApplyList(memberId);
		
		int total = service.countApply(memberId);
		
		model.addAttribute("applyList", list);
		model.addAttribute("total", total);
		
		return "applicant/applyList";
	}
	
	// 지원 취소 -> 취소하고 다시 리스트 보여줘야지 ㅋㅋ 
	@RequestMapping("/deleteApply.do")
	public String deleteApply(@RequestParam Map param, Model model, @RequestParam String memberId) {
		log.debug("{}" + param);
		int result = service.deleteApply(param);
		
		List<Applicant> list = service.selectApplyList(memberId);
		int total = service.countApply(memberId);
		
		model.addAttribute("applyList", list);
		model.addAttribute("total", total);
		
		return "applicant/applyList";
	}
	
	
}
