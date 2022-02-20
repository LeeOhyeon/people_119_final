package com.pp.boot.offer.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.offer.model.dao.OfferDao;
import com.pp.boot.offer.model.vo.Offer;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OfferServiceImpl implements OfferService {
	
	@Autowired
	private OfferDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 전체 공고 리스트 가져오기
//	@Override
//	public List<Offer> selectOfferList(int cPage, int numPerpage) {
//		return dao.selectOfferList(session, cPage, numPerpage);
//	}
	@Override
	public List<Offer> selectOfferList() {
		return dao.selectOfferList(session);
	}
	
	// 공고 전체 개수 확인하기
	@Override
	public int countOfferList() {
		return dao.countOfferList(session);
	}
	
	// 공고 등록
	@Override
	public int enrollOffer(Offer o) {
		return dao.enrollOffer(session, o);
	}
	
	// 공고 상세보기
	@Override
	public Offer selectOffer(int offerNo) {
		return dao.selectOffer(session, offerNo);
	}
	
	// 회사명 별 공고 개수 가져오기
	@Override
	public List<Offer> countOffer() {
		return dao.countOffer(session);
	}
	
	// 공조 조회수 올리기
	@Override
	public int updateReadCount(int offerNo) {
		return dao.updateReadCount(session, offerNo);
	}
	
	// 조회수 높은 TOP3 공고 가져오기
	@Override
	public List<Offer> selectHotOfferList() {
		return dao.selectHotOfferList(session);
	}
	
	// 공고 STATUS 자동 업데이트
	@Override
	public int updateOfferStatus() {
		return dao.updateOfferStatus(session);
	}
}
