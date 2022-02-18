package com.pp.boot.applicant.model.vo;

import java.util.List;

import com.pp.boot.offer.model.vo.Offer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Applicant {
	
	private int offerNo;
	private String memberId;
	private String passYN; // 합격여부
	
	private List<Offer> offer;

}
