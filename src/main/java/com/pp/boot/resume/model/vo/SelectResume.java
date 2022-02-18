package com.pp.boot.resume.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.pp.boot.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class SelectResume {

	private int resumeNo;
	private Member memberId;
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
	
	private List<Language>lang;
	private List<Certificate> certificate;
	private List<Career> career;
	
}
