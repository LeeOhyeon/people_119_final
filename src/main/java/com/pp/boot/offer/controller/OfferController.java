package com.pp.boot.offer.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pp.boot.common.PageFactory;
import com.pp.boot.offer.model.service.OfferService;
import com.pp.boot.offer.model.vo.Offer;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@EnableScheduling
@RequestMapping("/offer")
public class OfferController {
	
	@Autowired
	private OfferService service;

	// 채용공고 리스트로 화면 전환
	@RequestMapping("/offerList.do")
	public ModelAndView offerList(@RequestParam(value="cPage", defaultValue="1") int cPage, @RequestParam(value="numPerpage", defaultValue="8") int numPerpage, ModelAndView mv) {
		// 조회수가 가장 높은 TOP3 공고 리스트 가져오기
		List<Offer> hotList = service.selectHotOfferList();
		
		// 전체 공고 리스트 불러오기
		List<Offer> list = service.selectOfferList();
		
		// 전체 공고 개수 확인
		int totalData = service.countOfferList();
		
		mv.addObject("totalContents", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage, 5, "offer/offerList.do"));
		
		mv.addObject("hotList", hotList);
		mv.addObject("list", list);
		mv.setViewName("offer/offerList");
		
		return mv;
	}
	
	//메인화면 새로운 공고 리스트
	@RequestMapping("/newOfferList.do")
	@ResponseBody
	public List<Offer> newOfferList() {
		
		// 전체 공고 리스트 불러오기
		List<Offer> list = service.selectOfferList();
		
		return list;
	}
	
	
	// 채용공고 상세보기
	@RequestMapping("/offerView.do")
	public String offerView(@RequestParam int offerNo, Model model) {
		// 공고 조회수 올리기
		int readCount = service.updateReadCount(offerNo);
		
		// 공고 정보 가져오기
		Offer offer = service.selectOffer(offerNo);
		
//		String[] tech = offer.getTech().split(",");
		
		model.addAttribute("offer", offer);
		
		return "offer/offerView";
	}
	
	// 채용공고 등록 페이지로 이동
	@RequestMapping("/enrollOffer.do")
	public String enrollOffer() {
		return "offer/enrollOffer";
	}
	
	// 공고 등록
	@RequestMapping(value="/enrollOfferEnd.do", method=RequestMethod.POST)
	public ModelAndView enrollOfferEnd(Offer o, ModelAndView mv, @RequestParam(value="file1", required=false) MultipartFile file1, HttpServletRequest req) {
		
		
		// 저장경로 설정
		String path = req.getServletContext().getRealPath("/resources/upload/offer/");
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		
		// 공고 이미지 저장
		if(!file1.isEmpty()) {
			try {
				file1.transferTo(new File(path + file1.getOriginalFilename()));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		o.setImage(file1.getOriginalFilename());
		
		String msg = "";
	    String loc = "";
	    try {
	    	int result = service.enrollOffer(o);
	    	msg = "등록성공";
	    	loc = "/offer/offerList.do";
	    }catch(RuntimeException e) {
	    	msg = "등록실패 : " + e.getMessage();
	    	loc = "/offer/enrollOffer.do";
	    }
	    
	    mv.addObject("loc", loc);
	    mv.addObject("msg", msg);
	    mv.setViewName("common/msg");
	    return mv;
	}
	
	// 매일 00시에 실행.
	// endDate가 현재 날짜보다 과거면 STATUS 컬럼 값을 1로 UPDATE
	@Scheduled(cron = "0 0 0 * * *")
	public void updateOfferStatus() {
		int result = service.updateOfferStatus();
	}
	
	//메인화면 채용공고 갯수 
	@RequestMapping("/countOffer.do")
	@ResponseBody
	public int countOffer() {
		int totalData = service.countOfferList();
		return totalData;
	}
	
	
}

















