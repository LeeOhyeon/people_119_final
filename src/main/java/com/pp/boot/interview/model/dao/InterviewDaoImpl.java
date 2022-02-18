package com.pp.boot.interview.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pp.boot.interview.model.vo.InterviewCareer;
import com.pp.boot.interview.model.vo.InterviewReview;

@Repository
public class InterviewDaoImpl implements InterviewDao {
	
	
	@Override
	public List<InterviewCareer> careerList(SqlSessionTemplate session,String memberId) {
		// TODO Auto-generated method stub
		return session.selectList("interview.careerList",memberId);
	}

	@Override
	public int interviewEnroll(SqlSessionTemplate session, InterviewReview i) {
		// TODO Auto-generated method stub
		return session.insert("interview.interviewEnroll",i);
	}

	@Override
	public List<InterviewReview> interviewList(SqlSessionTemplate session, Map<String, Integer> pageParam) {
		RowBounds rb=new RowBounds((pageParam.get("cPage")-1)*pageParam.get("numPerpage"),
				pageParam.get("numPerpage"));
		return session.selectList("interview.interviewList",null,rb);
	}

	@Override
	public int interviewListCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("interview.interviewListCount");
	}

	@Override
	public InterviewReview selectInterview(SqlSessionTemplate session, int interviewReviewNo) {
		// TODO Auto-generated method stub
		return session.selectOne("interview.selectInterview",interviewReviewNo);
	}
	
}
