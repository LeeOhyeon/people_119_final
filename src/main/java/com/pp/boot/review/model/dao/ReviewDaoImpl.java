package com.pp.boot.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pp.boot.company.model.vo.Company;
import com.pp.boot.review.model.vo.CompanyReview;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	// 전체 기업 리스트
	@Override
	public List<Company> selectCompanyList(SqlSessionTemplate session) {
		return session.selectList("company.selectCompanyList");
	}
	
	// 전체 기업리뷰 리스트
	@Override
	public List<CompanyReview> selectCompanyReviewList(SqlSessionTemplate session) {
		return session.selectList("companyReview.selectCompanyReviewList");
	}
	
	// 기업 리뷰 등록
	@Override
	public int insertCompanyReview(SqlSessionTemplate session, CompanyReview cr) {
		return session.insert("companyReview.insertCompanyReview", cr);
	}
	
	// countMeetingCount
	@Override
	public Map countPercent(SqlSessionTemplate session, String companyName) {
		return session.selectOne("companyReview.countPercent", companyName);
	}
	
	// 중복확인
	@Override
	public Company checkCompanyName(SqlSessionTemplate session, Map param) {
		return session.selectOne("companyReview.checkCompanyName", param);
	}
}
