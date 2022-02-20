package com.pp.boot.member.model.service;

import java.util.List;
import java.util.Map;

import com.pp.boot.member.model.vo.LikeCompany;
import com.pp.boot.member.model.vo.Member;
import com.pp.boot.member.model.vo.Scrap;

public interface MemberService {

	Member loginMember(Map param);
	int enrollMember(Member member);
	Member checkEmail(String email);
	Member searchId(Map param);
	int updatePassword(Map param);
	int updateMemberName(Map param);
	int updatebirth(Map param);
	int updateGender(Map param);
	int updateAddress(Map param);
	int updateEmail(Map param);
	int updatePhone(Map param);
	int insertScrap(Map<String, Object> param);
	List<Scrap> selectScrapList(Map<String, Object> param);
	Scrap checkScrap(Map<String, Object> param);
	int selectScrapCount(String memberId);
	int searchScrapCount(Map<String, Object> param);
	List<Scrap> searchScrapList(Map<String, Object> param);
	int deleteScrap(int scrapNo);
	List<LikeCompany> selectlikeCompanyList(Map<String, Object> param);
	int selectlikeCompanyCount(String memberId);
	int insertLikeCompany(Map<String, Object> param);
	LikeCompany checkLikeCompany(Map<String, Object> param);
	int deletelikeCompany(int likeCompanyNo);
	int deleteScrapStar(Map param);
	int deleteMember(Map param);
	
}
