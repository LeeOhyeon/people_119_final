package com.pp.boot.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.pp.boot.member.model.vo.LikeCompany;
import com.pp.boot.member.model.vo.Member;
import com.pp.boot.member.model.vo.Scrap;

public interface MemberDao {

	Member loginMember(SqlSessionTemplate session ,Map param);
	int enrollMember(SqlSessionTemplate session,Member member);
	Member checkEmail(SqlSessionTemplate session, String email);
	Member searchId(SqlSessionTemplate session, Map param);
	int updatePassword(SqlSessionTemplate session, Map param);
	int updateMemberName(SqlSessionTemplate session, Map param);
	int updatebirth(SqlSessionTemplate session, Map param);
	int updateGender(SqlSessionTemplate session, Map param);
	int updateAddress(SqlSessionTemplate session, Map param);
	int updateEmail(SqlSessionTemplate session, Map param);
	int updatePhone(SqlSessionTemplate session, Map param);
	int insertScrap(SqlSessionTemplate session,Map param);
	List<Scrap> selectScrapList(SqlSessionTemplate session, Map<String, Object> param);
	Scrap checkScrap(SqlSessionTemplate session, Map<String, Object> param);
	int selectScrapCount(SqlSessionTemplate session, String memberId);
	int searchScrapCount(SqlSessionTemplate session, Map<String, Object> param);
	List<Scrap> searchScrapList(SqlSessionTemplate session, Map<String, Object> param);
	int deleteScrap(SqlSessionTemplate session, int scrapNo);
	List<LikeCompany> selectlikeCompanyList(SqlSessionTemplate session, Map<String, Object> param);
	int selectlikeCompanyCount(SqlSessionTemplate session, String memberId);
	int insertLikeCompany(SqlSessionTemplate session, Map<String, Object> param);
	LikeCompany checkLikeCompany(SqlSessionTemplate session, Map<String, Object> param);
	int deletelikeCompany(SqlSessionTemplate session, int likeCompanyNo);
	
}
