package com.pp.boot.offer.model.service;

import java.util.List;
import java.util.Map;

import com.pp.boot.offer.model.vo.Offer;

public interface OfferService {
	
	// 공고 전체 리스트 가져오기
//	List<Offer> selectOfferList(int cPage, int numPerpage);	
	List<Offer> selectOfferList();	
	
	// 공고 전체 개수 확인하기
	int countOfferList();
	
	// 공고 등록
	int enrollOffer(Offer o);
	
	// 공고 상세보기
	Offer selectOffer(int offerNo);
	
	// 회사명 별 공고 개수 가져오기
	List<Offer> countOffer();
	
	// 조회스 올리기
	int updateReadCount(int offerNo);
	
	// 조회수 높은 TOP3 공고 가져오기
	List<Offer> selectHotOfferList();
}
