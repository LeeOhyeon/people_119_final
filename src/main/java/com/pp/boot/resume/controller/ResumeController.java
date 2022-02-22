package com.pp.boot.resume.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pp.boot.common.PageFactoryMember;
import com.pp.boot.member.model.service.MemberService;
import com.pp.boot.member.model.vo.Member;
import com.pp.boot.resume.model.service.ResumeService;
import com.pp.boot.resume.model.vo.Career;
import com.pp.boot.resume.model.vo.Certificate;
import com.pp.boot.resume.model.vo.Language;
import com.pp.boot.resume.model.vo.Resume;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/resume")
@Slf4j
public class ResumeController {

	@Autowired
	private ResumeService resumeService;

	@Autowired
	private MemberService service;

	// 회원 이력서 목록
	@RequestMapping("/memberResumeList.do")
	public ModelAndView memberResumeList(@RequestParam String memberId, ModelAndView mv,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
		@RequestParam(value = "numPerPage", defaultValue = "10") int numPerPage) {

		
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("cPage", cPage);
		param.put("numPerPage", numPerPage);
		
		List<Resume> rList = resumeService.selectResumeList(param);
		int countList = resumeService.selectResumeListCount(memberId);
		
		
		mv.addObject("resumeList",rList);
		mv.addObject("countList",countList);
		mv.setViewName("resume/memberResumeList");
		mv.addObject("pageBar", PageFactoryMember.getPageBar(countList, cPage, numPerPage, 5, "/resume/memberResumeList.do?memberId="+memberId+"&&"));
		return mv;
	}
	
	@Autowired
	private Resume resume;
	
	//이력서 등록 페이지
	@RequestMapping("/insertResumeView.do")
	public ModelAndView insertResumeView(@RequestParam String memberId, ModelAndView mv) {

		Member loginMember = service.loginMember(Map.of("memberId", memberId));
		
		//이력서 생성
		resume.setMemberId(memberId);
		int result = resumeService.insertResume(resume);


		
		mv.addObject("resumeNo",result);
		mv.addObject("loginMember", loginMember);
		mv.setViewName("resume/insertResume");

		return mv;
	}
	
	//회원 이력서 기본 정보 등록
	@RequestMapping("/insertBasicResume.do")
	@ResponseBody
	public void insertBasicResume(Resume resume, @RequestParam(value="upfile", required = false)MultipartFile upfile,HttpServletRequest request ) {
		
		String path = request.getServletContext().getRealPath("/resources/upload/resume/");
		
		File f = new File(path);
		
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(upfile != null) {
			String originalFileName = upfile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmsssss");
			int rndNum = (int) (Math.random() * 1000);
			String renameFile = sdf.format(System.currentTimeMillis()) + "_" + rndNum + ext;
			
			resume.setProfile(renameFile);
			
			try {
				upfile.transferTo(new File(path+renameFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			resume.setProfile(resume.getOriProfile());
		}
		
		resumeService.insertBasicResume(resume);
	}
	//경력 사항 등록
	@RequestMapping("/insertCareer.do")
	@ResponseBody
	public void insertCareer(Career career) {
	 int result =resumeService.insertCareer(career);
	}
	//자격증 등록
	@RequestMapping("/insertCertificate.do")
	@ResponseBody
	public void insertCertificate(Certificate certifi) {
	 int result =resumeService.insertCertificate(certifi);
	}
	
	//외국어 시험 등록
	@RequestMapping("/insertLanguage.do")
	@ResponseBody
	public void insertLanguage(Language lang) {
	 int result =resumeService.insertLanguage(lang);
	}
	//이력서 삭제
	@RequestMapping("/deleteResume.do")
	public String deleteResume(@RequestParam int resumeNo,@RequestParam String memberId,Model model) {
		int result = resumeService.deleteResume(resumeNo);
	 
		String msg ="";
		String loc ="";
		
	 	if(result>0) {
	 		msg ="이력서 삭제가 완료되었습니다.";
	 		loc = "/resume/memberResumeList.do?memberId="+memberId;
	 	}else {
	 		msg ="이력서 삭제 실패.";
	 		loc = "/resume/memberResumeList.do?memberId="+memberId;
	 	}
	 
	 	model.addAttribute("msg",msg);
	 	model.addAttribute("loc",loc);
	 	
	 return "common/msg";
	}
	
	
	
	//이력서 상세보기
	@RequestMapping("/resumeDetailView.do")
	public ModelAndView resumeDetailView(@RequestParam int resumeNo,ModelAndView mv) {
		
		List<Resume> rList = resumeService.selectResumeDetail(resumeNo);
			
		mv.addObject("resume",rList);
		mv.setViewName("resume/resumeDetailView");
		
		return mv;
		
	}
	
	//이력서 수정 페이지
	@RequestMapping("/updateResumeView.do")
	public ModelAndView updateResumeView(@RequestParam int resumeNo,ModelAndView mv) {
		
		List<Resume> rList = resumeService.selectResumeDetail(resumeNo);
			
		mv.addObject("resume",rList);
		mv.setViewName("resume/updateResume");
		
		return mv;
		
	}
	
	//경력사항 수정
		@RequestMapping("/updateCareer.do")
		@ResponseBody
		public void updateCareer(Career career) {
		 int result =resumeService.updateCareer(career);
		}
		
	//경력사항 삭제
		@RequestMapping("/deleteCareer.do")
		@ResponseBody
		public void deleteCareer(@RequestParam int careerNo) {
		 int result =resumeService.deleteCareer(careerNo);
		}	
		
		
	//자격증 수정
		@RequestMapping("/updateCertificate.do")
		@ResponseBody
		public void updateCertificate(Certificate certifi) {
		 int result =resumeService.updateCertificate(certifi);
		}
	//자격증 삭제
		@RequestMapping("/deleteCertificate.do")
		@ResponseBody
		public void deleteCertificate(@RequestParam int certificateNo) {
		 int result =resumeService.deleteCertificate(certificateNo); 
		}
		
	//어학시험 수정
		@RequestMapping("/updateLanguage.do")
		@ResponseBody
		public void updateLanguage(Language lang) {
		 int result =resumeService.updateLanguage(lang);
		}
	//어학시험 삭제
		@RequestMapping("/deletelanguage.do")
		@ResponseBody
		public void deletelanguage(@RequestParam int languageTestNo) {
		 int result =resumeService.deletelanguage(languageTestNo); 
		}	
	
		
}
