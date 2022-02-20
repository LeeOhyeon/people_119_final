package com.pp.boot.applicant.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.applicant.model.dao.ApplicantDao;
import com.pp.boot.applicant.model.vo.Applicant;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApplicantServiceImpl implements ApplicantService {

	@Autowired
	private ApplicantDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 그냥 지원내역 전환
	@Override
	public List<Applicant> selectApplyList(String memberId) {
		return dao.selectApplyList(session, memberId);
	}
	
	// 공고 지원하기
	@Override
	public int apply(Map param) {
		return dao.apply(session, param);
	}
	
	// 지원 공고 개수 확인
	@Override
	public int countApply(String memberId) {
		return dao.countApply(session, memberId);
	}
	
	// 지원 취소
	@Override
	public int deleteApply(Map param) {
		return dao.deleteApply(session, param);
	}
}
