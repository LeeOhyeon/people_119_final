package com.pp.boot.member.model.vo;


import java.util.List;

import org.springframework.stereotype.Component;

import com.pp.boot.offer.model.vo.Offer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Scrap {

	private int scrapNo;
	private String memberId;
	private int offerNo;
	private Offer offer;
	private String favicon;
}
