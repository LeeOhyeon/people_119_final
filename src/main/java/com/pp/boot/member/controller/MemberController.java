package com.pp.boot.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.pp.boot.common.PageFactoryMember;
import com.pp.boot.common.PageFactorySearchScrap;
import com.pp.boot.member.model.service.MemberService;
import com.pp.boot.member.model.vo.LikeCompany;
import com.pp.boot.member.model.vo.Member;
import com.pp.boot.member.model.vo.Scrap;

import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private PasswordEncoder encoder;
	
	//로그인view
	@RequestMapping("/memberLoginView.do")
	public String memberLoginView() {
		return "member/memberLogin";
	}
	
	//로그인
	@PostMapping("/memberLogin.do")
	public String memberLogin(@RequestParam Map param, Model model) {
		
		String msg ="";
		String loc ="";
	
		Member loginMember = service.loginMember(param);
		
		if(loginMember != null && encoder.matches((String)param.get("password"),loginMember.getPassword())) {
			model.addAttribute("loginMember",loginMember);
			msg = "로그인 성공";
			loc = "/";
		}else {
			msg = "아이디와 비밀번호를 확인해 주세요";
			loc = "/member/memberLoginView.do";
		}
			
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logoutMember(HttpSession session, SessionStatus status) {
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		return "redirect:/";
	}
	
	//회원가입 화면으로 이동
	@RequestMapping("/enrollMemberView.do")
	public String enrollMemberView() {
		return "member/enrollMember";
	}
	
	//회원가입 
	@PostMapping("/enrollMember.do")
	public String enrollMember(Member member,Model model) {
		
		
		member.setPassword(encoder.encode(member.getPassword()));
		
		int result = service.enrollMember(member);
		
		String msg = "";
		String loc ="";
		
		if(result>0) {
			msg="회원가입이 완료되었습니다. 로그인 해주세요";
			loc="/member/memberLoginView.do";
		}else {
			msg="회원가입 실패";
			loc="/member/enrollMemberView.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	//아이디 중복 체크
	@RequestMapping("/enrollCheckId.do")
	public void enrollCheckId(String memberId, HttpServletResponse response) throws IOException{
		Member member = service.loginMember(Map.of("memberId",memberId));
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(member!=null?false:true);
	}
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@PostMapping("/sendMail.do") // AJAX와 URL을 매핑시켜줌 
	@ResponseBody  //AJAX후 값을 리턴하기위해 작성
	public String SendMail(String email,HttpServletResponse response)throws IOException {
			
			Random random=new Random();  //난수 생성을 위한 랜덤 클래스
			String key="";  //인증번호 

			//SimpleMailMessage message = new SimpleMailMessage();
			MimeMessage  message = javaMailSender.createMimeMessage(); //메일 보내는 사람
			//message.setTo(email); //스크립트에서 보낸 메일을 받을 사용자 이메일 주소
			try {
				message.addRecipients(RecipientType.TO, email); //받는 사람 주소 넣어쥼
				message.setSubject("People119 이메일 인증번호 입니다."); //메일 제목
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//입력 키를 위한 코드
			for(int i =0; i<3;i++) {
				int index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
				key+=(char)index;
			}
			int numIndex=random.nextInt(9999)+1000; //4자리 랜덤 정수를 생성
			key+=numIndex;
			
			
			 String msgg="";
		        msgg+= "<div style='margin:100px;'>";
		       	msgg+= "<h1> 안녕하세요 People119 입니다. </h1>";
		        msgg+= "<br>";
		        msgg+= "<p>아래 코드를 회원가입 창으로 돌아가 입력해주세요<p>";
		        msgg+= "<br>";
		        msgg+= "<p>감사합니다!<p>";
		        msgg+= "<br>";
				msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
				msgg+= "<h3 style='color:blue;'>회원가입 코드입니다.</h3>";
				msgg+= "<div style='font-size:130%'>";
				msgg+= "CODE : <strong>";
				msgg+= key+"</strong><div><br/> ";
				msgg+= "</div>";
			
			try {
				message.setText(msgg,"utf-8","html");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			javaMailSender.send(message);//최종적으로 메일 보내기
	        return key;
			
		}
	
	@RequestMapping("/checkEmail.do")
	public void checkEmail(String email,HttpServletResponse response) throws IOException {
		Member member = service.checkEmail(email);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(member!=null?false:true);
	}
	
	
	//아이디 비밀번호 찾기 화면 이동
	@RequestMapping("/searchIdpasswordView.do")
	public String searchIdpasswordView() {
		return "member/searchIdpassword";
	}
	
	
	//아이디 찾기 화면 이동
	@RequestMapping("/searchIdView.do")
	public String searchIdView() {
		return "member/membersearchId";
	}
	
	//비밀번호 찾기 화면 이동
		@RequestMapping("/searchpasswordView.do")
		public String searchpasswordView() {
			return "member/membersearchpassword";
		}
		
	//아이디 찾기
	@RequestMapping("/searchId.do")
	@ResponseBody
	public Member searchId(@RequestParam Map param,HttpServletResponse response) throws IOException{
		Member member = service.searchId(param);
		response.setContentType("application/json; charset=utf-8");
		return member; 
	}
		
	//비밀번호 변경
	@RequestMapping("/updatePassword.do")
	@ResponseBody
	public int updatePassword(@RequestParam Map<String,String> param,HttpServletResponse response) throws IOException{

		String password = "";
		password = (String)param.get("password");  
		password = encoder.encode(password);
		param.put("password",password);
		
		
		int result = service.updatePassword(param);
		response.setContentType("application/json; charset=utf-8");
		return result; 
	}
	
	//마이페이지로 이동
	@RequestMapping("/memberInfoView.do")
	public String memberInfoView(@RequestParam String memberId,Model model) {
		
		Member loginMember = service.loginMember(Map.of("memberId",memberId));
		
		model.addAttribute("loginMember",loginMember);
		
		return "member/memberInfo";
	}
	
	//회원 정보 수정 (이름)
	@RequestMapping("/updateMemberName.do")
	@ResponseBody
	public Member updateMemberName(@RequestParam Map param, HttpServletResponse response,Model model) throws IOException{
		 
		int result = service.updateMemberName(param);
		
		String memberId = (String)param.get("memberId");
		
		Member loginMember = null;
		
		if(result>0) {
			loginMember = service.loginMember(Map.of("memberId",memberId));	
		}
		
		response.setContentType("application/json; charset=utf-8");
		
		return loginMember; 
	}
	
	//회원 정보 수정 (생일)
		@RequestMapping("/updatebirth.do")
		@ResponseBody
		public Member updatebirth(@RequestParam Map param, HttpServletResponse response,Model model) throws IOException{
			 
			int result = service.updatebirth(param);
			
			String memberId = (String)param.get("memberId");
			
			Member loginMember = null;
			
			if(result>0) {
				loginMember = service.loginMember(Map.of("memberId",memberId));	
			}
			
			response.setContentType("application/json; charset=utf-8");
			
			return loginMember; 
		}
		
	
		//회원 정보 수정 (성별)
		@RequestMapping("/updateGender.do")
		@ResponseBody
		public Member updateGender(@RequestParam Map param, HttpServletResponse response,Model model) throws IOException{
			 
			int result = service.updateGender(param);
			
			String memberId = (String)param.get("memberId");
			
			Member loginMember = null;
			
			if(result>0) {
				loginMember = service.loginMember(Map.of("memberId",memberId));	
			}
			
			response.setContentType("application/json; charset=utf-8");
			
			return loginMember; 
		}
			
		//회원 정보 수정 (주소)
		@RequestMapping("/updateAddress.do")
		@ResponseBody
		public Member updateAddress(@RequestParam Map param, HttpServletResponse response,Model model) throws IOException{
			 
			int result = service.updateAddress(param);
			
			String memberId = (String)param.get("memberId");
			
			Member loginMember = null;
			
			if(result>0) {
				loginMember = service.loginMember(Map.of("memberId",memberId));	
			}
			
			response.setContentType("application/json; charset=utf-8");
			
			return loginMember; 
		}
			
	
		//회원 정보 수정 (주소)
		@RequestMapping("/updateEmail.do")
		@ResponseBody
		public Member updateEmail(@RequestParam Map param, HttpServletResponse response,Model model) throws IOException{
			 
			int result = service.updateEmail(param);
			
			String memberId = (String)param.get("memberId");
			
			Member loginMember = null;
			
			if(result>0) {
				loginMember = service.loginMember(Map.of("memberId",memberId));	
			}
			
			response.setContentType("application/json; charset=utf-8");
			
			return loginMember; 
		}
					
		//회원 정보 수정 (핸드폰 번호)
		@RequestMapping("/updatePhone.do")
		@ResponseBody
		public Member updatePhone(@RequestParam Map param, HttpServletResponse response,Model model) throws IOException{
			 
			int result = service.updatePhone(param);
			
			String memberId = (String)param.get("memberId");
			
			Member loginMember = null;
			
			if(result>0) {
				loginMember = service.loginMember(Map.of("memberId",memberId));	
			}
			
			response.setContentType("application/json; charset=utf-8");
			
			return loginMember; 
		}
							
		//스크랩 화면으로 이동
		@RequestMapping("/memberScrapList.do")
		public ModelAndView memberScrapList(@RequestParam String memberId, ModelAndView mv,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
				@RequestParam(value = "numPerPage", defaultValue = "5") int numPerPage) {
			
			Map<String, Object> param = new HashMap<>();
			param.put("memberId", memberId);
			param.put("cPage", cPage);
			param.put("numPerPage", numPerPage);
			
			List<Scrap> scrap = service.selectScrapList(param);
			int scrapCount = service.selectScrapCount(memberId);
			
			mv.addObject("scrapCount",scrapCount);
			mv.addObject("scrap",scrap);
			mv.addObject("pageBar", PageFactoryMember.getPageBar(scrapCount, cPage, numPerPage, 5, "/member/memberScrapList.do?memberId="+memberId+"&&"));
			
			mv.setViewName("member/memberScrap");
			return mv;
		}
		
		//공고스크랩
		@RequestMapping("/insertScrap.do")
		@ResponseBody
		public int insertScrap(@RequestParam Map<String, Object> param,HttpServletResponse response) {
			response.setContentType("application/json; charset=utf-8");
			int result = service.insertScrap(param);
			return result;
		}
		//공고스크랩 체크
		@RequestMapping("/checkScrap.do")
		@ResponseBody
		public void checkScrap(@RequestParam Map<String, Object> param,HttpServletResponse response) throws IOException {
			Scrap scrap = service.checkScrap(param);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(scrap!=null?false:true);
		}
		
		//공고스크랩 검색
		@RequestMapping("/searchScrap.do")
		@ResponseBody
		public Map<String,Object> searchScrap(
				@RequestParam String searchCol,
				@RequestParam String keyword,
				@RequestParam String memberId,
				@RequestParam(value="cPage",defaultValue = "1") int cPage,
				@RequestParam(value="numPerPage" , defaultValue = "5") int numPerPage,
				HttpServletResponse response) {
			
			Map<String,Object> param = new HashMap<>();
			Map<String,Object> paramPage = new HashMap<>();
			
			param.put("keyword", keyword);
			param.put("searchCol", searchCol);
			param.put("memberId", memberId);
			int count = service.searchScrapCount(param);
			
			param.put("cPage", cPage);
			param.put("numPerPage", numPerPage);
			
			List<Scrap> scrap = service.searchScrapList(param);
			
			String pageBar = PageFactorySearchScrap.getPageBar(count, cPage, numPerPage, 5);
			
			paramPage.put("scrap", scrap);
			paramPage.put("pageBar", pageBar);
			paramPage.put("count", count);
			
			return paramPage;
		}
		
		//스크랩 공고삭제
		@RequestMapping("/deleteScrap.do")
		@ResponseBody
		public int deleteScrap(@RequestParam int scrapNo,HttpServletResponse response) {
			response.setContentType("application/json; charset=utf-8");
			int result = service.deleteScrap(scrapNo);
			return result;
		}
		
		//스크랩 공고삭제
		@RequestMapping("/deleteScrapStar.do")
		@ResponseBody
		public int deleteScrapStar(@RequestParam Map param,HttpServletResponse response) {
			response.setContentType("application/json; charset=utf-8");
			int result = service.deleteScrapStar(param);
			return result;
		}

		//관심기업 리스트 
		@RequestMapping("/memberlikeCompanyList.do")
		public ModelAndView memberlikeCompanyList(@RequestParam String memberId, ModelAndView mv,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
				@RequestParam(value = "numPerPage", defaultValue = "8") int numPerPage) {
			
			Map<String, Object> param = new HashMap<>();
			param.put("memberId", memberId);
			param.put("cPage", cPage);
			param.put("numPerPage", numPerPage);
			
			List<LikeCompany> likeCompany = service.selectlikeCompanyList(param);
			int likeCompanyCount = service.selectlikeCompanyCount(memberId);
			
			
			mv.addObject("likeCompanyCount",likeCompanyCount);
			mv.addObject("likeCompany",likeCompany);
			mv.addObject("pageBar", PageFactoryMember.getPageBar(likeCompanyCount, cPage, numPerPage, 5, "/member/memberlikeCompanyList.do?memberId="+memberId+"&&"));
			
			mv.setViewName("member/likeCompany");
			return mv;
		}
		
		//관심기업 등록
		@RequestMapping("/insertLikeCompany.do")
		@ResponseBody
		public int insertLikeCompany(@RequestParam Map<String, Object> param,HttpServletResponse response) {
			response.setContentType("application/json; charset=utf-8");
			int result = service.insertLikeCompany(param);
			return result;
		}
		
		//관심기업 체크
		@RequestMapping("/checkLikeCompany.do")
		@ResponseBody
		public void checkLikeCompany(@RequestParam Map<String, Object> param,HttpServletResponse response) throws IOException {
			LikeCompany likeCompany = service.checkLikeCompany(param);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(likeCompany!=null?false:true);
		}
		
		//관심기업 삭제
		@RequestMapping("/deletelikeCompany.do")
		@ResponseBody
		public int deletelikeCompany(@RequestParam int likeCompanyNo,HttpServletResponse response) {
			response.setContentType("application/json; charset=utf-8");
			int result = service.deletelikeCompany(likeCompanyNo);
			return result;
		}
		
		
		//관심기업 하트색깔 바꾸기
		@RequestMapping("/deleteLikeCompany.do")
		@ResponseBody
		public int deleteLikeCompany(@RequestParam Map param,HttpServletResponse response) {
			response.setContentType("application/json; charset=utf-8");
			int result = service.deleteLikeCompany(param);
			return result;
		}
				
		
		
		//비밀번호 맞는지 확인
		@RequestMapping("/checkPassword.do")
		@ResponseBody
		public void checkPassword(@RequestParam Map param,HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			Member loginMember = service.loginMember(param);
			if(loginMember != null && encoder.matches((String)param.get("password"),loginMember.getPassword())) {
				response.getWriter().print(true);
			}else {
				response.getWriter().print(false);
			}
		}
		
		//회원 탈퇴
		@RequestMapping("/deleteMember.do")
		@ResponseBody
		public int deleteMember(@RequestParam Map param,HttpServletResponse response) throws IOException{
			response.setContentType("application/json; charset=utf-8");
			int result = service.deleteMember(param);
			return result;
		}
		
}
