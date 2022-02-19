package com.pp.boot.offer.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pp.boot.offer.model.vo.Offer;

@Repository
public class OfferDaoImpl implements OfferDao {
	
//	@Override
//	public List<Offer> selectOfferList(SqlSessionTemplate session, int cPage, int numPerpage) {
//		return session.selectList("offer.selectOfferList", null, new RowBounds((cPage-1) * numPerpage, numPerpage));
//	}
	@Override
	public List<Offer> selectOfferList(SqlSessionTemplate session) {
		return session.selectList("offer.selectOfferList");
	}
	
	@Override
	public int countOfferList(SqlSessionTemplate session) {
		return session.selectOne("offer.countOfferList");
	}
	
	// 공고 등록
	@Override
	public int enrollOffer(SqlSessionTemplate session, Offer o) {
		return session.insert("offer.enrollOffer", o);
	}
	
	// 공고 상세보기
	@Override
	public Offer selectOffer(SqlSessionTemplate session, int offerNo) {
		return session.selectOne("offer.selectOffer", offerNo);
	}
	
	// 회사 명 별 공고 개수 가져오기
	@Override
	public List<Offer> countOffer(SqlSessionTemplate session) {
		return session.selectList("offer.countOffer");
	}
	
	// 공고 조회수 올리기
	@Override
	public int updateReadCount(SqlSessionTemplate session, int offerNo) {
		return session.update("offer.updateReadCount", offerNo);
	}
	
	// 조회수 높은 TOP3 공고 가져오기
	@Override
	public List<Offer> selectHotOfferList(SqlSessionTemplate session) {
		return session.selectList("offer.selectHotOfferList");
	}
	
	// 공고 STATUS 자동 업데이트
	@Override
	public int updateOfferStatus(SqlSessionTemplate session) {
		return session.update("offer.updateOfferStatus");
	}
}
