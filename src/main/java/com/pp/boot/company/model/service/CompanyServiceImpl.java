package com.pp.boot.company.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.company.model.dao.CompanyDao;
import com.pp.boot.company.model.vo.Company;
import com.pp.boot.review.model.vo.CompanyReview;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private CompanyDao dao;
			
	@Override
	public Company loginCompany(Map param) {
		return dao.loginCompany(session,param);
	}
	@Override
	public int enrollCompany(Company company) {
		return dao.enrollCompany(session,company);
	}
	
	// 기업 정보 수정 == 회원가입할때 안받았던 내용들 채우기
	@Override
	public int updateCompany(Company c) {
		return dao.updateCompany(session, c);
	}
	
	// 전체 기업 리스트
	@Override
	public List<Company> selectCompanyList() {
		return dao.selectCompanyList(session);
	}
	
	// 한개 기업 정보 가져오기
	@Override
	public Company selectCompany(String companyName) {
//		log.debug("{}" + companyName);
		return dao.selectCompany(session, companyName);
	}
	
	// 해당 기업의 리뷰 전체 개수 가져오기
	@Override
	public int countCompany(String companyName) {
		return dao.countCompany(session, companyName);
	}
	
	// 회사 이름으로 검색하기
	@Override
	public List<Company> selectSearchCompanyList(String search) {
		return dao.selectSearchCompanyList(session, search);
	}
	
	// 기업 정보 조회수 올리기
	@Override
	public int updateCompanyCount(String companyName) {
		return dao.updateCompanyCount(session, companyName);
	}
	@Override
	public int countCompany() {
		return dao.countCompany(session);
	}
	
	
	
}
