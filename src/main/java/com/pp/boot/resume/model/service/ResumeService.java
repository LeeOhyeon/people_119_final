package com.pp.boot.resume.model.service;

import java.util.List;
import java.util.Map;

import com.pp.boot.resume.model.vo.Career;
import com.pp.boot.resume.model.vo.Certificate;
import com.pp.boot.resume.model.vo.Language;
import com.pp.boot.resume.model.vo.Resume;

public interface ResumeService {

	int insertBasicResume(Resume resume);

	int insertCareer(Career career);

	int insertResume(Resume resume);

	int insertCertificate(Certificate certifi);

	int insertLanguage(Language lang);

	List<Resume> selectResumeList(Map<String, Object> param);

	int selectResumeListCount(String memberId);

	int deleteResume(int resumeNo);

	List<Resume> selectResumeDetail(int resumeNo);

	int updateCareer(Career career);

	int deleteCareer(int careerNo);

	int updateCertificate(Certificate certifi);

	int deleteCertificate(int certificateNo);

	int updateLanguage(Language lang);

	int deletelanguage(int languageTestNo);

}
