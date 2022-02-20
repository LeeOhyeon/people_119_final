package com.pp.boot.review.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pp.boot.company.model.service.CompanyService;
import com.pp.boot.company.model.vo.Company;
import com.pp.boot.offer.model.service.OfferService;
import com.pp.boot.offer.model.vo.Offer;
import com.pp.boot.review.model.service.ReviewService;
import com.pp.boot.review.model.vo.CompanyReview;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/review")
@Slf4j
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private OfferService offerService;

	
	// 기업 리뷰 작성하기 화면 전환
	@RequestMapping("/enrollCompanyReview.do")
	public String enrollCompanyReview(Model m) {
		List<Company> list = service.selectCompanyList();
		
		m.addAttribute("companyList", list);
		
		return "review/enrollCompanyReview";
	}
	
	// 기업 리뷰 등록
	@RequestMapping("enrollCompanyReviewEnd.do")
	public String enrollCompanyReviewEnd(CompanyReview cr,Model model) {
		int result = service.insertCompanyReview(cr);
		
		String msg = "";
		String loc ="";
		if(result>0) {
			msg = "등록 성공";
			loc ="companyReview.do?companyName="+cr.getCompanyName();
		}else {
			msg = "등록 실패";
			loc ="companyList.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg"; 
	}
	
	// 기업 리뷰 보기
	@RequestMapping("companyReview.do")
	public String companyReview(@RequestParam String companyName, Model m) {
		// 조회수 올리기
		int updateCount = companyService.updateCompanyCount(companyName);
		
		// 해당 기업의 리뷰 전체 개수 가져오기
		int totalCount = companyService.countCompany(companyName);
		
		// 퍼센트 계산하기
		Map percentCounts = service.countPercent(companyName);

		// 기업 별 공고 개수 가져오기
		List<Offer> offerCounts = offerService.countOffer();
		
		// 기업 정보 가져오기
		Company c = companyService.selectCompany(companyName);
		
		m.addAttribute("totalCount", totalCount);
		m.addAttribute("percentCounts", percentCounts);
		m.addAttribute("offerCounts", offerCounts);
		
		m.addAttribute("company", c);
		
		
		return "review/companyReview";
	}
	
	
}
