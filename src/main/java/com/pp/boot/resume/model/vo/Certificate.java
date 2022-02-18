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
public class Certificate {

	private int certificateNo;
	private int resumeNo;
	private String certificateName;
	private String institution;
	private String acceptance;
	private Date acquiredDate;

}
