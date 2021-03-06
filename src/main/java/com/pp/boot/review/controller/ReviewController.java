package com.pp.boot.review.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
			loc ="/review/companyReview.do?companyName="+cr.getCompanyName();
		}else {
			msg = "등록 실패";
			loc ="/review/enrollCompanyReview.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg"; 
	}
	
	// 기업 리뷰 보기
	@RequestMapping("companyReview.do")
	public String companyReview(@RequestParam String companyName, Model m) {
		log.debug("{}" + companyName);
		
		
		// 조회수 올리기
		int updateCount = companyService.updateCompanyCount(companyName);
		
		// 해당 기업의 리뷰 전체 개수 가져오기
		int totalCount = companyService.countCompany(companyName);
		Map percentCounts = null;
		int status = 10;
		
		// 기업리뷰가 있냐 없냐 구분하기
		if(totalCount == 0) {
			status = 1;
		}else if(totalCount > 0) {
			status = 0;
			// 퍼센트 가져오는거
			percentCounts = service.countPercent(companyName);
		}

		// 기업 별 공고 개수 가져오기
		List<Offer> offerCounts = offerService.countOffer();
		
		// 기업 정보 가져오기
		Company c = companyService.selectCompany(companyName);
		log.debug("{reviewController}" + c);
		
		m.addAttribute("totalCount", totalCount);
		m.addAttribute("percentCounts", percentCounts);
		m.addAttribute("offerCounts", offerCounts);
		m.addAttribute("status", status);
		
		m.addAttribute("company", c);
		
		
		return "review/companyReview";
	}
	
	// 회사 중복체크
	@RequestMapping("enrollCheckCompanyName.do")
	public void checkCompanyName(@RequestParam Map param, HttpServletResponse response) throws IOException{
		Company company = service.checkCompanyName(param);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(company!=null?false:true);
	}
	
	
}
