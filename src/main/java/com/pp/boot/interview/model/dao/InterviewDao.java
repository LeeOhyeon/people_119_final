package com.pp.boot.interview.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.pp.boot.interview.model.vo.InterviewReview;
import com.pp.boot.interview.model.vo.InterviewCareer;

public interface InterviewDao {
	

	List<InterviewCareer> careerList(SqlSessionTemplate session,String memberId);

	int interviewEnroll(SqlSessionTemplate session, InterviewReview i);

	List<InterviewReview> interviewList(SqlSessionTemplate session, Map<String, Integer> pageParam);

	int interviewListCount(SqlSessionTemplate session);

	InterviewReview selectInterview(SqlSessionTemplate session, int interviewReviewNo);

	int deleteInterview(SqlSessionTemplate session, int interviewReviewNo);

	int interviewUpdate(SqlSessionTemplate session, InterviewReview ir);

	

}
