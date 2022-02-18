package com.pp.boot.resume.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pp.boot.resume.model.vo.Career;
import com.pp.boot.resume.model.vo.Certificate;
import com.pp.boot.resume.model.vo.Language;
import com.pp.boot.resume.model.vo.Resume;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ResumeDaoImpl implements ResumeDao {
	
	
	@Override
	public int insertBasicResume(SqlSessionTemplate session, Resume resume) {
		return session.update("resume.insertBasicResume",resume);
	}

	@Override
	public int insertCareer(SqlSessionTemplate session, Career career) {
		return session.insert("resume.insertCareer",career);
	}

	@Override
	public int insertResume(SqlSessionTemplate session, Resume resume) {
		
		session.update("resume.insertResume",resume);
		
		int resumeNo = resume.getResumeNo();
		
		log.debug("resume : "+resumeNo);

		return resumeNo;
	}

	@Override
	public int insertCertificate(SqlSessionTemplate session, Certificate certifi) {
		return session.insert("resume.insertCertificate",certifi);
	}

	@Override
	public int insertLanguage(SqlSessionTemplate session, Language lang) {
		return session.insert("resume.insertLanguage",lang);
	}

	@Override
	public List<Resume> selectResumeList(SqlSessionTemplate session, Map<String, Object> param) {
		
		int cPage = (Integer)param.get("cPage");
		int numPerPage =(Integer)param.get("numPerPage");
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		
		return session.selectList("resume.selectResumeList",param,rb);
	}

	@Override
	public int selectResumeListCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("resume.selectResumeListCount",memberId);
	}

	@Override
	public int deleteResume(SqlSessionTemplate session, int resumeNo) {
		return session.delete("resume.deleteResume",resumeNo);
	}

	@Override
	public List<Resume> selectResumeDetail(SqlSessionTemplate session, int resumeNo) {
		return session.selectList("resume.selectResumeDetail",resumeNo);
	}

	@Override
	public int updateCareer(SqlSessionTemplate session, Career career) {
		return session.update("resume.updateCareer", career);
	}

	@Override
	public int deleteCareer(SqlSessionTemplate session, int careerNo) {
		return session.delete("resume.deleteCareer",careerNo);
	}

	@Override
	public int updateCertificate(SqlSessionTemplate session, Certificate certifi) {
		return session.update("resume.updateCertificate",certifi);
	}

	@Override
	public int deleteCertificate(SqlSessionTemplate session, int certificateNo) {
		return session.delete("resume.deleteCertificate",certificateNo);
	}

	@Override
	public int updateLanguage(SqlSessionTemplate session, Language lang) {
		return session.update("resume.updateLanguage",lang);
	}

	@Override
	public int deletelanguage(SqlSessionTemplate session, int languageTestNo) {
		return session.delete("resume.deletelanguage",languageTestNo);
	}

	@Override
	public void deleteAllCareer(SqlSessionTemplate session, Career career) {		
		session.delete("resume.deleteAllCareer",career);
	}
	
	
	
}
