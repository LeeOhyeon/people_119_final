package com.pp.boot.company.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pp.boot.company.model.vo.Company;
@Repository
public class CompanyDaoImpl implements CompanyDao{
	
	@Override
	public Company loginCompany(SqlSessionTemplate session, Map param) {
		return session.selectOne("company.loginCompany",param);
		
	}
	@Override
	public int enrollCompany(SqlSessionTemplate session, Company company) {
		return session.insert("company.enrollCompany",company);
	}
	
	// 기업 정보 수정 == 회원가입할때 안받았던 내용들 채우기
	@Override
	public int updateCompany(SqlSessionTemplate session, Company c) {
		return session.update("company.updateCompany", c);
	}
	
	// 전체 기업 리스트
	@Override
	public List<Company> selectCompanyList(SqlSessionTemplate session) {
		return session.selectList("company.selectCompanyList");
	}
	
	// 한개 기업 정보 가져오기
	@Override
	public Company selectCompany(SqlSessionTemplate session, String companyName) {
		return session.selectOne("company.selectCompany", companyName);
	}
	
	// 해당 기업의 리뷰 전체 개수 가져오기
	@Override
	public int countCompany(SqlSessionTemplate session, String companyName) {
		return session.selectOne("company.countCompany", companyName);
	}
	
	// 회사 이름으로 검색하기
	@Override
	public List<Company> selectSearchCompanyList(SqlSessionTemplate session, String search){
		return session.selectList("company.selectSearchCompanyList", search);
	}
	
	// 기업 정보 조회수 올리기
	@Override
	public int updateCompanyCount(SqlSessionTemplate session, String companyName) {
		return session.update("company.updateCompanyCount", companyName);
	}
	@Override
	public int countCompany(SqlSessionTemplate session) {
		return session.selectOne("company.countCompany2");
	}
	
	
}
