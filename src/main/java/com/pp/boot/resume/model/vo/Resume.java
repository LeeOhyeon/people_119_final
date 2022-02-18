package com.pp.boot.resume.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Resume {

	private int resumeNo;
	private String memberId;
	private String resumeTitle;
	private String tech;
	private String workType;
	private int hopeSalary;
	private String workingArea;
	private String gitLink;
	private String notionLink;
	private String blogLink;
	private String openYn;
	private String hopePosition;
	private String profile;
	private String selfTitle;
	private String selfContent;
	private String careerTitle;
	private String careerContent;
	
	private String academic;
	private String schoolName;
	private String schoolArea;
	private String major; 
	private String dayNight;
	private String grades;
	private Date admissionDate; 
	private Date graduationDate; 
	
}
