<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/assets/css/resumeDetailView.css" rel="stylesheet">
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
        <c:if test="${resume ne null }">
        <c:forEach var="r" items="${resume}">
        	<c:set var="resumeNo" value="${r.resumeNo }"/>
          <div class="resume-basic-container">
           <div class="resume-basic-container-title">
            <h3 style="font-size: 40px; font-weight: bolder;">
				<c:out value="${r.resumeTitle }"/>
			</h3>
          </div>
            <div class="resume-basic-info">
              <div class="profileImg">
              	<div class="upload-box">
				  <div id="drop-file" class="drag-file">
				  	<c:if test="${r.profile ne null }">
				    <img src="${path }/resources/upload/resume/${r.profile}" width="100%" height="100%" alt="이미지 없음">
				  	</c:if>
				  	<c:if test="${r.profile eq null }">
				   		등록된 사진이<br>없습니다.
				  	</c:if>
				  </div>
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
         
         
          <div class="resume-basic-container-elementary">
            <p style="font-size: 30px; font-weight: bolder; margin-bottom: 0px;">학력
            <div class="school-input-container">
            	<div class="elementary-container">
            		<table class="table table-bordered align-middle">	
            				<tr class="table-light align-middle" style="border-top: 3px solid black">
            					<th scope="col">최종 학력</th>
            					<th scope="col">학교명</th>
            					<th scope="col">지역</th>
            					<c:if test="${r.academic eq '대학/대학원' }">
            					<c:if test="${r.major ne null }"><th scope="col">전공</th></c:if>
	            				<c:if test="${r.dayNight ne null }"><th scope="col">주/야간</th></c:if>
	            				<c:if test="${r.grades ne null }"><th scope="col">학점</th></c:if>
	            				</c:if>
            					<th scope="col">입학날짜</th>
            					<th scope="col">졸업날짜</th>
            				</tr>
	            			<tr>
	            				<td><c:out value="${r.academic }"/></td>
	            				<td><c:out value="${r.schoolName }"/></td>
	            				<td><c:out value="${r.schoolArea }"/></td>
	            				<c:if test="${r.academic eq '대학/대학원' }">
	            				<c:if test="${r.major ne null }"><td><c:out value="${r.major }"/></td></c:if>
	            				<c:if test="${r.dayNight ne null }"><td><c:out value="${r.dayNight }"/></td></c:if>
	            				<c:if test="${r.grades ne null }"><td><c:out value="${r.grades }"/>/4.5</td></c:if>
	            				</c:if>
	            				<td><c:out value="${r.admissionDate }"/></td>
	            				<td><c:out value="${r.graduationDate }"/></td>
	            			</tr>
	            		</table>
            	</div>
            </div>
            
           
          </div>
	
	<c:if test="${r.career ne null}">
		<c:forEach var="c" items="${r.career }" begin="0" end="0">
			<c:if test="${c.career eq null }">
           		
			</c:if>
			<c:if test="${c.career ne '신입' }">
			<c:if test="${c.career eq '경력' }">
          <div class="resume-basic-container-career addform_">
            <div class="resume-career-info">
             <p style="font-size: 30px; font-weight: bolder;">경력
            	<span style="float:right;" class="deleteAddform" id="deleteCareerAddform" onclick="deleteCareerAddform(this);"><i class="fas fa-times"></i></span>
            </p>
            
              <div class="career-info">
                <table  class="table table-bordered align-middle">
                		<tr class="table-light align-middle" style="border-top: 3px solid black">
                			<th scope="col" style="width:260px;">근무기간</th>
                			<th scope="col">회사명</th>
                			<th scope="col">부서/직급/직책</th>
                			<th scope="col">지역</th>
                			<th scope="col">연봉</th>
                		</tr>
         
                	<c:forEach var="c" items="${r.career }">
                	 <c:if test="${c.career eq '경력' }">
                		<tr>
                			<td rowspan="2"><c:out value="${c.joinDate }"/> ~ <c:out value="${c.regDate }"/></td>
                			<td><c:out value="${c.companyName }"/></td>
                			<td><c:out value="${c.department }"/>/ <c:out value="${c.rank }"/>/  <c:out value="${c.position }"/></td>
                			<td><c:out value="${c.deptLocation }"/></td>
                			<td><c:out value="${c.annualIncome }"/> 만원</td>
                		</tr>
                		<tr>
                			<td colspan="4" style="text-align: left; padding: 25px;">
                			<span class="assignedTaskSpan">담당업무</span> <c:out value="${c.assignedTask }"/><br><br>
                			<span class="assignedTaskSpan">퇴사사유</span> <c:out value="${c.regReason }"/>
                			</td>
                		</tr>
                		</c:if>
                	 </c:forEach>
                </table>
              </div>
            </div>
          </div>
           </c:if>
          </c:if>
         
          </c:forEach>
           </c:if>
           
           
          <div class="resume-basic-container-hope">
            <p style="font-size: 30px; font-weight: bolder;">희망 근무조건</p>
            <div class="hope-worktype">
             	 <table  class="table table-bordered align-middle" >
                		<tr class="table-light align-middle" style="border-top: 3px solid black">
                			<th scope="col" style="width:260px;">근무형태</th>
                			<th scope="col">희망연봉</th>
                			<th scope="col">근무지역</th>
                			<th scope="col">포지션</th>
                		</tr>
						<tr>
							<td><c:out value="${r.workType }"/></td>
							<td><c:out value="${r.hopeSalary }"/> 만원</td>
							<td><c:out value="${r.workingArea }"/></td>
							<td><c:out value="${r.hopePosition }"/></td>
						</tr>                
             </table>
            </div>
          </div>
          
          <c:if test="${r.certificate ne null }">
           <c:forEach var="certi" items="${r.certificate }" begin="0" end="0">
          	<c:if test="${certi.certificateName ne null }">
	          <div class="resume-basic-container-certificate">
	            <p style="font-size: 30px; font-weight: bolder;">자격증</p>
	            <div class="certificate-container">
	            	<table  class="table table-bordered align-middle">
	                		<tr class="table-light align-middle" style="border-top: 3px solid black">
	                			<th scope="col" style="width:260px;">자격증명</th>
	                			<th scope="col" style="width: 300px;">발행처</th>
	                			<th scope="col">합격구분</th>
	                			<th scope="col">취득일</th>
	                		</tr>
	                	 <c:forEach var="certi" items="${r.certificate }">
							<tr>
								<td><c:out value="${certi.certificateName}"/></td>
								<td><c:out value="${certi.institution}"/></td>
								<td><c:out value="${certi.acceptance}"/></td>
								<td><c:out value="${certi.acquiredDate}"/></td>
							</tr>      
						</c:forEach>          
	             </table>
	            </div>
	          </div>
	          </c:if>
	          </c:forEach>
	          </c:if>
	          
	    <c:if test="${r.lang ne null }">      
	   <c:forEach var="l" items="${r.lang }" begin="0" end="0"> 
	     <c:if test="${l.language ne null }">     
          <div class="resume-basic-container-language">
           	 <p style="font-size: 30px; font-weight: bolder;">어학시험</p>
           	 <div class="language-container">
              <table  class="table table-bordered align-middle">
                		<tr class="table-light align-middle" style="border-top: 3px solid black">
                			<th scope="col" style="width:200px;">언어</th>
                			<th scope="col" style="width:150px;">시험종류</th>
                			<th scope="col">점수</th>
                			<th scope="col">취득여부</th>
                			<th scope="col">취득일</th>
                		</tr>
                	  <c:forEach var="l" items="${r.lang }">
						<tr>
							<td><c:out value="${l.language}"/></td>
							<td><c:out value="${l.testType}"/></td>
							<td><c:out value="${l.score}"/></td>
							<td><c:out value="${l.acqStatus}"/></td>
							<td><c:out value="${l.languageAeqDate}"/></td>
						</tr>      
					</c:forEach>          
             </table>
            </div>
          </div>
		</c:if>
		</c:forEach>
		</c:if>
		
	
          <div class="resume-basic-container">
            <p style="font-size: 30px; font-weight: bolder;border-bottom: 3px solid black">보유기술</p>
            <div class="tech-container" >
              <c:set var="techArr" value="${fn:split(r.tech,',')}"/>
              <c:forEach var="tech" items="${techArr}">
              <span class="techSpan"><c:out value="${tech }"/></span>
              </c:forEach>
            </div>
          </div>
			
		 <p style="font-size: 30px; font-weight: bolder;">주소</p>
          <div class="resume-basic-container-link">
            <div class="certificate-container">
            	 <table  class="table table-bordered align-middle">
                		<tr class="table-light align-middle" style="border-top: 3px solid black"> 
                			<th scope="col">github</th>
                			<th scope="col">notion</th>
                			<th scope="col">blog</th>
                		</tr>
						<tr>
							<td><c:out value="${r.gitLink }"/></td>
							<td><c:out value="${r.notionLink }"/></td>
							<td><c:out value="${r.blogLink }"/></td>
						</tr>      
             </table>
            </div>
          </div>	
			
		<c:if test="${r.selfTitle ne null}">	
		  <p style="font-size: 30px; font-weight: bolder;">자기소개서</p>
          <div class="resume-basic-container-self">
            <div class="introduceself-container">
              <div class="selfTitle">
              	<c:out value="${r.selfTitle }"/>
              </div>
              <div class="selfContent">
                <c:out value="${r.selfContent }"/>
              </div>
            </div>
          </div>
          </c:if>
          
          <c:if test="${r.careerTitle ne null}">
 		  <p style="font-size: 30px; font-weight: bolder;" >경력기술서</p>
          <div class="resume-basic-container-introcareer">
            <div class="introduceself-container">
            	<div class="selfTitle">
	            	<c:out value="${r.careerTitle }"/>
            	</div>
              	<div class="selfContent">
                	<c:out value="${r.careerContent }"/>
              	</div>
            </div>
          </div>
		</c:if>          
          
         <c:set var="resumeNo" value="${r.resumeNo }"/>
         </c:forEach>
         </c:if>
          
        </div>
        	<div class="quickmenu-container">
				<div class="quickmenu">
					<ul>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="location.assign('${path }/resume/updateResumeView.do?resumeNo=${resumeNo}');">이력서 수정</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="location.assign('${path }/member/memberInfoView.do?memberId=${loginMember.memberId}');">기본정보 수정</button></li>
						<li><button type="button" class="btn btn-outline-primary quickmenuBtn" onclick="if(confirm('정말 삭제하시겠습니까?')){
                  location.assign('${path}/resume/deleteResume.do?resumeNo=${resumeNo }&&memberId=${loginMember.memberId }')};">이력서 삭제</button></li>
					</ul>
				</div>
			</div>        
      </div>
      
    </section>
	

<script>
    	
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