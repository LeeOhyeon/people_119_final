package com.pp.boot.offer.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.pp.boot.offer.model.vo.Offer;

public interface OfferDao {

	// 전체 공고 리스트 불러오기
//	List<Offer> selectOfferList(SqlSessionTemplate session, int cPage, int numPerpage);
	List<Offer> selectOfferList(SqlSessionTemplate session);
	
	// 전체 공고 개수 확인
	int countOfferList(SqlSessionTemplate session);
	
	// 공고 등록
	int enrollOffer(SqlSessionTemplate session, Offer o);
	
	// 공고 상세보기
	Offer selectOffer(SqlSessionTemplate session, int offerNo);
	
	// 회사명 별 공고 개수 가져오기
	List<Offer> countOffer(SqlSessionTemplate session);
	
	// 공고 조회수 올리기
	int updateReadCount(SqlSessionTemplate session, int offerNo);
	
	// 조회수 높은 TOP3 공고 가져오기
	List<Offer> selectHotOfferList(SqlSessionTemplate session);
	
	// 공고 STATUS 자동 업데이트
	int updateOfferStatus(SqlSessionTemplate session);
	
}
