package com.pp.boot.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.pp.boot.offer.model.service.OfferService;

@Component
public class Scheduler {
	
	@Autowired
	private OfferService offerService;
	
		// 매일 00시에 실행.
		// endDate가 현재 날짜보다 과거면 STATUS 컬럼 값을 1로 UPDATE
		@Scheduled(cron = "0 0 0 * * *")
		public void updateOfferStatus() {
			int result = offerService.updateOfferStatus();
		}

}
