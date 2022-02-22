<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/assets/css/insertResume.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="">
          
      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <div class="resume-container">
          <div class="resume-basic-container">
          <p style="font-size: 24px; font-weight: bolder;">기본정보</p>
            <div class="resume-basic-info">
              <div class="profileImg">
              	<div class="upload-box">
				  <div id="drop-file" class="drag-file">
				    <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
				    <p class="message">files to upload</p>
				    <img src="" alt="미리보기 이미지" class="preview">
				  </div>
				</div>
              	<div class="file-container">
	              <label class="file-label" for="chooseFile">사진 선택</label>
					<input class="file" id="chooseFile" name="upfile" type="file"  onchange="dropFile.handleFiles(this.files)"accept="image/png, image/jpeg, image/gif">
              	</div>
              </div>
              <div class="basic-info-container">
              <input type="hidden" value="${loginMember.memberId }"/>
               <div class="info-span">이름 : </div><div class="info-name">${loginMember.memberName }</div><span class="info-gender"> (${loginMember.gender =='M'?"남":"여"})</span><br>
               <div class="info-span">이메일 : </div> <div class="basic-info">${loginMember.email }</div><br>
               <div class="info-span">H.P : </div><div class="basic-info">${loginMember.phone }</div><br>
               <div class="info-span">주소 : </div><div class="basic-info">${loginMember.address }</div><br>
              </div>
            </div>
             
          </div>
          <div class="resume-basic-container">
            <p style="font-size: 24px; font-weight: bolder;">이력서 제목 <span style="color:red; font-size: 18px;">(필수)</span></p>
            <input class="form-control" type="text" placeholder="이력서 제목을 입력하세요(100자까지 입력가능)" id="resumeTitle"
            aria-label="default input example" name="resumeTitle" required="required">
            <span id="resumeTitle-result"></span>
          </div>
          <div class="resume-basic-container-elementary">
            <p style="font-size: 24px; font-weight: bolder;">학력사항<span style="font-weight: normal; font-size: 16px;"> 최종
                학력 선택 후 학력사항을 입력하세요</span><span style="color:red;font-weight: normal; font-size: 16px;"> (필수)</span></p>
            <div class="resume-school-info">
              <label for="school1" class="school"><input type="radio" id="school1" name="academic" value="초등학교"><span>초등학교 졸업</span></label>
              <label for="school2" class="school"><input type="radio" id="school2" name="academic" value="중학교"><span>중학교 졸업</span></label>
              <label for="school3" class="school"><input type="radio" id="school3" name="academic" value="고등학교" ><span>고등학교 졸업</span></label>
              <label for="school4" class="school"><input type="radio" id="school4" name="academic" value="대학/대학원" data-flag="돼지" checked="checked"><span>대학/대학원 이상 졸업</span></label>
            </div>
            <div class="school-input-container">
            	<div class="elementary-container">
            		<div class="school-input-title" id="container-title">대학/대학원 이상 졸업</div>
            		<table>
	            			<tr>
	            				<td>학교명<span> (필수)</span></td>
	            				<td >
	            				<input class="form-control university-input" required="required" type="text" name="schoolName" aria-label="default input example">
	            				</td>
	            			</tr>
	            			<tr>
	            				<td>지역<span> (필수)</span></td>
	            				<td>
	            				<input class="form-control university-input "  required="required" type="text" name="schoolArea" aria-label="default input example">
	            				</td>
	            			</tr>
	            			
	            			<tr class="university-container">
	            				<td>전공<span> (필수)</span></td>
	            				<td>
	            				<input class="form-control university-input" required="required" type="text" name="major" aria-label="default input example">
	            				</td>
	            			</tr>
	            			<tr class="university-container">
	            				<td>주/야간 </td>
	            				<td>
	            				<div class="form-check university-input">
  									<input class="form-check-input" type="radio" name="dayNight" id="dayNight1" value="주간">
								  <label class="form-check-label" for="dayNight1">
								    주간
								  </label>
								</div>
								<div class="form-check university-input">
								  <input class="form-check-input" type="radio" name="dayNight" id="dayNight2"  value="야간">
								  <label class="form-check-label" for="dayNight2">
								   야간
								  </label>
								</div>
	            				
	            				</td>
	            			</tr>
	            			<tr class="university-container">
	            				<td>학점<span> (필수)</span></td>
	            				<td>
	            				<input class="form-control university-input" type="text" name="grades" placeholder="4.5기준" aria-label="default input example">
	            				</td>
	            			</tr>
		            			
	            			<tr>
	            				<td>입학날짜<span> (필수)</span></td>
	            				<td> 
	            				<input class="form-control university-input schoolStartDate" type="date" placeholder="Default input" name="admissionDate" aria-label="default input example">
	            				</td>
	            			</tr>
	            			<tr>
	            				<td>졸업날짜<span> (필수)</span></td>
	            				<td>
	            				<input class="form-control university-input schoolEndDate" type="date" placeholder="Default input" name="graduationDate" aria-label="default input example">
	            				</td>
	            			</tr>
	            		</table>
            	</div>
            </div>
            
           
          </div>
	
          <div class="resume-basic-container-career addform_">
            <p style="font-size: 24px; font-weight: bolder;">경력사항
            	<span style="float:right;" class="deleteAddform" id="deleteCareerAddform" onclick="deleteCareerAddform(this);"><i class="fas fa-times"></i></span>
            </p>
            
            <div class="resume-career-info">
              <div class="select-career">
               <label for="career1"><input type="radio" id="career1" name="career" checked="checked" value="신입"><span class="careerTitle_">신입</span></label>
                <label for="career2"><input type="radio" id="career2" name="career" value="경력">경력</label>
              </div>
              <div class="career-info">
                <table>
                  <tr>
                    <td>회사명</td>
                    <td style="width: 500px"><input class="form-control companyName_"  type="text" aria-label="default input example" name="companyName"></td>
                  </tr><tr>
                    <td>근무부서</td>
                    <td style="width: 500px"><input class="form-control" type="text" aria-label="default input example" name="department"></td>
                  </tr>
                  <tr>
                    <td>입사일</td>
                    <td>
                      <input type="date" style="width: 100%;" name="joinDate">
                    </td>
                  </tr>
                  <tr>
                    <td>퇴사일</td>
                    <td>
                      <input type="date" style="width: 100%;" name="regDate">
                    </td>
                   
                  </tr>
                  <tr>
                    <td>퇴사사유</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="regReason">
                          <option value="업직종 전환" selected="selected">업직종 전환</option>
                          <option value="근무조건">근무조건</option>
                          <option value="경영악화">경영악화</option>
                          <option value="계약만료">계약만료</option>
                          <option value="학업">학업</option>
                          <option value="유학">유학</option>
                          <option value="개인사정">개인사정</option>
                          <option value="기타">기타</option>
                      </select>
                    </td>
                
                  </tr>
                  <tr>
                    <td>직급</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="rank">
                        <option selected="selected" value="인턴/수습">인턴/수습</option>
                        <option value="사원">사원</option>
                        <option value="주임">주임</option>
                        <option value="계장">계장</option>
                        <option value="대리">대리</option>
                        <option value="과장">과장</option>
                        <option value="차장">차장</option>
                        <option value="부장">부장</option>
                        <option value="감사">감사</option>
                        <option value="이사">이사</option>
                        <option value="상무">상무</option>
                        <option value="전무">전무</option>
                        <option value="부사">부사장</option>
                        <option value="사장">사장</option>
                        <option value="임원">임원</option>
                        <option value="연구원">연구원</option>
                        <option value="주임연구원">주임연구원</option>
                        <option value="선임연구원">선임연구원</option>
                        <option value="책임연구원">책임연구원</option>
                        <option value="수석연구원">수석연구원</option>
                        <option value="연구소장">연구소장</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                   <td>직책</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="position">
                        <option selected="selected" value="팀원">팀원</option>
                        <option value="팀장">팀장</option>
                        <option value="실장">실장</option>
                        <option value="총무">총무</option>
                        <option value="지점장">지점장</option>
                        <option value="지사장">지사장</option>
                        <option value="파트장">파트장</option>
                        <option value="그룹장">그룹장</option>
                        <option value="센터장">센터장</option>
                        <option value="매니저">매니저</option>
                        <option value="본부장">본부장</option>
                        <option value="사업부장">사업부장</option>
                        <option value="원장">원장</option>
                        <option value="국장">국장</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>근무지역</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="deptLocation">
                        <option value="강남구" selected="selected">강남구</option>
                        <option value="강북구">강북구</option>
                        <option value="광진구">광진구</option>
                        <option value="노원구">노원구</option>
                        <option value="동작구">동작구</option>
                        <option value="구로구">구로구</option>
                        <option value="도봉구">도봉구</option>
                        <option value="마포구">마포구</option>
                        <option value="성동구">성동구</option>
                        <option value="양천구">양천구</option>
                        <option value="은평구">은평구</option>
                        <option value="중랑구">중랑구</option>
                        <option value="강동구">강동구</option>
                        <option value="서대문구">서대문구</option>
                        <option value="성북구">성북구</option>
                        <option value="영등포구">영등포구</option>
                        <option value="종로구">종로구</option>
                        <option value="강서구">강서구</option>
                        <option value="서초구">서초구</option>
                        <option value="송파구">송파구</option>
                        <option value="용산구">용산구</option>
                        <option value="중구">중구</option>
                        <option value="동대문구">동대문구</option>
                        <option value="금천구">금천구</option>
                        <option value="관악구">관악구</option>
                      </select>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>연봉</td>
                    <td>
                      <input class="form-control" type="number" placeholder="만원" aria-label="default input example" name="annualIncome" min="1500" step="100">
                    </td>
                  
                  </tr>
                  <tr>
                    <td>담당업무</td>
                    <td>
                      <input class="form-control" type="text" placeholder="담당업무" aria-label="default input example" name="assignedTask">
                    </td>
                  </tr>
                </table>
              </div>
              	<div>
              		<p style="color:red;text-align: right;" class="career_p">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
                <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="insertCareerform(this);">저장</button>
                	<button class="btn btn-outline-secondary plus" type="button" id="addCareerformBtn" onclick="addCareerformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>
          
          <div class="resume-basic-container">
            <p style="font-size: 24px; font-weight: bolder;">희망 근무조건 선택 <span style="color:red; font-weight: bold; font-size: 18px;"> (필수)</span></p>
            <div class="hope-worktype">
              <table>
                <tr>
                  <td>근무형태</td>
                  <td>
                    <select class="form-select" aria-label="Default select example" style="width: 500px;" name="workType">
                      <option value="정규직" selected="selected">정규직</option>
                      <option value="계약직">계약직</option>
                    </select>
                  </td>
                  <tr>
                    <td>희망연봉</td>
                    <td><input name="hopeSalary" style="width: 500px;" class="form-control" placeholder="만원" value="회사 내규에 따름" aria-label="default input example"></td>
                  </tr>
                  <tr>
                    <td>근무지역</td>
                    <td colspan="4">
                      <select class="form-select" aria-label="Default select example" style="width: 500px;" name="workingArea">
                        <option value="">지역선택</option>
                        <option value="강남구">강남구</option>
                        <option value="강북구">강북구</option>
                        <option value="광진구">광진구</option>
                        <option value="노원구">노원구</option>
                        <option value="동작구">동작구</option>
                        <option value="구로구">구로구</option>
                        <option value="도봉구">도봉구</option>
                        <option value="마포구">마포구</option>
                        <option value="성동구">성동구</option>
                        <option value="양천구">양천구</option>
                        <option value="은평구">은평구</option>
                        <option value="중랑구">중랑구</option>
                        <option value="강동구">강동구</option>
                        <option value="서대문구">서대문구</option>
                        <option value="성북구">성북구</option>
                        <option value="영등포구">영등포구</option>
                        <option value="종로구">종로구</option>
                        <option value="강서구">강서구</option>
                        <option value="서초구">서초구</option>
                        <option value="송파구">송파구</option>
                        <option value="용산구">용산구</option>
                        <option value="중구">중구</option>
                        <option value="동대문구">동대문구</option>
                        <option value="금천구">금천구</option>
                        <option value="관악구">관악구</option>
                      </select>
                      
                      <div class="areaSelect-result-container">
                      	<div class="areaSelect-result">
                      </div>
                      </div>
                    </td>
                  
                  </tr>
                  
        
                  <tr>
                    <td>포지션</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" style="width: 500px;" name="hopePosition">
                        <option value="서버/백엔드 개발자" selected="selected">서버/백엔드 개발자</option>
                        <option value="프론트엔드 개발자">프론트엔드 개발자</option>
                        <option value="웹 풀스택 개발자">웹 풀스택 개발자</option>
                        <option value="안드로이드 개발자">안드로이드 개발자</option>
                        <option value="IOS개발자">IOS개발자</option>
                        <option value="크로스플랫폼 개발자">크로스플랫폼 개발자</option>
                        <option value="게임클라이언트 개발자">게임클라이언트 개발자</option>
                        <option value="게임 서버 개발자">게임 서버 개발자</option>
                        <option value="DBA">DBA</option>
                        <option value="빅데이터 엔지니어">빅데이터 엔지니어</option>
                        <option value="인공지능/머신러닝">인공지능/머신러닝</option>
                        <option value="Devops/시스템 엔지니어">Devops/시스템 엔지니어</option>
                        <option value="정보보안 담당자">정보보안 담당자</option>
                        <option value="QA엔지니어">QA엔지니어</option>
                        <option value="개발PM">개발PM</option>
                        <option value="HW/임베디드">HW/임베디드</option>
                        <option value="SW/솔루션">SW/솔루션</option>
                        <option value="웹퍼블리셔">웹퍼블리셔</option>
                        <option value="VR/AR/3D">VR/AR/3D</option>
                        <option value="기술지원">기술지원</option>
                      </select>
                    </td>
                  </tr>
                </table>

            </div>

          </div>
          <div class="resume-basic-container-certificate">
            <p style="font-size: 24px; font-weight: bolder;">자격증
            <span style="float:right;" class="deleteAddformCerti" id="deletecertificateAddform" onclick="deletecertificateAddform(this);"><i class="fas fa-times"></i></span>
            </p>
            
            <div class="certificate-container">
              <table>
                <tr>
                  <td>자격증명</td>
                  <td><input style="width: 500px;" class="form-control" type="text" placeholder="자격증명" aria-label="default input example"
                  name="certificateName"
                  ></td>
                </tr>
                <tr>
                  <td>발행처</td>
                  <td><input style="width: 500px;" class="form-control" type="text" placeholder="발행처" aria-label="default input example"
                  name="institution"
                  ></td>
                </tr>
                <tr>
                  <td>합격구분</td>
                  <td>
                    <select class="form-select" aria-label="Default select example" style="width: 500px;" name="acceptance">
                      <option selected="selected" value="1차 합격">1차 합격</option>
                      <option value="2차 합격">2차 합격</option>
                      <option value="필기 합격">필기 합격</option>
                      <option value="실기 합격">실기 합격</option>
                      <option value="최종 합격">최종 합격</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>취득일</td>
                  <td>
                    <input type="date" name="acquiredDate">
                  </td>
                </tr>
              </table>
              	<div>
              		<p style="color:red;text-align: right;" class="career_c">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
              <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="insertCertificateformBtn(this);">저장</button>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="addCertificateformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>

          <div class="resume-basic-container-language">
            <p style="font-size: 24px; font-weight: bolder;">어학시험
             <span style="float:right;" class="deleteAddformLang" id="deletelanguageAddform" onclick="deletelanguageAddform(this);"><i class="fas fa-times"></i></span>
            </p>
            <div class="language-container">
              <table >
                <tr>
                  <td>언어</td>
                  <td>
                    <select class="form-select" aria-label="Default select example" style="width: 500px;" name="language">
                      <option selected="selected" value="영어">영어</option>
                      <option value="일본어">일본어</option>
                      <option value="중국어">중국어</option>
                      <option value="독일어">독일어</option>
                      <option value="불어">불어</option>
                      <option value="스페인어">스페인어</option>
                      <option value="러시아어">러시아어</option>
                      <option value="이탈리아어">이탈리아어</option>
                      <option value="한국어">한국어</option>
                      <option value="기타">기타</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>시험종류</td>
                  <td><input style="width: 500px;" class="form-control" type="text" placeholder="시험종류 입력" aria-label="default input example"
                  name="testType"
                  ></td>
                </tr>
                <tr>
                  <tr>
                    <td>점수</td>
                    <td><input style="width: 500px;" class="form-control" type="text" placeholder="점수" aria-label="default input example"
                    name="score"
                    ></td>
                  </tr>
                  <tr>
                </tr>
                <tr>
                  <td>취득여부</td>
                  <td>
                    <select class="form-select" aria-label="Default select example" style="width: 500px;"
                    name="acqStatus">
                      <option selected="selected" value="취득">취득(PASS)</option>
                      <option value="미취득">미취득(NON PASS)</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>취득일</td>
                  <td>
                    <input type="date" name="languageAeqDate">
                  </td>
                </tr>
              </table>
              	<div>
              		<p style="color:red;text-align: right;" class="career_l">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
               <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="insertLanguageformBtn(this);">저장</button>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="addLanguageformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>

          <div class="resume-basic-container">
            <p style="font-size: 24px; font-weight: bolder;">보유기술<span style="color:red; font-weight: bold; font-size: 18px;"></span></p>
            <div class="tech-container">
              <select class="form-select" aria-label="Default select example" style="width: 200px;" name="tech">
                <option value="">보유기술 선택</option>
                <option value="JAVA" selected="selected">JAVA</option>
                <option value="JSP">JSP</option>
                <option value="Ajax">Ajax</option>
                <option value="Jquery">Jquery</option>
                <option value="MY-SQL">MY-SQL</option>
                <option value="ORACLE">ORACLE</option>
                <option value="CSS">CSS</option>
                <option value="HTML">HTML</option>
                <option value="MyBatis">MyBatis</option>
                <option value="Spring Framework">Spring Framework</option>
                <option value="Java Script">Java Script</option>
                <option value="Spring boot">Spring boot</option>
                <option value="React">React</option>
                <option value="Angular">Angular</option>
                <option value="Vue.js">Vue.js</option>
                <option value="Node.js">Node.js</option>
                <option value="Python">Python</option>
                <option value="Bootstrap">Bootstrap</option>
                <option value="Servlet">Servlet</option>
              </select>
            </div>
              <div class="techSelect-result-container">
                <div class="techSelect-result"></div>
              </div>
          </div>
			

          <div class="resume-basic-container-self">
            <p style="font-size: 24px; font-weight: bolder;">자기소개서  <span style="color:red; font-weight: bold; font-size: 18px;"></span></p>
            <div class="introduceself-container">
              <input class="form-control" type="text" placeholder="자소서 제목" aria-label="default input example" name="selfTitle" required="required">
              <br>
              <div class="form-floating">
                <textarea required="required" id="selfContent" name="selfContent" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px;resize:none;" ></textarea>
                <label for="floatingTextarea2">자소서 내용</label>
              </div>
            </div>
             
          </div>

          <div class="resume-basic-container-introcareer">
            <p style="font-size: 24px; font-weight: bolder;" >경력기술서</p>
            <div class="introduceself-container">
              <input required="required" class="form-control" type="text" placeholder="경력기술서 제목" aria-label="default input example" name="careerTitle">
              <br>
              <div class="form-floating">
                <textarea required="required" id="careerContent" name="careerContent" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px;resize:none;" ></textarea>
                <label for="floatingTextarea2">경력기술서 내용</label>
              </div>
            </div>
           
          </div>
          
          
          <div class="resume-basic-container">
            <p style="font-size: 24px; font-weight: bolder;">주소</p>
            <div class="certificate-container">
              <table >
                <tr>
                  <td>GIT 주소</td>
                  <td>
                   <input style="width: 500px;" class="form-control" type="text" aria-label="default input example"
                  name="gitLink">
                  </td>
                </tr>
                <tr>
                  <td>notion 주소</td>
                  <td>
                   <input style="width: 500px;" class="form-control" type="text"  aria-label="default input example"
                  name="notionLink">
                  </td>
                </tr>
               <tr>
                  <td>blog 주소</td>
                  <td>
                   <input style="width: 500px;" class="form-control" type="text"  aria-label="default input example"
                  name="blogLink">
                  </td>
                </tr>
              </table>
            </div>
          </div>
         <button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="insertResume();">이력서 저장</button>
        </div>
        	<div class="quickmenu-container">
				<div class="quickmenu">
					<ul>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="location.assign('${path }/member/memberInfoView.do?memberId=${loginMember.memberId}')">기본정보 수정</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="addCertificateformBtn();">+자격증</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="addLanguageformBtn();">+어학시험</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="insertResume();">이력서 저장</button></li>
					<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="location.assign('${path}/resume/memberResumeList.do?memberId=${loginMember.memberId}');">이력서 관리</button></li>
					</ul>
				</div>
			</div>        
      </div>
      
    </section>
	

<script type="text/javascript">

let memberId = "${loginMember.memberId}";

function DropFile(dropAreaId, fileListId) {
	
	  let dropArea = document.getElementById(dropAreaId);
	  let fileList = document.getElementById(fileListId);

	  function preventDefaults(e) {
	    e.preventDefault();
	    e.stopPropagation();
	  }

	  function highlight(e) {
	    preventDefaults(e);
	    //dropArea.classList.add("highlight");
	  }

	  function unhighlight(e) {
	    preventDefaults(e);
	    //dropArea.classList.remove("highlight");
	  }

	  function handleDrop(e) {
	    unhighlight(e);
	    let dt = e.dataTransfer;
	    let files = dt.files;

	    handleFiles(files);

	    const fileList = document.getElementById(fileListId);
	    if (fileList) {
	      fileList.scrollTo({ top: fileList.scrollHeight });
	    }
	  }

	  function handleFiles(files) {
	    files = [...files];
	    // files.forEach(uploadFile);
	    files.forEach(previewFile);
	  }

	  function previewFile(file) {
	    console.log(file);
	    renderFile(file);
	  }

	  function renderFile(file) {
	    let reader = new FileReader();
	    reader.readAsDataURL(file);
	    reader.onloadend = function () {
	      let img = dropArea.getElementsByClassName("preview")[0];
	      img.src = reader.result;
	      img.style.display = "block";
	    };
	  }

	  dropArea.addEventListener("dragenter", highlight, false);
	  dropArea.addEventListener("dragover", highlight, false);
	  dropArea.addEventListener("dragleave", unhighlight, false);
	  dropArea.addEventListener("drop", handleDrop, false);

	  return {
	    handleFiles
	  };
	}

	const dropFile = new DropFile("drop-file", "files");
	
	//제목 글자수 초과 100자
	$("#resumeTitle").keyup(e=>{
		const length = $(e.target).val().length;
		if(length>100){
          temp = $(e.target).val().substring(0,98);
          $(e.target).val(temp);
       }
       $("#resumeTitle-result").text(length+"/100"); 
	});
	
	//최종학력 선택
	$("input[name=academic]").change(e=>{
		$("#container-title").html($(e.target).siblings('span').html());
		if($($("input[name=academic]:checked")).data('flag')) {
			$(".university-container").show();
		} else {
			$(".university-container").hide();
		}
		
	});
	
	//최종 학력 날짜 
	$(".schoolEndDate").change(e=>{
		if($("input[name=graduationDate]").val()<$("input[name=admissionDate]").val()){
			alert("날짜를 확인해 주세요!");
			$(".schoolEndDate").val("");
		}
	});
	
	$(".schoolStartDate").change(e=>{
		if($("input[name=graduationDate]").val() != ""){
			if($("input[name=graduationDate]").val()<$("input[name=admissionDate]").val()){
  			alert("날짜를 확인해 주세요!");
  			$(".schoolStartDate").val("");
  		}
		}
	});
	
	//입사일 퇴사일
	
	$("input[name=regDate]").change(e=>{
		if($("input[name=regDate]").val()<$("input[name=joinDate]").val()){
			alert("날짜를 확인해 주세요!");
			$("input[name=regDate]").val("");
		}
	});
	
	$("input[name=joinDate]").change(e=>{
		if($("input[name=regDate]").val() != ""){
			if($("input[name=regDate]").val()<$("input[name=joinDate]").val()){
  			alert("날짜를 확인해 주세요!");
  			$("input[name=joinDate]").val("");
  		}
		}
	});
	
	//희망 지역 선택
	   
          let workingAreaArr = [];
                $("select[name=workingArea]").change(e=>{
              	let val = $("select[name=workingArea]").val();  
                	
                if(val == ""){
             	     return;
                }else if(workingAreaArr.length<8){
              		  if(workingAreaArr.length == 0){
              			  
              			  $(".areaSelect-result-container").css("padding-top","20px");
              			  workingAreaArr.push($("select[name=workingArea]").val());
              			  $(".areaSelect-result").append($("<span class='select-result-span' onclick='deletHopeArea(this);'>").text($("select[name=workingArea]").val()));
              		  }else{
              			  for(let i=0;i<workingAreaArr.length;i++){
                  			  if(!workingAreaArr.includes($("select[name=workingArea]").val())){
                  				 workingAreaArr.push($("select[name=workingArea]").val());
                            	  $(".areaSelect-result").append($("<span class='select-result-span' onclick='deletHopeArea(this);'>").text($("select[name=workingArea]").val()));	
                  			  }                  		 
                  		}
              		  }
              		 
              	  }else{
              		  alert("지역은 8개까지 선택 가능합니다.");
              		  return;
              	  }
                });
                
           function deletHopeArea(e){
          	 for(let i=0;i<workingAreaArr.length;i++){
          		 if(workingAreaArr[i] == $(e).text()){
          			 workingAreaArr.splice(i,1);
          			 $(e).remove();
          		 }
          	 }
           }
           
           
		//보유 기술 선택
		let techArr = [];
		
		  
         $("select[name=tech]").change(e=>{
        	 let val = $("select[name=tech]").val();  
        	 if(val == ""){
        		 return;
        	 }else if(techArr.length<10){
         		  if(techArr.length == 0){
         			  $(".techSelect-result-container").css("padding-top","20px");
         			 techArr.push($("select[name=tech]").val());
         			  $(".techSelect-result").append($("<span class='select-result-span' onclick='deleteTech(this);'>").text($("select[name=tech]").val()));
         		  }else{
         			  for(let i=0;i<techArr.length;i++){
             			  if(!techArr.includes($("select[name=tech]").val())){
             				 techArr.push($("select[name=tech]").val());
                       	  $(".techSelect-result").append($("<span class='select-result-span' onclick='deleteTech(this);'>").text($("select[name=tech]").val()));	
             		 
             		 }
             			 
             		}
         		  }
         		 
         	  }else{
         		  alert("보유기술은 10개까지 선택 가능합니다.");
         	  }
           });
           
      function deleteTech(e){
     	 for(let i=0;i<techArr.length;i++){
     		 if(techArr[i] == $(e).text()){
     			techArr.splice(i,1);
     			 $(e).remove();
     		 }
     	 }
      }
      
      let careerCount = 0;
	  let certificationCount =0;
	  let languageCount = 0;
      
      //경력사항 추가
      const addCareerformBtn=()=>{
        let copy = $($(".addform_")[0]).clone(true);
        copy.find(".deleteAddform").css("display","block");
        copy.find("input").val("");
        copy.find("#career1").remove();
        copy.find(".careerTitle_").remove();
		$($(".addform_").last()).after(copy); 
		
     } 
	          
	 //자격증 추가
	 const addCertificateformBtn=()=>{
        let copy = $($(".resume-basic-container-certificate")[0]).clone(true);
        copy.css("display","block");
        copy.find("input").val("");
		$($(".resume-basic-container-certificate").last()).after(copy); 
		certificationCount++;
     }
     
	 //어학시험
	  const addLanguageformBtn=()=>{
		languageCount++;
        let copy = $($(".resume-basic-container-language")[0]).clone(true);
        copy.css("display","block");
        copy.find("input").val("");
		$($(".resume-basic-container-language").last()).after(copy); 
     }
	  
	 /* //자기소개서
	  const addSelfformBtn=()=>{
        let copy = $($(".resume-basic-container-self")[0]).clone(true);
		$($(".resume-basic-container-self")[0]).after(copy); 
     }
	 //경력기술서
	  const addIntroCareerformBtn=()=>{
        let copy = $($(".resume-basic-container-introcareer")[0]).clone(true);
		$($(".resume-basic-container-introcareer")[0]).after(copy); 
     } 
	  */
	  
	 
	 //기본 정보 저장
	 const insertResume=()=>{
		 
		let formdata = new FormData();
		//사진
		let upfile = $("input[name=upfile]")[0].files[0];
		//학교 정보
		let academic = $("input[name=academic]:checked").val();
		let schoolName = $("input[name=schoolName]").val();
		let schoolArea = $("input[name=schoolArea]").val();
		let major = $("input[name=major]").val();
		let dayNight = $("input[name=dayNight]").val();
		let grades = $("input[name=grades]").val();
		let admissionDate = $("input[name=admissionDate]").val();
		let graduationDate = $("input[name=graduationDate]").val();
		
		 //이력서 제목
		 let resumeTitle = $("input[name=resumeTitle]").val();
		 console.log(resumeTitle);
		 //희망 근무조건
		 let workType = $("select[name=workType]").val();
		 let hopeSalary = $("input[name=hopeSalary]").val();
		 let workingArea = workingAreaArr;
		 let hopePosition = $("select[name=hopePosition]").val();
		 
		 //보유기술
		 let tech = techArr;
		 //주소
		 let gitLink = $("input[name=gitLink]").val();
		 let notionLink = $("input[name=notionLink]").val();
		 let blogLink = $("input[name=blogLink]").val();
		
		 //자기소개서
		 let selfTitle = $("input[name=selfTitle]").val();
		 let selfContent = $("#selfContent").val();
		
		 //경력기술서
		 let careerTitle = $("input[name=careerTitle]").val();
		 let careerContent = $("#careerContent").val();
		
		if(upfile == null){alert("이력서 사진은 반드시 등록해야 합니다."); return}
		if(resumeTitle == ''){alert("이력서 제목을 입력해 주세요."); $("input[name=resumeTitle]").focus(); return}
		if(academic == ''){alert("최종학력을 선택해 주세요."); return}
		if(schoolName == ''){alert("학교명을 입력해 주세요.");$("input[name=schoolName]").focus(); return}
		if(schoolArea == ''){alert("학교 지역을 입력해 주세요.");$("input[name=schoolArea]").focus(); return}
		if(admissionDate == ''){alert("입학날짜를 선택해 주세요."); $("input[name=admissionDate]").focus(); return}
		if(graduationDate == ''){alert("졸업날짜를 선택해 주세요."); $("input[name=graduationDate]").focus();return}
		if(workType == '' ){alert("희망 근무형태를 선택해 주세요."); $("select[name=workType]").focus();return}
		if(hopeSalary == ''){alert("희망 연봉을 입력해 주세요."); $("input[name=hopeSalary]").focus();return}
		if(workingArea == ''||workingArea ==null ){alert("희망근무지역을 선택해 주세요."); $("select[name=workingArea]").focus();return}
		if(tech == ''||tech == null){alert("보유기술을 선택해 주세요."); $("select[name=tech]").focus(); return}
		if(selfTitle == ''){alert("자기소개서 제목을 입력해 주세요."); $("input[name=selfTitle]").focus(); return}
		if(selfContent == ''){alert("자기소개서를 입력해 주세요."); $("input[name=selfContent]").focus(); return}
		if(grades>4.5){alert("학점은 최대 4.5를 넘길 수 없습니다."); $("input[name=grades]").fucus(); return}
		if(careerCount == 0 ){alert("경력사항을 저장해 주세요."); return}
		if(certificationCount>0 && certificationCount<=1){alert("자격증 정보를 저장해 주세요."); return}
		if(languageCount>0 && languageCount<=1 ){alert("어학시험 정보를 저장해 주세요."); return}
		else{
			formdata.append("resumeNo",resumeNo);
			formdata.append("memberId",memberId);
			formdata.append("resumeTitle",resumeTitle);
			formdata.append("hopeSalary",hopeSalary);
			formdata.append("workingArea",workingArea);
			formdata.append("hopePosition",hopePosition);
			formdata.append("workType",workType);
			formdata.append("tech",tech);
			formdata.append("gitLink",gitLink);
			formdata.append("blogLink",blogLink);
			formdata.append("notionLink",notionLink);
			formdata.append("selfTitle",selfTitle);
			formdata.append("selfContent",selfContent);
			formdata.append("careerTitle",careerTitle);
			formdata.append("careerContent",careerContent);
			formdata.append("upfile",upfile);
			formdata.append("academic",academic); 
			formdata.append("schoolName",schoolName); 
			formdata.append("schoolArea",schoolArea); 
			formdata.append("major",major); 
			formdata.append("dayNight",dayNight); 
			formdata.append("grades",grades); 
			formdata.append("admissionDate",admissionDate); 
			formdata.append("graduationDate",graduationDate); 
			
			
			 $.ajax({
				 url :"${path }/resume/insertBasicResume.do",
				 enctype:'multipart/form-data',
			     type:"post",
			     processData: false,
		         contentType: false,
				 data : formdata,
				 success:data=>{
					 alert("이력서 등록이 완료되었습니다.");
					 memberResumeList();
				 },error:e=>{
					 alert("입력하지 않은 값이 없는지 확인해 주세요.");
				 }
				 
			 }); 
		}
		
	 }
	 
	 function memberResumeList(){
		 location.assign("${path}/resume/memberResumeList.do?memberId="+memberId);
	 }
	  
	 
	 //경력 삭제
	 const deleteCareerAddform=(e)=>{
			let deleteCareerAddform = $(e);
			deleteCareerAddform.parent().parent().remove();
	 }
	 
	 //자격증 삭제
	 const deletecertificateAddform=(e)=>{
			let deletecertificateAddform = $(e);
			deletecertificateAddform.parent().parent().remove();
			certificationCount--;
	 }
	 //어학시험 삭제
	  const deletelanguageAddform=(e)=>{
			let deletelanguageAddform = $(e);
			deletelanguageAddform.parent().parent().remove();
			languageCount--;
	 }
	
	  //경력사항 등록
	  $("#addCareerformBtn").hide();
	  let resumeNo = "${resumeNo}";
      
    	$(".career-info").hide();
    	
    	$("input[name=career]").change(e=>{
    			$(".career-info").show();
    			if($("input[name=career]:checked").val()=='신입'){
    				$(".career-info").hide();
    				$("#addCareerformBtn").hide();
    			}else{
    				$("#addCareerformBtn").show();
    			}
    	});
    
    	$("input[name=assignedTask]").change(e=>{
    		alert("반드시 저장 버튼을 누르셔야 합니다!");
    	});
    
    	const insertCareerform=(e)=>{
    		
    		let btn = $(e);
			          		
    		let career =$(btn.parents('.resume-basic-container-career')).find('input[name=career]:checked').val(); 
    		let companyName =$(btn.parents('.resume-basic-container-career')).find('input[name=companyName]').val();
        	let joinDate =$(btn.parents('.resume-basic-container-career')).find('input[name=joinDate]').val(); 
        	let regDate = $(btn.parents('.resume-basic-container-career')).find('input[name=regDate]').val(); 
        	let regReason = $(btn.parents('.resume-basic-container-career')).find('select[name=regReason]').val();
        	let rank = $(btn.parents('.resume-basic-container-career')).find('select[name=rank]').val();
        	let position = $(btn.parents('.resume-basic-container-career')).find('select[name=position]').val();
        	let department = $(btn.parents('.resume-basic-container-career')).find('input[name=department]').val();
        	let deptLocation = $(btn.parents('.resume-basic-container-career')).find('select[name=deptLocation]').val();
        	let annualIncome = $(btn.parents('.resume-basic-container-career')).find('input[name=annualIncome]').val();
        	let assignedTask = $(btn.parents('.resume-basic-container-career')).find('input[name=assignedTask]').val();
        	
    		if(career=='신입'){
    			$.ajax({
        			url:"${path}/resume/insertCareer.do",
        			type:"post",
        			data:{
        				resumeNo:resumeNo,
        				career:career,
        			},
        			success:data=>{
        				alert("등록 완료");
        				$(btn.parents('.resume-basic-container-career')).find('.career_p').html("등록완료");
        				$(btn.parents('.resume-basic-container-career')).find('.career_p').css("color","green");
        				$("#addCareerformBtn").hide();
        				careerCount++;
        			},error:data=>{
        				alert("등록 실패! 관리자에게 문의하세요 :(");
        			}
        		});
    		}else{

        		$.ajax({
        			url:"${path}/resume/insertCareer.do",
        			type:"post",
        			data:{
        				resumeNo:resumeNo,
        				career:career,
        				companyName:companyName,
        				joinDate:joinDate,
        				regDate:regDate,
        				regReason:regReason,
        				rank:rank,
        				position:position,
        				department:department,
        				deptLocation:deptLocation,
        				annualIncome:annualIncome,
        				assignedTask:assignedTask
        			},
        			success:data=>{
        				alert("등록 완료");
        				$(btn.parents('.resume-basic-container-career')).find('.career_p').html("등록완료");
        				$(btn.parents('.resume-basic-container-career')).find('.career_p').css("color","green");
        				careerCount++;
        			},error:data=>{
        				alert("등록 실패! 관리자에게 문의하세요 :(");
        			}
        		});
    			
    		}
    	}
    	
    	//자격증 등록
    	
    	$("input[name=acquiredDate]").change(e=>{
    		alert("반드시 저장 버튼을 누르셔야 합니다!");
    	});
    	
    	const insertCertificateformBtn=(e)=>{
    		
    		let btn = $(e);
    		
    		
    		let certificateName = $(btn.parents('.resume-basic-container-certificate')).find('input[name=certificateName]').val();
    		let institution = $(btn.parents('.resume-basic-container-certificate')).find('input[name=institution]').val();
    		let acceptance = $(btn.parents('.resume-basic-container-certificate')).find('select[name=acceptance]').val();
    		let acquiredDate = $(btn.parents('.resume-basic-container-certificate')).find('input[name=acquiredDate]').val();
			
    		$.ajax({
    			url : "${path}/resume/insertCertificate.do",
    			type:"post",
    			data:{resumeNo:resumeNo,
    				certificateName:certificateName,
    				institution:institution,
    				acceptance:acceptance,
    				acquiredDate:acquiredDate
    			},
    			success:data=>{
    				alert("등록 완료");
    				certificationCount++;
    				$(btn.parents('.resume-basic-container-certificate')).find('.career_c').html("등록완료");
    				$(btn.parents('.resume-basic-container-certificate')).find('.career_c').css("color","green");
    			},error:data=>{
    				alert("등록 실패! 관리자에게 문의하세요 :(");
    			}
    		});
    	}
    	
    	//어학 시험 등록
    		$("input[name=languageAeqDate]").change(e=>{
    		alert("반드시 저장 버튼을 누르셔야 합니다!");
    	});
    	
    	const insertLanguageformBtn=(e)=>{
    		let btn=$(e);
    		
    		let language = $(btn.parents('.resume-basic-container-language')).find('select[name=language]').val();
    		let testType = $(btn.parents('.resume-basic-container-language')).find('input[name=testType]').val();
    		let acqStatus = $(btn.parents('.resume-basic-container-language')).find('select[name=acqStatus]').val();
    		let score = $(btn.parents('.resume-basic-container-language')).find('input[name=score]').val();
    		let languageAeqDate = $(btn.parents('.resume-basic-container-language')).find('input[name=languageAeqDate]').val();
    		
    		
    		$.ajax({
    			
    			url : "${path}/resume/insertLanguage.do",
    			type:"post",
    			data:{resumeNo:resumeNo,
    				language:language,
    				testType:testType,
    				acqStatus:acqStatus,
    				score:score,
    				languageAeqDate:languageAeqDate
    			},
    			success:data=>{
    				alert("등록 완료");
    				languageCount++;
    				$(btn.parents('.resume-basic-container-language')).find('.career_l').html("등록완료");
    				$(btn.parents('.resume-basic-container-language')).find('.career_l').css("color","green");
    			},error:data=>{
    				alert("등록 실패! 관리자에게 문의하세요 :(");
    			}
    			
    		});
    		
    	}
    	
    	//퀵메뉴
    	$(document).ready(function(){
    		var currentPosition = parseInt($(".quickmenu").css("top"));
    		$(window).scroll(function() {
    			var position = $(window).scrollTop(); 
    			$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
    		});
    	});
    	
    	
</script>

</main><!-- End #main -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>