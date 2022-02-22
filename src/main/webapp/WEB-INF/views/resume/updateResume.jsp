<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/assets/css/updateResume.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<main id="main">

	<script type="text/javascript">
	
	
	function copyCertificateDiv(){
		$(".hiddenCertificate").show();
	}
	
	function copyLanguageDiv(){
		$(".hiddenLangDiv").show();
		
	}
	
	
	 //경력사항 등록
	$("input[name=career]").change(e=>{
			$(".career-info").show();
			if($("input[name=career]:checked").val()=='신입'){
				$(".career-info").hide();
				$("#addCareerformBtn").hide();
			}else{
				$("#addCareerformBtn").show();
			}
	});
	
	</script>
	
	
	
    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="">
          
      </div>
    </section><!-- End Breadcrumbs Section -->
    <section class="inner-page">
    <c:if test="${resume ne null }">
        <c:forEach var="r" items="${resume}">
        <script type="text/javascript">
        	let resumeNo = "${r.resumeNo}";       	      	
        </script>
      <div class="container">
        <div class="resume-container">
          <div class="resume-basic-container">
          <p style="font-size: 24px; font-weight: bolder;">기본정보</p>
            <div class="resume-basic-info">
             <div class="profileImg">
                 <div class="upload-box">
              <div id="drop-file" class="drag-file">
               <c:if test="${r.profile ne null }">
                <img src="${path }/resources/upload/resume/${r.profile}" width="100%" height="100%" alt="이미지 없음">
                 <img src="" alt="미리보기 이미지" class="preview">
                 </c:if>
                 <c:if test="${r.profile eq null }">
                     <span class="nonImg">등록된 사진이<br>없습니다.</span>
                 </c:if>
              </div>
            </div>
                 <div class="file-container">
                 <label class="file-label" for="chooseFile">사진 선택</label>
<!--                <input  class="file" id="chooseFile" name="upfile" type="file"  onchange="dropFile.handleFiles(this.files)"accept="image/png, image/jpeg, image/gif"> -->
               		<input  class="file" id="chooseFile" name="upfile" type="file"accept="image/png, image/jpeg, image/gif">
                 	<input type="hidden" value="${r.profile }" name="orifile"/>
                 </div>
              </div>
              
              <script type="text/javascript">
              
            //이미지 미리보기
      		
      	   	$("input[name=upfile]").change(e=>{
      	   		$(".drag-file").html("");
      	   		if(e.target.files[0].type.includes("image")){
      	   			let reader=new FileReader();
      	   			reader.onload=(e)=>{
      	   				const img=$("<img>").attr({
      	   					src:e.target.result,
      	   					width:"100%",
      	   					height:"100%"
      	   				});
      	   				$(".drag-file").append(img);
      	   				$(".nonImg").hide();
      	   				$(".preview").attr("src",e.target.result);
      	   			}
      	   			reader.readAsDataURL(e.target.files[0]);
      	   		}
      	   	})
              
              
              </script>
              
              
              
              
              
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
            <p style="font-size: 24px; font-weight: bolder;">이력서 제목 <span style="color:red">(필수)</span></p>
            <input class="form-control" type="text" placeholder="이력서 제목을 입력하세요(100자까지 입력가능)" id="resumeTitle" value="${r.resumeTitle }"
            aria-label="default input example" name="resumeTitle">
            <span id="resumeTitle-result"></span>
          </div>
          <div class="resume-basic-container-elementary">
            <p style="font-size: 24px; font-weight: bolder;">학력사항<span style="font-weight: normal; font-size: 16px;"> 최종
                학력 선택 후 학력사항을 입력하세요</span><span style="color:red;font-weight: normal; font-size: 16px;"> (필수)</span></p>
            <div class="resume-school-info">
              <label for="school1" class="school"><input type="radio" id="school1" name="academic" value="초등학교" ${r.academic=='초등학교'?"checked":""}><span>초등학교 졸업</span></label>
              <label for="school2" class="school"><input type="radio" id="school2" name="academic" value="중학교" ${r.academic=='중학교'?"checked":""}><span>중학교 졸업</span></label>
              <label for="school3" class="school"><input type="radio" id="school3" name="academic" value="고등학교"  ${r.academic=='고등학교'?"checked":""}><span>고등학교 졸업</span></label>
              <label for="school4" class="school"><input type="radio" id="school4" name="academic" value="대학/대학원" ${r.academic=='대학/대학원'?"checked":""} data-flag="돼지"><span>대학/대학원 이상 졸업</span></label>
            </div>
            <div class="school-input-container">
            	<div class="elementary-container">
            		<div class="school-input-title" id="container-title">대학/대학원 이상 졸업</div>
            		<table>
	            			<tr>
	            				<td>학교명<span> (필수)</span></td>
	            				<td >
	            				<input value="${r.schoolName}" class="form-control university-input" type="text" name="schoolName" aria-label="default input example">
	            				</td>
	            			</tr>
	            			<tr>
	            				<td>지역<span> (필수)</span></td>
	            				<td>
	            				<input value="${r.schoolArea}" class="form-control university-input"   type="text" name="schoolArea" aria-label="default input example">
	            				</td>
	            			</tr>
	            			<tr class="university-container" id="uniTr1">
	            				<td>전공<span> (필수)</span></td>
	            				<td>
	            				<input value="${r.major}" class="form-control university-input"  type="text" name="major" aria-label="default input example">
	            				</td>
	            			</tr>
	            			<tr class="university-container" id="uniTr2">
	            				<td>주/야간 </td>
	            				<td>
	            				<div class="form-check university-input">
  									<input class="form-check-input" type="radio" name="dayNight" id="dayNight1" value="주간" ${r.dayNight=='주간'?'checked':''}>
								  <label class="form-check-label" for="dayNight1">
								    주간
								  </label>
								</div>
								<div class="form-check university-input">
								  <input class="form-check-input" type="radio" name="dayNight" id="dayNight2"  value="야간" ${r.dayNight=='야간'?'checked':''}>
								  <label class="form-check-label" for="dayNight2">
								   야간
								  </label>
								</div>
	            				
	            				</td>
	            			</tr>
	            			<tr class="university-container" id="uniTr3">
	            				<td>학점<span> (필수)</span></td>
	            				<td>
	            				<input value="${r.grades }" class="form-control university-input" type="text" name="grades" aria-label="default input example"placeholder="/4.5">
	            				</td>
	            			</tr>	            			           			
	            			<tr>
	            				<td>입학날짜<span> (필수)</span></td>
	            				<td> 
	            				<input value="${r.admissionDate }" class="form-control university-input schoolStartDate" type="date" placeholder="Default input" name="admissionDate" aria-label="default input example">
	            				</td>
	            			</tr>
	            			<tr>
	            				<td>졸업날짜<span> (필수)</span></td>
	            				<td>
	            				<input value="${r.graduationDate }" class="form-control university-input schoolEndDate" type="date" placeholder="Default input" name="graduationDate" aria-label="default input example">
	            				</td> 
	            			</tr>
	            		</table>
            	</div>
            </div>
          </div>
          
		
		<c:set var="career1" value="${fn:length(r.career) }"/>
		<c:forEach var="c" items="${r.career }" varStatus="i">
          <div class="resume-basic-container-career addform_">
            <p style="font-size: 24px; font-weight: bolder;">경력
            	<span style="float:right;" class="deleteAddform" id="deleteCareerAddform" onclick="deleteCareer(this);"><i class="fas fa-times"></i></span>
            </p>
            <input type="hidden" name="careerNo" value="${c.careerNo }"/>
            <div class="resume-career-info">
              <div class="select-career">
               <c:if test='${i.index == 0 }'><label id="careerLabel1" for="career1"><input type="radio" id="career1" name="career" value="신입" ${c.career=='신입'?'checked':''}>
               <span class="careerTitle_">신입</span></label>
               <label id="careerLabel2" for="career2"> <input type="radio" id="career2" name="career" value="경력" ${c.career=='경력'?'checked':''}>경력
              </label>
              </c:if>
              </div>
              <div class="career-info">
                <table id= "careerTable">
                  <tr>
                    <td>회사명</td>
                    <td style="width: 500px">
                    <input value="${c.companyName }" class="form-control companyName_"  type="text" aria-label="default input example" name="companyName"></td>
                  </tr><tr>
                    <td>근무부서</td>
                    <td style="width: 500px"><input  value="${c.department }"  class="form-control" type="text" aria-label="default input example" name="department"></td>
                  </tr>
                  <tr>
                    <td>입사일</td>
                    <td>
                      <input type="date" style="width: 100%;" name="joinDate" value='${c.joinDate }'>
                    </td>
                  </tr>
                  <tr>
                    <td>퇴사일</td>
                    <td>
                       <input type="date" style="width: 100%;" name="regDate" value='${c.regDate }'>
                    </td>
                   
                  </tr>
                  <tr>
                    <td>퇴사사유</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="regReason">
                          <option value="업직종 전환" ${c.regReason=='업직종 전환'?'selected':''}>업직종 전환</option>
                          <option value="근무조건" ${c.regReason=='근무조건'?'selected':''}>근무조건</option>
                          <option value="경영악화" ${c.regReason=='경영악화'?'selected':''}>경영악화</option>
                          <option value="계약만료" ${c.regReason=='계약만료'?'selected':''}>계약만료</option>
                          <option value="학업" ${c.regReason=='학업'?'selected':''}>학업</option>
                          <option value="유학" ${c.regReason=='유학'?'selected':''}>유학</option>
                          <option value="개인사정" ${c.regReason=='개인사정'?'selected':''}>개인사정</option>
                          <option value="기타" ${c.regReason=='기타'?'selected':''}>기타</option>
                      </select>
                    </td>
                
                  </tr>
                  <tr>
                    <td>직급</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="rank">
                        <option value="인턴/수습"  ${c.rank=='인턴/수습'?'selected':''}>인턴/수습</option>
                        <option value="사원" ${c.rank=='사원'?'selected':''}>사원</option>
                        <option value="주임" ${c.rank=='주임'?'selected':''}>주임</option>
                        <option value="계장" ${c.rank=='계장'?'selected':''}>계장</option>
                        <option value="대리" ${c.rank=='대리'?'selected':''}>대리</option>
                        <option value="과장" ${c.rank=='과장'?'selected':''}>과장</option>
                        <option value="차장" ${c.rank=='차장'?'selected':''}>차장</option>
                        <option value="부장" ${c.rank=='부장'?'selected':''}>부장</option>
                        <option value="감사" ${c.rank=='감사'?'selected':''}>감사</option>
                        <option value="이사" ${c.rank=='이사'?'selected':''}>이사</option>
                        <option value="상무" ${c.rank=='상무'?'selected':''}>상무</option>
                        <option value="전무" ${c.rank=='전무'?'selected':''}>전무</option>
                        <option value="부사" ${c.rank=='부사'?'selected':''}>부사장</option>
                        <option value="사장" ${c.rank=='사장'?'selected':''}>사장</option>
                        <option value="임원" ${c.rank=='임원'?'selected':''}>임원</option>
                        <option value="연구원" ${c.rank=='연구원'?'selected':''}>연구원</option>
                        <option value="주임연구원"${c.rank=='주임연구원'?'selected':''}>주임연구원</option>
                        <option value="선임연구원"${c.rank=='선임연구원'?'selected':''}>선임연구원</option>
                        <option value="책임연구원"${c.rank=='책임연구원'?'selected':''}>책임연구원</option>
                        <option value="수석연구원"${c.rank=='수석연구원'?'selected':''}>수석연구원</option>
                        <option value="연구소장" ${c.rank=='연구소장'?'selected':''}>연구소장</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                   <td>직책</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="position">
                        <option value="팀원" ${c.position=='팀원'?'selected':''}>팀원</option>
                        <option value="팀장" ${c.position=='팀장'?'selected':''}>팀장</option>
                        <option value="실장" ${c.position=='실장'?'selected':''}>실장</option>
                        <option value="총무" ${c.position=='총무'?'selected':''}>총무</option>
                        <option value="지점장" ${c.position=='지점장'?'selected':''}>지점장</option>
                        <option value="지사장" ${c.position=='지사장'?'selected':''}>지사장</option>
                        <option value="파트장" ${c.position=='파트장'?'selected':''}>파트장</option>
                        <option value="그룹장" ${c.position=='그룹장'?'selected':''}>그룹장</option>
                        <option value="센터장" ${c.position=='센터장'?'selected':''}>센터장</option>
                        <option value="매니저" ${c.position=='매니저'?'selected':''}>매니저</option>
                        <option value="본부장" ${c.position=='본부장'?'selected':''}>본부장</option>
                        <option value="사업부장" ${c.position=='사업부장'?'selected':''}>사업부장</option>
                        <option value="원장" ${c.position=='원장'?'selected':''}>원장</option>
                        <option value="국장" ${c.position=='국장'?'selected':''}>국장</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>근무지역</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" name="deptLocation">
                        <option value="강남구" ${c.deptLocation=='강남구'?'selected':''}>강남구</option>
                        <option value="강북구" ${c.deptLocation=='강북구'?'selected':''}>강북구</option>
                        <option value="광진구" ${c.deptLocation=='광진구'?'selected':''}>광진구</option>
                        <option value="노원구" ${c.deptLocation=='노원구'?'selected':''}>노원구</option>
                        <option value="동작구" ${c.deptLocation=='동작구'?'selected':''}>동작구</option>
                        <option value="구로구" ${c.deptLocation=='구로구'?'selected':''}>구로구</option>
                        <option value="도봉구" ${c.deptLocation=='도봉구'?'selected':''}>도봉구</option>
                        <option value="마포구" ${c.deptLocation=='마포구'?'selected':''}>마포구</option>
                        <option value="성동구" ${c.deptLocation=='성동구'?'selected':''}>성동구</option>
                        <option value="양천구" ${c.deptLocation=='양천구'?'selected':''}>양천구</option>
                        <option value="은평구" ${c.deptLocation=='은평구'?'selected':''}>은평구</option>
                        <option value="중랑구" ${c.deptLocation=='중랑구'?'selected':''}>중랑구</option>
                        <option value="강동구" ${c.deptLocation=='강동구'?'selected':''}>강동구</option>
                        <option value="서대문구" ${c.deptLocation=='서대문구'?'selected':''}>서대문구</option>
                        <option value="성북구" ${c.deptLocation=='성북구'?'selected':''}>성북구</option>
                        <option value="영등포구" ${c.deptLocation=='영등포구'?'selected':''}>영등포구</option>
                        <option value="종로구" ${c.deptLocation=='종로구'?'selected':''}>종로구</option>
                        <option value="강서구" ${c.deptLocation=='강서구'?'selected':''}>강서구</option>
                        <option value="서초구" ${c.deptLocation=='서초구'?'selected':''}>서초구</option>
                        <option value="송파구" ${c.deptLocation=='송파구'?'selected':''}>송파구</option>
                        <option value="용산구" ${c.deptLocation=='용산구'?'selected':''}>용산구</option>
                        <option value="중구" ${c.deptLocation=='중구'?'selected':''}>중구</option>
                        <option value="동대문구" ${c.deptLocation=='동대문구'?'selected':''}>동대문구</option>
                        <option value="금천구" ${c.deptLocation=='금천구'?'selected':''}>금천구</option>
                        <option value="관악구" ${c.deptLocation=='관악구'?'selected':''}>관악구</option>
                      </select>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>연봉</td>
                    <td>
                      <input value="${c.annualIncome }" class="form-control" type="number" placeholder="만원" aria-label="default input example" name="annualIncome" min="1500" step="100" value="2000">
                    </td>
                  
                  </tr>
                  <tr>
                    <td>담당업무</td>
                    <td>
                      <input value="${c.assignedTask }" class="form-control" type="text" placeholder="담당업무" aria-label="default input example" name="assignedTask">
                    </td>
                  </tr>
                </table>
              </div>
              	<div>
              		<p style="color:red;text-align: right;" class="career_p">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
                <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" type="button" id="careerUpdateBtn" onclick="updateCareerform(this,${i.index});">수정</button>
                	<button class="btn btn-outline-secondary plus" type="button" id="addCareerformBtn" onclick="addCareerformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>
          </c:forEach>
          
          
          
          <div class="resume-basic-container hopeContainer">
            <p style="font-size: 24px; font-weight: bolder;">희망 근무조건 선택</p>
            <div class="hope-worktype">
              <table>
                <tr>
                  <td>근무형태</td>
                  <td>
                    <select class="form-select" aria-label="Default select example" style="width: 500px;" name="workType">
                      <option value="정규직" ${r.workType=='정규직'?'selected':''}>정규직</option>
                      <option value="계약직" ${r.workType=='계약직'?'selected':''}>계약직</option>
                    </select>
                  </td>
                  <tr>
                    <td>희망연봉</td>
                    <td><input value="${r.hopeSalary }" name="hopeSalary" style="width: 500px;" class="form-control" placeholder="만원(숫자만 입력 하세요)" aria-label="default input example"></td>
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
                      <input type="hidden" value="${r.workingArea }" name="workingAreaOri"/>
                      <div class="areaSelect-result-container">
                     	 <div class="areaSelect-result"></div>
                      </div>
                      <div class="areaSelect-result-container2">
	                      	 <div class="areaSelect-result2">
	                      	  <c:set var="areaArr" value="${fn:split(r.workingArea,',')}"/>
	            			  <c:forEach var="workingArea" items="${areaArr}">
	                      			<span class='select-result-span'>${workingArea }</span>
	                      	  </c:forEach>
	                       </div>
                      </div>
                    </td>
                  </tr>
                  
        
                  <tr>
                    <td>포지션</td>
                    <td>
                      <select class="form-select" aria-label="Default select example" style="width: 500px;" name="hopePosition">
                        <option value="서버/백엔드 개발자" ${r.hopePosition=='서버/백엔드 개발자'?'selected':'' }>서버/백엔드 개발자</option>
                        <option value="프론트엔드 개발자" ${r.hopePosition=='프론트엔드 개발자'?'selected':'' }>프론트엔드 개발자</option>
                        <option value="웹 풀스택 개발자" ${r.hopePosition=='웹 풀스택 개발자'?'selected':'' }>웹 풀스택 개발자</option>
                        <option value="안드로이드 개발자" ${r.hopePosition=='안드로이드 개발자'?'selected':'' }>안드로이드 개발자</option>
                        <option value="IOS개발자" ${r.hopePosition=='IOS개발자'?'selected':'' }>IOS개발자</option>
                        <option value="크로스플랫폼 개발자" ${r.hopePosition=='크로스플랫폼 개발자'?'selected':'' }>크로스플랫폼 개발자</option>
                        <option value="게임클라이언트 개발자" ${r.hopePosition=='게임클라이언트 개발자'?'selected':'' }>게임클라이언트 개발자</option>
                        <option value="게임 서버 개발자" ${r.hopePosition=='게임 서버 개발자'?'selected':'' }>게임 서버 개발자</option>
                        <option value="DBA" ${r.hopePosition=='DBA'?'selected':'' }>DBA</option>
                        <option value="빅데이터 엔지니어" ${r.hopePosition=='빅데이터 엔지니어'?'selected':'' }>빅데이터 엔지니어</option>
                        <option value="인공지능/머신러닝" ${r.hopePosition=='인공지능/머신러닝'?'selected':'' }>인공지능/머신러닝</option>
                        <option value="Devops/시스템 엔지니어" ${r.hopePosition=='Devops/시스템 엔지니어'?'selected':'' }>Devops/시스템 엔지니어</option>
                        <option value="정보보안 담당자" ${r.hopePosition=='정보보안 담당자'?'selected':'' }>정보보안 담당자</option>
                        <option value="QA엔지니어" ${r.hopePosition=='QA엔지니어'?'selected':'' }>QA엔지니어</option>
                        <option value="개발PM" ${r.hopePosition=='개발PM'?'selected':'' }>개발PM</option>
                        <option value="HW/임베디드" ${r.hopePosition=='HW/임베디드'?'selected':'' }>HW/임베디드</option>
                        <option value="SW/솔루션" ${r.hopePosition=='SW/솔루션'?'selected':'' }>SW/솔루션</option>
                        <option value="웹퍼블리셔" ${r.hopePosition=='웹퍼블리셔'?'selected':'' }>웹퍼블리셔</option>
                        <option value="VR/AR/3D" ${r.hopePosition=='VR/AR/3D'?'selected':'' }>VR/AR/3D</option>
                        <option value="기술지원" ${r.hopePosition=='기술지원'?'selected':'' }>기술지원</option>
                      </select>
                    </td>
                  </tr>
                </table>
            </div>
          </div>
          
          
          <c:forEach var="certi" items="${r.certificate }">
          	<c:if test="${certi.certificateName ne null }">
          <div class="resume-basic-container-certificate">
            <p style="font-size: 24px; font-weight: bolder;">자격증
            <span style="float:right;" class="deleteAddformCerti" id="deletecertificateAddform" onclick="deletecertificate(this);"><i class="fas fa-times"></i></span>
            </p>
            <input type="hidden" name="certificateNo" value="${certi.certificateNo }"/>
            <div class="certificate-container">
              <table>
                <tr>
                  <td>자격증명</td>
                  <td><input value="${certi.certificateName }" style="width: 500px;" class="form-control" type="text" placeholder="자격증명" aria-label="default input example"
                  name="certificateName"
                  ></td>
                </tr>
                <tr>
                  <td>발행처</td>
                  <td><input value="${certi.institution }" style="width: 500px;" class="form-control" type="text" placeholder="발행처" aria-label="default input example"
                  name="institution"
                  ></td>
                </tr>
                <tr>
                  <td>합격구분</td>
                  <td>
                    <select class="form-select" aria-label="Default select example" style="width: 500px;" name="acceptance">
                      <option value="1차 합격" ${certi.acceptance=='1차 합격'?'seleted':'' }>1차 합격</option>
                      <option value="2차 합격" ${certi.acceptance=='2차 합격'?'seleted':'' }>2차 합격</option>
                      <option value="필기 합격" ${certi.acceptance=='필기 합격'?'seleted':'' }>필기 합격</option>
                      <option value="실기 합격" ${certi.acceptance=='실기 합격'?'seleted':'' }>실기 합격</option>
                      <option value="최종 합격" ${certi.acceptance=='최종 합격'?'seleted':'' }>최종 합격</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>취득일</td>
                  <td>
                    <input type="date" name="acquiredDate" value="${certi.acquiredDate }">
                  </td>
                </tr>
              </table>
              	<div>
              		<p style="color:red;text-align: right;" class="career_c">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
              <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" id="updateCertifiBtn" type="button" onclick="updateCertificate(this);">수정</button>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="addCertificateformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>
          </c:if>
          </c:forEach>
	<div class="resume-basic-container-certificate hiddenCertificate">
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
              		<p style="color:red;text-align: right;">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
              <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="insertCertificateformBtn(this);">저장</button>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="addCertificateformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>
<div class="resume-basic-container-language hiddenLangDiv">
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
              		<p style="color:red;text-align: right;">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
               <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="insertLanguageformBtn(this);">저장</button>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="addLanguageformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>
   		<c:forEach var="l" items="${r.lang }"> 
	     <c:if test="${l.language ne null }">     
          <div class="resume-basic-container-language">
            <p style="font-size: 24px; font-weight: bolder;">어학시험
             <span style="float:right;" class="deleteAddformLang" id="deletelanguageAddform" onclick="deletelanguage(this);"><i class="fas fa-times"></i></span>
            </p>
            <input type="hidden" name="languagetestNo" value="${l.languageTestNo }"/>
            <div class="language-container">
              <table >
                <tr>
                  <td>언어</td>
                  <td>
                    <select class="form-select" aria-label="Default select example" style="width: 500px;" name="language">
                      <option ${l.language=='영어'?'selected':'' } value="영어">영어</option>
                      <option ${l.language=='일본어'?'selected':'' } value="일본어">일본어</option>
                      <option ${l.language=='중국어'?'selected':'' } value="중국어">중국어</option>
                      <option ${l.language=='독일어'?'selected':'' } value="독일어">독일어</option>
                      <option ${l.language=='불어'?'selected':'' } value="불어">불어</option>
                      <option ${l.language=='스페인어'?'selected':'' } value="스페인어">스페인어</option>
                      <option ${l.language=='러시아어'?'selected':'' } value="러시아어">러시아어</option>
                      <option ${l.language=='이탈리아어'?'selected':'' } value="이탈리아어">이탈리아어</option>
                      <option ${l.language=='한국어'?'selected':'' } value="한국어">한국어</option>
                      <option ${l.language=='기타'?'selected':'' } value="기타">기타</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>시험종류</td>
                  <td><input value="${l.testType }" style="width: 500px;" class="form-control" type="text" placeholder="시험종류 입력" aria-label="default input example"
                  name="testType"
                  ></td>
                </tr>
                <tr>
                  <tr>
                    <td>점수</td>
                    <td><input value="${l.score }" style="width: 500px;" class="form-control" type="text" placeholder="점수" aria-label="default input example"
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
                      <option ${l.acqStatus=='취득'?'selected':'' } value="취득">취득(PASS)</option>
                      <option ${l.acqStatus=='미취득'?'selected':'' } value="미취득">미취득(NON PASS)</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>취득일</td>
                  <td>
                    <input type="date" name="languageAeqDate" value="${l.languageAeqDate }">
                  </td>
                </tr>
              </table>
              	<div>
              		<p style="color:red;text-align: right;" class="career_l">반드시 저장 버튼을 누르셔야 합니다!</p>
              	</div>
               <div class="plusbtn-container">
                	<div>
                	<button class="btn btn-outline-secondary plus" id="updateLanguageformBtn" type="button" onclick="updateLanguageformBtn(this);">수정</button>
                	<button class="btn btn-outline-secondary plus" type="button" onclick="addLanguageformBtn();">추가 등록</button>
                	</div>
                </div>
            </div>
          </div>
          </c:if>
          </c:forEach>

          <div class="resume-basic-container">
            <p style="font-size: 24px; font-weight: bolder;">보유기술</p>
            <div class="tech-container">
              <select class="form-select" aria-label="Default select example" style="width: 200px;" name="tech">
                <option value="">보유기술 선택</option>
                <option value="JAVA">JAVA</option>
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
              <input type="hidden" value="${r.tech }" name="techOri"/>
            </div>
              <div class="techSelect-result-container">
                <div class="techSelect-result"></div>
              </div>
               <div class="techSelect-result-container2">
                <div class="techSelect-result2">
                 <c:set var="techArr" value="${fn:split(r.tech,',')}"/>
              		<c:forEach var="tech" items="${techArr}">
             	 <span class="techSpan"><c:out value="${tech }"/></span>
             	 </c:forEach>
                </div>
              </div>
          </div>
			

          <div class="resume-basic-container-self">
            <p style="font-size: 24px; font-weight: bolder;">자기소개서</p>
            <div class="introduceself-container">
              <input class="form-control" type="text" placeholder="자소서 제목" aria-label="default input example" name="selfTitle" value="${r.selfTitle }">
              <br>
              <div class="form-floating">
                <textarea required="required" id="selfContent" name="selfContent" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px;resize:none;" >${r.selfContent }
                </textarea>
                <label for="floatingTextarea2">자소서 내용</label>
              </div>
            </div>
             
          </div>

          <div class="resume-basic-container-introcareer">
            <p style="font-size: 24px; font-weight: bolder;" >경력기술서</p>
            <div class="introduceself-container">
              <input value="${r.careerTitle }" class="form-control" type="text" placeholder="경력기술서 제목" aria-label="default input example" name="careerTitle">
              <br>
              <div class="form-floating">
                <textarea required="required" id="careerContent" name="careerContent" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px;resize:none;" >${r.careerContent }
                </textarea>
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
                  name="gitLink" value="${r.gitLink }">
                  </td>
                </tr>
                <tr>
                  <td>notion 주소</td>
                  <td>
                   <input style="width: 500px;" class="form-control" type="text"  aria-label="default input example"
                  name="notionLink" value="${r.notionLink }">
                  </td>
                </tr>
               <tr>
                  <td>blog 주소</td>
                  <td>
                   <input style="width: 500px;" class="form-control" type="text"  aria-label="default input example"
                  name="blogLink" value="${r.blogLink }">
                  </td>
                </tr>
              </table>
            </div>
          </div>
       
          
        </div>
        	<div class="quickmenu-container">
				<div class="quickmenu">
					<ul>
					
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="location.assign('${path }/member/memberInfoView.do?memberId=${loginMember.memberId}')">기본정보 수정</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="copyCertificateDiv();">+자격증</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="copyLanguageDiv();">+어학시험</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="insertResume();">이력서 저장</button></li>
					<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="location.assign('${path}/resume/memberResumeList.do?memberId=${loginMember.memberId}');">이력서 관리</button></li>
					</ul>
				</div>
			</div>        
      </div>
      </c:forEach>
     </c:if>
    </section>
       
<script type="text/javascript">
let memberId = "${loginMember.memberId}";

function copyCareerDiv(){
	$(".hiddenCareer").show();
}


$(document).ready(function(){
	
	var radio = $("input[name=academic]:checked").val();
	var career = $("input[name=career]:checked").val();
	
	
	if(radio != '대학/대학원' ){
		$("#uniTr1").hide();
		$("#uniTr2").hide();
		$("#uniTr3").hide();
	} 
	
	if(career != '경력' ){
		$("#careerTable").hide();		
		$("#addCareerformBtn").hide();
	} 
	$("input[name=academic]").click(function(){
		var val = $(this).val();
		
		if(val == '대학/대학원'){
			$("#uniTr1").show();
    		$("#uniTr2").show();
    		$("#uniTr3").show();
		}else{
			$("#uniTr1").hide();
    		$("#uniTr2").hide();
    		$("#uniTr3").hide();
		}
	});
	
	$("input[name=career]").click(function(){
		var val = $(this).val();
		
		if(val == '경력'){
			$("#careerTable").show();   	
			$("#addCareerformBtn").show();	
		}else{
			$("#careerTable").hide();
			$("#addCareerformBtn").hide();
		}
	});
});

/* function DropFile(dropAreaId, fileListId) {
	
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
 */	
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
                	$(".areaSelect-result-container2").html("");
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
              	  }
                });
                
           function deletHopeArea(e){
          	 console.log($(e).text());
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
         	  $(".techSelect-result-container2").html("");
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
      
      //경력사항 추가
      const addCareerformBtn=()=>{
        let copy = $($(".addform_")[0]).clone(true);
        copy.find(".deleteAddform").attr("onclick","deleteCareerAddform(this)");
        copy.find("input").val("");
        copy.find("#career1").remove();
        copy.find("#career2").hide();
        copy.find("#careerLabel2").hide();
        copy.find(".careerTitle_").remove();
        copy.find("#careerUpdateBtn").attr("onclick","insertCareerform(this);");
        copy.find("#careerUpdateBtn").html("등록");
        copy.find("#deleteCareerAddform").show();
        copy.find(".addform_").css("display","block");
		$($(".addform_").last()).after(copy);
		/* $(".addform_")[i].find("#career1").attr("name","career"+i);
		$(".addform_")[i].find("#career2").attr("name","career"+i); */
		
     } 
	          
	 //자격증 추가
	 const addCertificateformBtn=()=>{
        let copy = $($(".resume-basic-container-certificate")[0]).clone(true);
        copy.find("#updateCertifiBtn").attr("onclick","insertCertificateformBtn(this);");
        copy.find("#updateCertifiBtn").html("등록");
        copy.css("display","block");
        copy.find("input").val("");
        //자격증 새로 추가했을때 항목 삭제 함수로 변경해주기
        copy.find("#deletecertificateAddform").attr("onclick","deletecertificateAddform(this);");
        
		$($(".resume-basic-container-certificate").last()).after(copy); 
     }
	 
     
	 //어학시험
	  const addLanguageformBtn=()=>{
        let copy = $($(".resume-basic-container-language")[0]).clone(true);
        copy.find("#updateLanguageformBtn").attr("onclick","insertLanguageformBtn(this);");
        copy.find("#updateLanguageformBtn").html("등록");
        copy.css("display","block");
        copy.find("input").val("");
        
        //어학시험 새로 추가했을때 항목 삭제 함수로 변경해주기
        copy.find("#deletelanguageAddform").attr("onclick","deletelanguageAddform(this);");
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
		let upfile;
		let oriProfile;
		if($("input[name=upfile]")[0].files[0] == null || $("input[name=upfile]")[0].files[0] == 'undefined'){
			oriProfile = $("input[name=orifile]").val();
			formdata.append("oriProfile",oriProfile);
		}else{
			upfile = $("input[name=upfile]")[0].files[0];
			formdata.append("upfile",upfile);
		}
		
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
		 
		 //희망 근무조건
		 let workType = $("select[name=workType]").val();
		 let hopeSalary = $("input[name=hopeSalary]").val();
		 let workingArea = workingAreaArr;
		 
		 if(workingArea.length==0){
			 workingArea = $("input[name=workingAreaOri]").val();
		 }
		 
		 let hopePosition = $("select[name=hopePosition]").val();
		 
		 //보유기술
		 let tech = techArr;
		 if(tech.length == 0){
			 tech = $("input[name=techOri]").val();
		 }
		 
		 
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
				 alert("이력서 수정이 완료되었습니다.");
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
	 }
	 //어학시험 삭제
	  const deletelanguageAddform=(e)=>{
			let deletelanguageAddform = $(e);
			deletelanguageAddform.parent().parent().remove();
	 }
	
	 
    
    	$("input[name=assignedTask]").change(e=>{
    		alert("반드시 저장 버튼을 누르셔야 합니다!");
    	});
    
    	const insertCareerform=(e)=>{
    		
    		let btn = $(e);
			          		
    		let career = "경력";
    		console.log(career);
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
    				location.reload();
    			},error:data=>{
    				alert("등록 실패! 관리자에게 문의하세요 :(");
    			}
    		});
    	}
    	
    	//경력사항 수정
    	const updateCareerform=(e,i)=>{
    		let btn = $(e);
    		
  	
    			let careerNo = $(btn.parents('.resume-basic-container-career')).find('input[name=careerNo]').val();
        		let career = i==0?$(btn.parents('.resume-basic-container-career')).find('input[name=career]:checked').val() : "경력";        		
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
        		
            	if(career == "신입"){
            		let con = confirm("신입으로 수정할 경우 이전 경력이 전부 삭제됩니다. 신입으로 수정하시겠습니까?");           		
            		if(!con){
            			return;
            		}
            	}
        		$.ajax({
        			url:"${path}/resume/updateCareer.do",
        			type:"post",
        			data:{
        				resumeNo:resumeNo,
        				careerNo:careerNo,
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
        				alert("수정 완료");
        				$(btn.parents('.resume-basic-container-career')).find('.career_p').html("수정완료");
        				$(btn.parents('.resume-basic-container-career')).find('.career_p').css("color","green");
        				location.reload();
        			},error:data=>{
        				alert("수정 실패! 관리자에게 문의하세요 :(");
        			}
        		});
    		
    	}
    	
    	//경력사항 삭제
    	const deleteCareer =(e)=>{
    		let btn = $(e);
            let career = "${career1}";
            
            if(career == 1){
            	alert("경력이 1개일경우 수정을 이용해주세요.");
            	return;
            }
    		let careerNo = $(btn.parents('.resume-basic-container-career')).find('input[name=careerNo]').val();
    		
    		$.ajax({
    			url:"${path}/resume/deleteCareer.do",
    			type:"post",
    			data:{
    				careerNo:careerNo,
    			},
    			success:data=>{
    				alert("삭제 성공");
    				$(btn.parents('.resume-basic-container-career')).remove();
    				location.reload();
    			},error:data=>{
    				alert("삭제 실패! 관리자에게 문의하세요 :(");
    			}
    		});
    		
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
    				$(btn.parents('.resume-basic-container-certificate')).find('.career_c').html("등록완료");
    				$(btn.parents('.resume-basic-container-certificate')).find('.career_c').css("color","green");
    			},error:data=>{
    				alert("등록 실패! 관리자에게 문의하세요 :(");
    			}
    		});
    	}
    	
    	//자격증 수정
    	
    		const updateCertificate=(e)=>{
    		
    		let btn = $(e);
    		
    		let certificateNo =$(btn.parents('.resume-basic-container-certificate')).find('input[name=certificateNo]').val();
    		let certificateName = $(btn.parents('.resume-basic-container-certificate')).find('input[name=certificateName]').val();
    		let institution = $(btn.parents('.resume-basic-container-certificate')).find('input[name=institution]').val();
    		let acceptance = $(btn.parents('.resume-basic-container-certificate')).find('select[name=acceptance]').val();
    		let acquiredDate = $(btn.parents('.resume-basic-container-certificate')).find('input[name=acquiredDate]').val();
			
    		$.ajax({
    			url : "${path}/resume/updateCertificate.do",
    			type:"post",
    			data:{
    				certificateNo:certificateNo,
    				resumeNo:resumeNo,
    				certificateName:certificateName,
    				institution:institution,
    				acceptance:acceptance,
    				acquiredDate:acquiredDate
    			},
    			success:data=>{
    				alert("수정 완료");
    				$(btn.parents('.resume-basic-container-certificate')).find('.career_c').html("수정완료");
    				$(btn.parents('.resume-basic-container-certificate')).find('.career_c').css("color","green");
    				location.reload();
    			},error:data=>{
    				alert("수정 실패! 관리자에게 문의하세요 :(");
    			}
    		});
    	}
    	
    	//자격증 삭제
    	const deletecertificate=(e)=>{
    		
    		let btn = $(e);
    		let certificateNo =$(btn.parents('.resume-basic-container-certificate')).find('input[name=certificateNo]').val();
    		
    		$.ajax({
    			url:"${path}/resume/deleteCertificate.do",
    			type:"post",
    			data:{
    				certificateNo:certificateNo,
    			},
    			success:data=>{
    				alert("삭제 성공");
    				$(btn.parents('.resume-basic-container-certificate')).remove();
    			},error:data=>{
    				alert("삭제 실패! 관리자에게 문의하세요 :(");
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
    				$(btn.parents('.resume-basic-container-language')).find('.career_l').html("등록완료");
    				$(btn.parents('.resume-basic-container-language')).find('.career_l').css("color","green");
    				location.reload();
    			},error:data=>{
    				alert("등록 실패! 관리자에게 문의하세요 :(");
    			}
    			
    		});
    		
    	}
    	
    	//어학 시험 수정
    	const updateLanguageformBtn=(e)=>{
    		let btn=$(e);
    		
    		let languageTestNo = $(btn.parents('.resume-basic-container-language')).find('input[name=languagetestNo]').val();
    		let language = $(btn.parents('.resume-basic-container-language')).find('select[name=language]').val();
    		let testType = $(btn.parents('.resume-basic-container-language')).find('input[name=testType]').val();
    		let acqStatus = $(btn.parents('.resume-basic-container-language')).find('select[name=acqStatus]').val();
    		let score = $(btn.parents('.resume-basic-container-language')).find('input[name=score]').val();
    		let languageAeqDate = $(btn.parents('.resume-basic-container-language')).find('input[name=languageAeqDate]').val();
    		
    		
    		$.ajax({
    			
    			url : "${path}/resume/updateLanguage.do",
    			type:"post",
    			data:{
    				languageTestNo:languageTestNo,
    				resumeNo:resumeNo,
    				language:language,
    				testType:testType,
    				acqStatus:acqStatus,
    				score:score,
    				languageAeqDate:languageAeqDate
    			},
    			success:data=>{
    				alert("수정 완료");
    				$(btn.parents('.resume-basic-container-language')).find('.career_l').html("수정완료");
    				$(btn.parents('.resume-basic-container-language')).find('.career_l').css("color","green");
    				location.reload();
    			},error:data=>{
    				alert("수정 실패! 관리자에게 문의하세요 :(");
    			}
    			
    		});
    		
    	}
    	
    	
    	//어학 시험 삭제
    	const deletelanguage=(e)=>{
    		let btn=$(e);
    		let languageTestNo = $(btn.parents('.resume-basic-container-language')).find('input[name=languagetestNo]').val();
    		$.ajax({
    			
    			url : "${path}/resume/deletelanguage.do",
    			type:"post",
    			data:{
    				languageTestNo:languageTestNo,
    			},
    			success:data=>{
    				alert("삭제 완료");
    				$(btn.parents('.resume-basic-container-language')).remove();
    			},error:data=>{
    				alert("삭제 실패! 관리자에게 문의하세요 :(");
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