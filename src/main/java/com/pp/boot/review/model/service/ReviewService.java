package com.pp.boot.review.model.service;

import java.util.List;
import java.util.Map;

import com.pp.boot.company.model.vo.Company;
import com.pp.boot.review.model.vo.CompanyReview;

public interface ReviewService {
	
	// 전체 기업 리스트
	List<Company> selectCompanyList();
	
	// 전체 기업리뷰 리스트
	List<CompanyReview> selectCompanyReviewList();
	
	// 기업 리뷰 등록
	int insertCompanyReview(CompanyReview cr);

	// meetingCount
	Map countPercent(String companyName);
	
	// 중복확인
	Company checkCompanyName(Map param);
}
