package com.pp.boot.applicant.model.service;

import java.util.List;
import java.util.Map;

import com.pp.boot.applicant.model.vo.Applicant;

public interface ApplicantService {
	
	// 그냥 지원내역 전환
	List<Applicant> selectApplyList(String memberId);
	
	// 공고 지원하기
	int apply(Map param);
	
	// 지원 공고 개수 확인
	int countApply(String memberId);
}
