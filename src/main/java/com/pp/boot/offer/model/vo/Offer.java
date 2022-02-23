package com.pp.boot.offer.model.vo;

import java.sql.Date;

import com.pp.boot.company.model.vo.Company;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Offer {

	private int offerNo; // 공고 등록번호
	private String offerTitle; // 공고 제목
//	private Company companyName; // 공고 등록 회사명 => 기업 로그인 정보에서 가져올것
	private String companyName;
	private String companyId;
	
	// 기술스택 최대 8개
	private String tech;
	
	// 주요업무 최대 5개
	private String business;
	
	// 자격요건 최대 3개
	private String qualification;
	
	// 우대사항 최대 3개
	private String treatment;
	
	// 복지 및 혜택 최대 5개
	private String welfare;
	
	private String carrer; // 경력
	private String education; // 학력
	private String location; // 위치
	
	private String image; // 기업 및 서비스 소개 사진
	private String offerContent; // 기업 및 서비스 소개
	
	private Date enrollDate; // 등록일
	private Date endDate; // 마감일
	
	private int offerReadCount; // 조회수
	
	private int status; // 0:비승인 1:승인
	
	private String favicon;
	
	
}
