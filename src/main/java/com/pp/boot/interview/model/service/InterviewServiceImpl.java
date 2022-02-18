package com.pp.boot.interview.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.interview.model.dao.InterviewDao;
import com.pp.boot.interview.model.vo.InterviewReview;
import com.pp.boot.interview.model.vo.InterviewCareer;

@Service
public class InterviewServiceImpl implements InterviewService {

	@Autowired
	private InterviewDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<InterviewCareer> careerList(String memberId) {
		List<InterviewCareer> list=dao.careerList(session,memberId);
		return list;
	}

	@Override
	public int interviewEnroll(InterviewReview i) {
		// TODO Auto-generated method stub
		int result=dao.interviewEnroll(session,i);
		
		return result;
	}

	@Override
	public List<InterviewReview> interviewList(Map<String, Integer> pageParam) {
		List<InterviewReview> list=dao.interviewList(session,pageParam);
		return list;
	}

	@Override
	public int interviewListCount() {
		int totalCount=dao.interviewListCount(session);
		
		return totalCount;
	}

	@Override
	public InterviewReview selectInterview(int interviewReviewNo) {
	
		InterviewReview ir=dao.selectInterview(session,interviewReviewNo);
		
		return ir;
	}

	@Override
	public int deleteInterview(int interviewReviewNo) {

		int count=dao.deleteInterview(session,interviewReviewNo);
		
		return count;
	}

	@Override
	public int interviewUpdate(InterviewReview ir) {
		
		int count=dao.interviewUpdate(session,ir);
		return count;
	}
	
}
