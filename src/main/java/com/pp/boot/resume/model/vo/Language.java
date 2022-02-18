package com.pp.boot.resume.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Language {

	private int languageTestNo;
	private int resumeNo;
	private String language;
	private String testType;
	private int score;
	private String acqStatus;
	private Date languageAeqDate;
	
}
