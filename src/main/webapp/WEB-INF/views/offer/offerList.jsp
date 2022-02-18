<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<%-- <c:if test="${not empty loginMember }">
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</c:if>
<c:if test="${not empty loginCompany }">
   <jsp:include page="/WEB-INF/views/common/CompanyHeader.jsp"/>
</c:if> --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/offer.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

   <!-- ======= Breadcrumbs Section ======= -->
   <section class="breadcrumbs">
      <div class="container">

         <div class="d-flex justify-content-between align-items-center">
            <h2>채용공고</h2>
            <ol>
               <li><a href="index.html">Home</a></li>
               <li>채용공고</li>
            </ol>
         </div>

      </div>
   </section>
   <!-- End Breadcrumbs Section -->

<section class="inner-page">
   <br><br>   
   <!-- ===== 포지션 탐색 버튼 ===== -->
<!--     <div class="margin">
       <h1>포지션 탐색</h1>
       
      <button class="btn btn-outline-primary">전체</button>
      <button class="btn btn-outline-primary">서버/백엔드 개발자</button>
      <button class="btn btn-outline-primary">프론트엔드 개발자</button>
      <button class="btn btn-outline-primary">웹 풀스택 개발자</button>
      <button class="btn btn-outline-primary">안드로이드 개발자</button>
      <button class="btn btn-outline-primary">IOS 개발자</button>
      <button class="btn btn-outline-primary">크로스플랫폼 앱 개발자</button>
      <button class="btn btn-outline-primary">게임 클라이언트 개발자</button>
      <button class="btn btn-outline-primary">게임 서버 개발자</button>
      <button class="btn btn-outline-primary">DBA</button>
      <button class="btn btn-outline-primary">빅데이터 엔지니어</button>
      <button class="btn btn-outline-primary">인공지능 / 머신러닝</button>
      <button class="btn btn-outline-primary">devops / 시스템 엔지니어</button>
      <button class="btn btn-outline-primary">정보보안 담당자</button>
      <button class="btn btn-outline-primary">QA 엔지니어</button>
      <button class="btn btn-outline-primary">개발 PM</button>
      <button class="btn btn-outline-primary">HW / 임베디드</button>
      <button class="btn btn-outline-primary">SW / 솔루션</button>
      <button class="btn btn-outline-primary">웹 퍼블리셔</button>
      <button class="btn btn-outline-primary">VR / AR / 3D</button>
      <button class="btn btn-outline-primary">기술지원</button>
   </div> -->
   <!-- End 포지션 탐색 버튼 -->
      
   <!-- ===== 지금뜨는 채용공고 ===== -->
    <div class="section-title" data-aos="fade-up">
          <h2>지금 뜨는 채용공고</h2>
          <p>* 가장 조회가 많이 된 TOP3 공고를 확인하세요</p>
    </div>
   
   <div id="hotHirepost" class="margin">
      <c:forEach var="hl" items="${hotList }">
         <div id="hirepost">
            <img class="offerImg" alt="등록이미지가 없습니다." src="${path}/resources/upload/offer/${hl.image }">
               <p class="companyName"><c:out value="${hl.companyName }"/></p>
               <p class="offerTitle"><a class="offerTitle" href="${path }/offer/offerView.do?offerNo=${hl.offerNo}"><c:out value="${hl.offerTitle }"/></a></p>
               <p class="offerTech">${fn:replace(hl.tech, ',', ' · ') }</p>
               <p class="offerInfo"><c:out value="${hl.location }"/> / <c:out value="${hl.carrer }"/></p>
         </div>
         
      </c:forEach>
   </div>
   <!-- ===== End 지금뜨는 채용공고 ===== -->

   <!-- ===== 채용공고 리스트 ===== -->
   <div class="margin">
     
      <div class="section-title" data-aos="fade-up">
          <h2>전체 채용공고</h2>
    </div>
      <!-- 채용공고 리스트 부분 -->
      <div id="hirepostList">
         <c:forEach var="o" items="${list }">
            <div id="hirepost">
               <img class="offerImg" alt="등록이미지가 없습니다." src="${path}/resources/upload/offer/${o.image }">
               <p class="companyName"><c:out value="${o.companyName }"/></p>
               <p class="offerTitle"><a class="offerTitle" href="${path }/offer/offerView.do?offerNo=${o.offerNo}"><c:out value="${o.offerTitle }"/></a></p>
               <p class="offerTech">${fn:replace(o.tech, ',', ' · ') }</p>
               <p class="offerInfo"><c:out value="${o.location }"/> / <c:out value="${o.carrer }"/></p>
            </div>
         </c:forEach>
            <!-- <div id="hirepost">
               <img alt="회사사진" src="">
               <p>회사이름</p>
               <p>채용공고 제목</p>
               <p>기술스택</p>
               <p>위치 및 경력</p>
            </div> -->
      </div>
      <!-- 페이징 바 -->
      <div id="pageBar">
         ${pageBar }
      </div>
      
   </div>
   <!-- End 채용공고 리스트 -->
    
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>