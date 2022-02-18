<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/companyHeader.jsp"/>
<link href="${path }/resources/assets/css/companyMypage.css" rel="stylesheet">

	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>MyPage</h2>
				<ol>
					<li><a href="companyIndex.html">Home</a></li>
					<li>MyPage</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs Section -->

	<section>
      <div class="container">
        <div class="mypage-container">
          <div class="link-tab">
            <ul class="link-tab-ul">
              <li><i class="fas fa-building"></i> 기업정보 <span id="resumt-toggle"><i class="fas fa-angle-down"></i></span>
              	<ul>
                  <li class="resume-link"><a href="${path }/company/companyMypage.do?companyId=${loginCompany.companyId}">기업정보 보기</a></li>
                  <li class="resume-link"><a href="${path }/company/updateCompany.do?companyId=${loginCompany.companyId}">기업정보 수정</a></li>
                  <li class="resume-link"><a href="#">비밀번호 변경</a></li>
                </ul>
              </li><br><br>
              <li><i class="fas fa-pen"></i> 채용공고 관리 <span id="resumt-toggle"><i class="fas fa-angle-down"></i></span>
                <ul>
                  <li class="resume-link"><a href="${path }/offer/enrollOffer.do">채용공고 등록</a></li>
                  <li class="resume-link"><a href="#">채용공고 관리</a></li>
                </ul>
              </li><br>
              <li class="link-tab-li"><a href="#"><i class="fas fa-star"></i> 지원자 관리</a></li>
              <li class="link-tab-li"><a href="#"><i class="fas fa-location-arrow"></i> 인재 검색</a></li>
              <li class="link-tab-li"><a href="#"><i class="far fa-calendar-alt"></i> 면접제안 관리</a></li>
            </ul>
          </div>
          
          
          <div class="update-info-container">
            <div class="info-title">
              우리 기업정보 보기
            </div>
            <div class="info-update">
              <div class="info_image">
                <img src="" alt="">
              </div>
              <div class="member_info_container">
                <div style="font-size: 20px; font-weight: bold;margin-top: 50px; margin-bottom: 20px;">
                  기본 정보
                </div>
                <div class="member_info">
                <div class="info-subtitle">
                	회사명
                </div>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="회사명" aria-label="Recipient's username"
                      aria-describedby="button-addon2" value="${loginCompany.companyName }" disabled>
                  </div>
                </div>
                <div class="member_info">
                <div class="info-subtitle">
                	사업자번호
                </div>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="사업자번호" aria-label="Recipient's username"
                      aria-describedby="button-addon2" value="${loginCompany.businessNumber }" disabled>
                  </div>
                </div>
                <div class="member_info">
                <div class="info-subtitle">
                	대표
                </div>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="대표" aria-label="Recipient's username"
                      aria-describedby="button-addon2" value="${loginCompany.ceoName }" disabled>
                  </div>
                </div>
                <div class="member_info">
                <div class="info-subtitle">
                	회사규모
                </div>
                  <div class="input-group mb-3">
                  	<c:choose>
                  		<c:when test="${loginCompany.companySize eq 1 }">
                  			<input type="text" class="form-control" placeholder="기업규모" aria-label="Recipient's username"
								aria-describedby="button-addon2" value="스타트업" disabled>
                  		</c:when>
                  		<c:when test="${loginCompany.companySize eq 2 }">
                  			<input type="text" class="form-control" placeholder="기업규모" aria-label="Recipient's username"
								aria-describedby="button-addon2" value="중소기업" disabled>
                  		</c:when>
                  		<c:when test="${loginCompany.companySize eq 3 }">
                  			<input type="text" class="form-control" placeholder="기업규모" aria-label="Recipient's username"
								aria-describedby="button-addon2" value="중견기업" disabled>
                  		</c:when>
                  		<c:when test="${loginCompany.companySize eq 4 }">
                  			<input type="text" class="form-control" placeholder="기업규모" aria-label="Recipient's username"
								aria-describedby="button-addon2" value="대기업" disabled>
                  		</c:when>
                  	</c:choose>
                  </div>
                </div>
    
               <div class="member_info">
               <div class="info-subtitle">
                	회사주소
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="주소 : API사용예정" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${loginCompany.companyAddress }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	설립년도
                </div>
                <div class="input-group mb-3">
                  <input type="date" class="form-control" placeholder="설립년도" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${loginCompany.establishment }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	제공하는 서비스
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="제공하는 서비스" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${loginCompany.service }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	직원수
                </div>
                <div class="input-group mb-3">
                  <input type="number" class="form-control" placeholder="직원수" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${loginCompany.employeeNumber }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	회사 홈페이지 URL 주소
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="기업 홈페이지 url" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${loginCompany.companyUrl }" disabled>
                </div>
              </div>
              <div style="font-size: 20px; font-weight: bold; margin-top: 50px; margin-bottom: 20px;">
                이미지 파일
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	파비콘 이미지
                </div>
                <div class="input-group mb-3">
                  <img alt="등록된 사진이 없습니다." src="/resources/upload/company/${loginCompany.favicon }" style="width: 100px; height: 100px;">
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	회사 이미지
                </div>
                <div class="input-group mb-3">
                  <img alt="등록된 사진이 없습니다." src="/resources/upload/company/${loginCompany.companyImage }" style="width: 800px; height: 400px;">
                </div>
              </div>
              <div style="font-size: 20px; font-weight: bold; margin-top: 50px; margin-bottom: 20px;">
                담당자 정보
              </div>
              <div class="member_info">
              <div class="info-subtitle">
                	담당자 이름
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="담당자 이름" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${loginCompany.managerName }" disabled>
                </div>
              </div>
              <div class="member_info">
              <div class="info-subtitle">
                	담당자 연락처
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="담당자 연락처" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${loginCompany.managerPhone }" disabled>
                </div>
              </div>

              </div>
            </div>
          </div>
        </div>
        <!-- <button class="btn btn-outline-secondary" type="button" id="button-addon2">수정</button> -->
      </div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>