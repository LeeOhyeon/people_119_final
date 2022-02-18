package com.pp.boot.review.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.company.model.vo.Company;
import com.pp.boot.review.model.dao.ReviewDao;
import com.pp.boot.review.model.vo.CompanyReview;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 전체 기업 리스트
	@Override
	public List<Company> selectCompanyList(){
		return dao.selectCompanyList(session);
	}
	
	// 전체 기업리뷰 리스트
	@Override
	public List<CompanyReview> selectCompanyReviewList() {
		return dao.selectCompanyReviewList(session);
	}
	
	// 기업 리뷰 등록
	@Override
	public int insertCompanyReview(CompanyReview cr) {
		return dao.insertCompanyReview(session, cr);
	}

	// meetingCount
	@Override
	public Map countPercent(String companyName) {
		return dao.countPercent(session, companyName);
	}
}
