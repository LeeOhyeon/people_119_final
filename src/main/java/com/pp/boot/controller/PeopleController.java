package com.pp.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PeopleController {

	@RequestMapping("/")
	public String maing() {
		return "index";
	}
	
	@RequestMapping("/company/companyIndex.do")
	public String companyMaining() {
		return "company/companyIndex";
	}
	
}
