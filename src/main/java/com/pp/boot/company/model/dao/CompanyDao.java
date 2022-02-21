package com.pp.boot.company.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.pp.boot.company.model.vo.Company;
import com.pp.boot.review.model.vo.CompanyReview;

public interface CompanyDao {

	Company loginCompany(SqlSessionTemplate session, Map param);
	int enrollCompany(SqlSessionTemplate session, Company company);
	
	// 기업 정보 수정 == 회원가입할때 안받았던 내용들 채우기
	int updateCompany(SqlSessionTemplate session, Company c);
	
	// 전체 기업 리스트
	List<Company> selectCompanyList(SqlSessionTemplate session);
	
	// 한개 기업 정보 가져오기
	Company selectCompany(SqlSessionTemplate session, String companyName);
	
	// 해당 기업의 리뷰 전체 개수 가져오기
	int countCompany(SqlSessionTemplate session, String companyName);
	
	// 회사 이름으로 검색하기
	List<Company> selectSearchCompanyList(SqlSessionTemplate session, String search);
	
	// 기업 정보 조회수 올리기
	int updateCompanyCount(SqlSessionTemplate session, String companyName);
	int countCompany(SqlSessionTemplate session);
}
