package com.pp.boot.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.member.model.dao.MemberDao;
import com.pp.boot.member.model.vo.LikeCompany;
import com.pp.boot.member.model.vo.Member;
import com.pp.boot.member.model.vo.Scrap;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Member loginMember(Map param) {
		return dao.loginMember(session, param);
	}

	@Override
	public int enrollMember(Member member) {
		
		return dao.enrollMember(session,member);
	}

	@Override
	public Member checkEmail(String email) {

		return dao.checkEmail(session,email);
	}

	@Override
	public Member searchId(Map param) {
		return dao.searchId(session,param);
	}

	@Override
	public int updatePassword(Map param) {
		return dao.updatePassword(session,param);
	}

	@Override
	public int updateMemberName(Map param) {
		return dao.updateMemberName(session,param);
	}

	@Override
	public int updatebirth(Map param) {
		return dao.updatebirth(session,param);
	}
	
	@Override
	public int updateGender(Map param) {
		return dao.updateGender(session,param);
	}
	
	@Override
	public int updateAddress(Map param) {
		return dao.updateAddress(session,param);
	}

	@Override
	public int updateEmail(Map param) {
		return dao.updateEmail(session,param);
	}

	@Override
	public int updatePhone(Map param) {
		return dao.updatePhone(session,param);
	}

	@Override
	public int insertScrap(Map<String, Object> param) {
		return dao.insertScrap(session,param);
	}

	@Override
	public List<Scrap> selectScrapList(Map<String, Object> param) {
		return dao.selectScrapList(session,param);
	}

	@Override
	public Scrap checkScrap(Map<String, Object> param) {
		return dao.checkScrap(session,param);
	}

	@Override
	public int selectScrapCount(String memberId) {
		return dao.selectScrapCount(session,memberId);
	}

	@Override
	public int searchScrapCount(Map<String, Object> param) {
		return dao.searchScrapCount(session,param);
	}

	@Override
	public List<Scrap> searchScrapList(Map<String, Object> param) {
		return dao.searchScrapList(session,param);
	}

	@Override
	public int deleteScrap(int scrapNo) {
		return dao.deleteScrap(session,scrapNo);
	}

	@Override
	public List<LikeCompany> selectlikeCompanyList(Map<String, Object> param) {
		return dao.selectlikeCompanyList(session,param);
	}

	@Override
	public int selectlikeCompanyCount(String memberId) {
		return dao.selectlikeCompanyCount(session,memberId);
	}

	@Override
	public int insertLikeCompany(Map<String, Object> param) {
		return dao.insertLikeCompany(session,param);
	}

	@Override
	public LikeCompany checkLikeCompany(Map<String, Object> param) {
		return dao.checkLikeCompany(session,param);
	}

	@Override
	public int deletelikeCompany(int likeCompanyNo) {
		return dao.deletelikeCompany(session,likeCompanyNo);
	}

	@Override
	public int deleteScrapStar(Map param) {
		return dao.deleteScrapStar(session,param);
	}

	@Override
	public int deleteMember(Map param) {
		return dao.deleteMember(session,param);
	}

	
	
	
	
}
