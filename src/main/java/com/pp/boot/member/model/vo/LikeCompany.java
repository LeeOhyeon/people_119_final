package com.pp.boot.member.model.vo;

import org.springframework.stereotype.Component;

import com.pp.boot.company.model.vo.Company;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class LikeCompany {

	private int likeCompanyNo;
	private String memberId;
	private String companyId;
	private int offerCount;
	private Company company;
	
}
