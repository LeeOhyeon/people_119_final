package com.pp.boot.resume.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pp.boot.resume.model.dao.ResumeDao;
import com.pp.boot.resume.model.vo.Career;
import com.pp.boot.resume.model.vo.Certificate;
import com.pp.boot.resume.model.vo.Language;
import com.pp.boot.resume.model.vo.Resume;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int insertBasicResume(Resume resume) {
		return dao.insertBasicResume(session,resume);
	}

	@Override
	public int insertCareer(Career career) {
		return dao.insertCareer(session,career);
	}

	@Override
	public int insertResume(Resume resume) {
		return dao.insertResume(session,resume);
	}

	@Override
	public int insertCertificate(Certificate certifi) {
		return dao.insertCertificate(session,certifi);
	}

	@Override
	public int insertLanguage(Language lang) {
		return dao.insertLanguage(session,lang);
	}

	@Override
	public List<Resume> selectResumeList(Map<String, Object> param) {
		return dao.selectResumeList(session,param);
	}

	@Override
	public int selectResumeListCount(String memberId) {
		return dao.selectResumeListCount(session,memberId);
	}

	@Override
	public int deleteResume(int resumeNo) {
		return dao.deleteResume(session,resumeNo);
	}

	@Override
	public List<Resume> selectResumeDetail(int resumeNo) {
		return dao.selectResumeDetail(session,resumeNo);
	}

	@Override
	public int updateCareer(Career career) {
		String car = career.getCareer();
		if(car.equals("신입")) {
			dao.deleteAllCareer(session,career);
			return dao.insertCareer(session,career);
		}else {
			return dao.updateCareer(session,career);
		}
		
		
	}

	@Override
	public int deleteCareer(int careerNo) {
		return dao.deleteCareer(session,careerNo);
	}

	@Override
	public int updateCertificate(Certificate certifi) {
		return dao.updateCertificate(session,certifi);
	}

	@Override
	public int deleteCertificate(int certificateNo) {
		return dao.deleteCertificate(session,certificateNo);
	}

	@Override
	public int updateLanguage(Language lang) {
		return dao.updateLanguage(session,lang);
	}

	@Override
	public int deletelanguage(int languageTestNo) {
		return dao.deletelanguage(session,languageTestNo);
	}

	
	
}
