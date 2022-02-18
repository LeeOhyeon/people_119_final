package com.pp.boot.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pp.boot.member.model.vo.LikeCompany;
import com.pp.boot.member.model.vo.Member;
import com.pp.boot.member.model.vo.Scrap;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member loginMember(SqlSessionTemplate session,Map param) {
		return session.selectOne("member.loginMember",param);
	}

	@Override
	public int enrollMember(SqlSessionTemplate session, Member member) {
		return session.insert("member.enrollMember",member);
	}

	@Override
	public Member checkEmail(SqlSessionTemplate session, String email) {
		return session.selectOne("member.checkEmail",email);
	}

	@Override
	public Member searchId(SqlSessionTemplate session, Map param) {
		return session.selectOne("member.searchId",param);
	}

	@Override
	public int updatePassword(SqlSessionTemplate session, Map param) {
		return session.update("member.updatePassword",param);
	}

	@Override
	public int updateMemberName(SqlSessionTemplate session, Map param) {
		return session.update("member.updateMemberName",param);
	}
	@Override
	public int updatebirth(SqlSessionTemplate session, Map param) {
		return session.update("member.updatebirth",param);
	}

	@Override
	public int updateGender(SqlSessionTemplate session, Map param) {
		return session.update("member.updateGender",param);
	}

	@Override
	public int updateAddress(SqlSessionTemplate session, Map param) {
		return session.update("member.updateAddress",param);
	}

	@Override
	public int updateEmail(SqlSessionTemplate session, Map param) {
		return session.update("member.updateEmail",param);
	}

	@Override
	public int updatePhone(SqlSessionTemplate session, Map param) {
		return session.update("member.updatePhone",param);
	}

	@Override
	public int insertScrap(SqlSessionTemplate session,Map param) {
		return session.insert("member.insertScrap",param);
	}

	@Override
	public List<Scrap> selectScrapList(SqlSessionTemplate session, Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		
		return session.selectList("member.selectScrapList",param,rb);
	}

	@Override
	public Scrap checkScrap(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("member.checkScrap",param);
	}

	@Override
	public int selectScrapCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("member.selectScrapCount",memberId);
	}

	@Override
	public int searchScrapCount(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("member.searchScrapCount",param);
	}

	@Override
	public List<Scrap> searchScrapList(SqlSessionTemplate session, Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return session.selectList("member.searchScrapList",param,rb);
	}

	@Override
	public int deleteScrap(SqlSessionTemplate session, int scrapNo) {
		return session.delete("member.deleteScrap",scrapNo);
	}

	@Override
	public List<LikeCompany> selectlikeCompanyList(SqlSessionTemplate session, Map<String, Object> param) {
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return session.selectList("member.selectlikeCompanyList",param,rb);
	}

	@Override
	public int selectlikeCompanyCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("member.selectlikeCompanyCount",memberId);
	}

	@Override
	public int insertLikeCompany(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("member.insertLikeCompany",param);
	}

	@Override
	public LikeCompany checkLikeCompany(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("member.checkLikeCompany",param);
	}

	@Override
	public int deletelikeCompany(SqlSessionTemplate session, int likeCompanyNo) {
		return session.delete("member.deletelikeCompany",likeCompanyNo);
	}
	
	
	
	
	
}
