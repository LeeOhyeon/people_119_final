package com.pp.boot.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.pp.boot.company.model.vo.Company;
import com.pp.boot.review.model.vo.CompanyReview;

public interface ReviewDao {
	
	// 전체 기업 리스트
	List<Company> selectCompanyList(SqlSessionTemplate session);
	
	// 전체 기업리뷰 리스트
	List<CompanyReview> selectCompanyReviewList(SqlSessionTemplate session);
	
	// 기업 리뷰 등록
	int insertCompanyReview(SqlSessionTemplate session, CompanyReview cr);
	
	// countMeetingCount
	Map countPercent(SqlSessionTemplate session, String companyName);
	
}
