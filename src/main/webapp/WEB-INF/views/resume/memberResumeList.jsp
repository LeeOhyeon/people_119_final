<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <link href="${path }/resources/assets/css/resume-manage.css" rel="stylesheet">
  <link href="${path }/resources/assets/css/mypage.css" rel="stylesheet">
  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>마이페이지</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>마이페이지</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->
    <section class="inner-page">
      <div class="container">
        <div class="mypage-container">
          <div class="link-tab">
            <ul class="link-tab-ul">
              <li class="link-tab-li"><a href="#"><i class="fas fa-home"></i> My Info</a></li>
              <li><i class="fas fa-pen"></i> 이력서 <span id="resumt-toggle"><i class="fas fa-angle-down"></i></span>
                <ul>
                  <li class="resume-link"><a href="${path}/resume/insertResumeView.do?memberId=${loginMember.memberId}">이력서 등록</a></li>
                  <li class="resume-link"><a href="${path}/resume/memberResumeList.do?memberId=${loginMember.memberId}">이력서 관리</a></li>
                </ul>
              </li>
               <li class="link-tab-li"><a href="${path}/member/memberScrapList.do?memberId=${loginMember.memberId}"><i class="fas fa-star"></i>채용공고 스크랩</a></li>
              <li class="link-tab-li"><a href="${path}/member/memberlikeCompanyList.do?memberId=${loginMember.memberId}"><i class="fas fa-star"></i>관심 기업</a></li>
               <li class="link-tab-li"><a href="${path }/review/enrollCompanyReview.do?"><i class="fa-solid fa-microphone-stand"></i> 기업 리뷰 작성하기</a></li>
              <li class="link-tab-li"><a href="${path }/applicant/applyList.do?memberId=${loginMember.memberId}"><i class="fas fa-location-arrow"></i> 지원 내역</a></li>
            </ul>
          </div>
          <div class="update-info-container">
            <div>
              <h1><strong>이력서 관리</strong></h1>
            </div>
            <div class="resume-btn">
            <a href="${path}/resume/insertResumeView.do?memberId=${loginMember.memberId}">
              <button type="button" class="btn btn-primary" style="width:170px">
              이력서 등록하기</button></a>
            </div>
            <div class="total-count">
              <p><strong>총 <c:out value="${countList }"/>건</strong></p>
            </div>
            
            
              <c:if test="${countList == 0}">
              	<div class="resume-info">
              		<div>등록된 이력서가 없습니다. 이력서를 등록해 주세요.</div>
              	</div>
              </c:if>
            
            <c:if test="${resumeList ne null}">
	            <c:forEach var="rList" items="${resumeList }">
		            <c:if test="${rList.resumeTitle ne null }">
		            <div class="resume-info">
		              <div class="resume-title">
		              	<h3 style="display: inline-block;"><a href="${path }/resume/resumeDetailView.do?resumeNo=${rList.resumeNo}">  
		                <strong><c:out value="${rList.resumeTitle }"/></strong>
		              	</a></h3>
		              	 <div class="resume-del">
		                  <button type="button"style="width:100px; background-color: white; border: none; font-size: 20px"
		                  onclick="if(confirm('정말 삭제하시겠습니까?')){
		                  location.assign('${path}/resume/deleteResume.do?resumeNo=${rList.resumeNo }&&memberId=${rList.memberId }')};"
		                  ><i class="fas fa-trash-alt"></i></button>
		                </div>
		              </div>
		              <div class="resume">
		                <div class="information">
		                  <div>
		                    <h5><strong>근무조건 : <c:out value="${rList.workType }"/></strong></h5>
		                  </div>
		                  <div>
		                    <h5><strong>희망연봉 : <c:out value="${rList.hopeSalary }"/></strong></h5>
		                  </div>
		                </div>
		                <div class="hope-info">
		                  <div>
		                    <h5><strong>희망 직무 : <c:out value="${rList.hopePosition }"/></strong></h5>
		                  </div>
		                  <div>
		                    <h5><strong>희망지역 : <c:out value="${rList.workingArea }"/></strong></h5>
		                     
		                  </div>
		                </div>
		               
		              </div>
		              
		            </div>
		            </c:if>
	   		 </c:forEach>
   		 </c:if>
          </div>
        </div>
        <div>
        	<div style="margin-top: 30px;">${pageBar }</div>
        </div>
      </div>
    </section>

	<script type="text/javascript">
		
		
	</script>

  </main><!-- End #main -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>