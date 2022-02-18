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
public class Career {

	
	private int careerNo;
	private int resumeNo;
	private String companyName;
	private Date joinDate;
	private Date regDate;
	private String regReason;
	private String rank;
	private String position;
	private String department;
	private String deptLocation;
	private int annualIncome;
	private String assignedTask;
	private String career;
	
}
