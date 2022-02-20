package com.pp.boot.interview.model.service;

import java.util.List;
import java.util.Map;

import com.pp.boot.interview.model.vo.InterviewReview;
import com.pp.boot.interview.model.vo.InterviewCareer;

public interface InterviewService {

	List<InterviewCareer> careerList(String memberId);

	int interviewEnroll(InterviewReview i);

	List<InterviewReview> interviewList(Map<String, Integer> pageParam);

	int interviewListCount();

	InterviewReview selectInterview(int interviewReviewNo);

	int deleteInterview(int interviewReviewNo);

	int interviewUpdate(InterviewReview ir);

	List<InterviewReview> findInterview(Map<String, Integer> pageParam,String keyword);

	int findInterviewCount(String keyword);	
}
