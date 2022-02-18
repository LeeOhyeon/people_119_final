package com.pp.boot.company.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Company {
	
	// 로그인
	private String companyId;
	private String password;
	
	// 담당자
	private String managerName;
	private String managerPhone;
	
	// 기업 기본정보
	private String companyName;
	private String ceoName;
	private String companyAddress;
	private String businessNumber;
	private Date establishment;
	private String service;
	private int companySize; // 1:스타트업 2:중소 3:중견 4:대기업
	private int employeeNumber;
	private String companyUrl;
	
	// 기업 이미지 파일
	private String favicon;
	private String companyImage;
	
	
}
