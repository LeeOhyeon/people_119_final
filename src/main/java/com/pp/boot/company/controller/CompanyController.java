package com.pp.boot.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pp.boot.company.model.service.CompanyService;
import com.pp.boot.company.model.vo.Company;
import com.pp.boot.offer.model.service.OfferService;
import com.pp.boot.offer.model.vo.Offer;

import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes({"loginCompany"})
@Slf4j
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService service;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private OfferService offerService;
	
	@RequestMapping("/companyLoginView.do")
	public String companyLoginView() {
		return "company/companyLogin";
	}
	
	
	@RequestMapping("/companyLogin.do")
	public String loginCompany(@RequestParam Map param,Model model) {
		Company loginCompany = service.loginCompany(param);
		
		String msg = "";
		String loc ="";	
		if(loginCompany != null && encoder.matches((String)param.get("password"),loginCompany.getPassword())) {
			model.addAttribute("loginCompany",loginCompany);
			msg = "로그인 성공";
			loc = "/company/companyIndex.do";
		
		}else {
			msg = "로그인 실패. 아이디 혹은 비밀번호를 확인하세요.";
			loc = "/company/companyLoginView.do";
		}	
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);		
		
		return "common/msg";
	}
	
	@RequestMapping("/companyLogout.do")
	public String logoutCompany(HttpSession session, SessionStatus status) {
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/enrollCompanyView.do")
	public String enrollCompanyView() {
		return "company/enrollCompany";
	}
	
	@PostMapping("/enrollCompany.do")
	public String enrollCompany(Company company,Model model) {
				
		company.setPassword(encoder.encode(company.getPassword()));
		int result = service.enrollCompany(company);		
		String msg = "";
		String loc ="";		
		if(result>0) {
			msg="회원가입이 완료되었습니다. 로그인 해주세요";
			loc="/";
		}else {
			msg="회원가입 실패";
			loc="enrollCompanyView.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	// 기업 MyPage 이동
	@RequestMapping("/companyMypage.do")
	public String companyMypage(@RequestParam String companyId, Model model) {
		Company loginCompany = service.loginCompany(Map.of("companyId", companyId));
		
		model.addAttribute("loginCompany", loginCompany);
		
		return "company/companyMypage";
	}
	
	// 기업 정보 수정 페이지 전환
	@RequestMapping("/updateCompany.do")
	public String updateCompany() {
		return "company/updateCompany";
	}
	
	// 기업 정보 수정 완료
	@RequestMapping(value="/updateCompanyEnd.do", method=RequestMethod.POST)
	public ModelAndView updateCompanyEnd(Company c, ModelAndView mv, @RequestParam(value="file1", required=false) MultipartFile file1, @RequestParam(value="file2", required=false) MultipartFile file2,HttpServletRequest req) {
		
		// 저장경로 설정
		String path=req.getServletContext().getRealPath("/resources/upload/company/");
		File f=new File(path);
		if(!f.exists()) f.mkdirs();
		
		// 파비콘 저장
		if(!file1.isEmpty()) {
			try {
				file1.transferTo(new File(path + file1.getOriginalFilename()));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		// 이미지파일 저장
		if(!file2.isEmpty()) {
			try {
				file2.transferTo(new File(path + file2.getOriginalFilename()));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		c.setFavicon(file1.getOriginalFilename());
		c.setCompanyImage(file2.getOriginalFilename());
		
		String msg = "";
	    String loc = "";
	    try {
	    	int result = service.updateCompany(c);
	    	msg = "수정성공";
	    	loc = "/company/companyMypage.do?companyId=" + c.getCompanyId();
	    }catch(RuntimeException e) {
	    	msg = "수정실패 : " + e.getMessage();
	    	loc = "/company/updateCompanyEnd.do";
	    }
	    
	    mv.addObject("loc", loc);
	    mv.addObject("msg", msg);
	    mv.setViewName("common/msg");
	    return mv;
	}
	
		// 전체 기업 리스트
		@RequestMapping("/companyList.do")
		public String companyList(Model model) {
			List<Company> list = service.selectCompanyList();
			List<Offer> offerCounts = offerService.countOffer();
			
//			for(int i = 0; i < list.size(); i++) {
//				log.debug("{}" + list.get(i).getCompanyId());
//			}
			
			model.addAttribute("companyList", list);
			model.addAttribute("offerCounts", offerCounts);
			
			return "review/companyList";
		}
		
		// 회사 이름으로 검색하기
		@RequestMapping("searchList.do")
		@ResponseBody
		public List<Company> searchCompanyList(@RequestParam String search) {
//			log.debug("{}" + search);
			List<Company> list = service.selectSearchCompanyList(search);
//			log.debug("{}" + list);
			
			return list;
		}
}




























