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
 <link href="${path}/resources/assets2/vendor/aos/aos.css" rel="stylesheet">
  <link href="${path}/resources/assets2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path}/resources/assets2/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${path}/resources/assets2/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${path}/resources/assets2/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${path}/resources/assets2/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${path}/resources/assets2/css/style.css" rel="stylesheet">
   <!-- ======= Breadcrumbs Section ======= -->
   <!-- <section class="breadcrumbs">
      <div class="container">

         <div class="d-flex justify-content-between align-items-center">
            <h2>채용공고</h2>
            <ol>
               <li><a href="index.html">Home</a></li>
               <li>채용공고</li>
            </ol>
         </div>

      </div>
   </section> -->
   <!-- End Breadcrumbs Section -->

<section class="inner-page">

<section id="services" class="services">
      <div class="container">
		    <div class="section-title" data-aos="fade-up">
		          <h2>지금 뜨는 채용공고</h2>
		          <p>* 가장 조회가 많이 된 TOP3 공고를 확인하세요</p>
		    </div>
		    
		<div class="row">
			<c:forEach var="hl" items="${hotList }" varStatus="i">
					<c:choose>
						<c:when test="${not empty loginMember }">
							<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" style="margin-left:30px; width: 400px;">
								<div class="icon-box" data-aos="fade-up" data-aos-delay="${i.index+1}00" style="cursor: pointer;" onclick="location.assign('${path }/offer/loginOfferView.do?offerNo=${hl.offerNo}&&memberId=${loginMember.memberId }')">
									<div class="" style="width: 250px; height: 150px">
										<img src="${path}/resources/upload/company/${hl.favicon }" style="width: 250px; height: 150px">
									</div>
									<br>
									<h4 class="title"><c:out value="${hl.companyName }"/></h4>
									<p class="description"><c:out value="${hl.offerTitle }"/></p>
									<p class="description">${fn:replace(hl.tech, ',', ' · ') }</p>
									<p class="description"><c:out value="${hl.location }"/> / <c:out value="${hl.carrer }"/></p>
									<p class="description">마감일 : <c:out value="${hl.endDate }"/></p>
							  	</div>
						  	</div>
							</c:when>
							<c:when test="${empty loginMember }">
								<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" style="margin-left:30px; width: 400px;">
									<div class="icon-box" data-aos="fade-up" data-aos-delay="${i.index+1}00" style="cursor: pointer;" onclick="location.assign('${path }/offer/offerView.do?offerNo=${hl.offerNo}')">
										<div class="" style="width: 250px; height: 150px">
											<img src="${path}/resources/upload/company/${hl.favicon }" style="width: 250px; height: 150px">
										</div>
										<br>
										<h4 class="title"><c:out value="${hl.companyName }"/></h4>
										<p class="description"><c:out value="${hl.offerTitle }"/></p>
										<p class="description">${fn:replace(hl.tech, ',', ' · ') }</p>
										<p class="description"><c:out value="${hl.location }"/> / <c:out value="${hl.carrer }"/></p>
										<p class="description">마감일 : <c:out value="${hl.endDate }"/></p>
								  	</div>
							  	</div>
							</c:when>
						</c:choose>
				</c:forEach>
			</div>
        </div>
   
	<%-- 	  <div class="row">
		      <c:forEach var="hl" items="${hotList }" varStatus="i">
			          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" style="margin-left:30px; width: 400px;">
			            <div class="icon-box" data-aos="fade-up" data-aos-delay="${i.index+1}00" style="width: 100%; cursor: pointer;" onclick="location.assign('${path }/offer/offerView.do?offerNo=${hl.offerNo}')">
			               <!-- DB에서 가져오게 -->
			              <!-- <div class="icon"><i class="bx bxl-dribbble"></i></div> -->
			              <div class="" style="width: 330px; height: 200px">
			              <img src="${path}/resources/upload/offer/${hl.image }" style="width: 250px; height: 150px"></div>
			              <h4 class="title" style="font-size: 30px;"><c:out value="${hl.companyName }"/></h4>
			              <p class="description" style="font-size: 20px; margin-top: 20px; "><c:out value="${hl.offerTitle }"/></p>
			              <p class="description" style="font-size: 17px;">${fn:replace(hl.tech, ',', ' · ') }</p>
			              <p class="description" style="font-size: 17px;"><c:out value="${hl.location }"/> / <c:out value="${hl.carrer }"/></p>
			              <p class="description" style="font-size: 17px;">마감일 : <c:out value="${hl.endDate }"/></p>
			            </div>
			          </div>
		      </c:forEach>
		      </div> --%>
		   </div>
		   <%-- <a style="font-size: 20px;" class="description" href="${path }/offer/offerView.do?offerNo=${hl.offerNo}"></a> --%>
		
    </section><!-- End 마감임박 공고 -->
   <!-- ===== End 지금뜨는 채용공고 ===== -->

   <!-- ===== 채용공고 리스트 ===== -->
   <div class="margin">
     
     <div class="section-title" data-aos="fade-up" style="margin-top: 30px;">
          <h2>전체 채용공고</h2>
          <p>* people119에 있는 모든 공고를 확인하세요</p>
    </div>
      <!-- 채용공고 리스트 부분 -->
      <section id="featured-services" class="featured-services">
      	<div class="container" data-aos="fade-up">
         
         <div class="row">
         <c:forEach var="o" items="${list }" varStatus="i">
            <%-- <div id="hirepost">
               <img class="offerImg" alt="등록이미지가 없습니다." src="${path}/resources/upload/offer/${o.image }">
               <p class="companyName"><c:out value="${o.companyName }"/></p>
               <p class="offerTitle"><a class="offerTitle" href="${path }/offer/offerView.do?offerNo=${o.offerNo}"><c:out value="${o.offerTitle }"/></a></p>
               <p class="offerTech">${fn:replace(o.tech, ',', ' · ') }</p>
               <p class="offerInfo"><c:out value="${o.location }"/> / <c:out value="${o.carrer }"/></p>
            </div> --%>
            <c:choose>
		      		<c:when test="${o.status eq 1 }">
		      			<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" style="margin-top:20px;">
							<div class="icon-box" data-aos="fade-up" data-aos-delay="${i.index+1}00" style="cursor: pointer;" onclick="location.assign('${path }/offer/offerView.do?offerNo=${o.offerNo}')">
								<div class="" style="width: 250px; height: 150px">
									<img src="${path}/resources/upload/company/${o.favicon }" style="width: 250px; height: 150px">
								</div>
								<br>
								<h4 class="title"><c:out value="${o.companyName }"/></h4>
								<p class="description"><c:out value="${o.offerTitle }"/></p>
								<p class="description">${fn:replace(o.tech, ',', ' · ') }</p>
								<p class="description"><c:out value="${o.location }"/> / <c:out value="${o.carrer }"/></p>
								<p class="description red">채용이 종료된 공고입니다</p>
						  	</div>
						</div>
		      		</c:when>
		      		<c:when test="${o.status eq 0 }">
						<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" style="margin-top:20px;">
						<c:choose>
							<c:when test="${not empty loginMember }">
								<div class="icon-box" data-aos="fade-up" data-aos-delay="${i.index+1}00" style="cursor: pointer;" onclick="location.assign('${path }/offer/loginOfferView.do?offerNo=${o.offerNo}&&memberId=${loginMember.memberId }')">
									<div class="" style="width: 250px; height: 150px">
										<img src="${path}/resources/upload/company/${o.favicon }" style="width: 250px; height: 150px">
									</div>
									<br>
									<h4 class="title"><c:out value="${o.companyName }"/></h4>
									<p class="description"><c:out value="${o.offerTitle }"/></p>
									<p class="description">${fn:replace(o.tech, ',', ' · ') }</p>
									<p class="description"><c:out value="${o.location }"/> / <c:out value="${o.carrer }"/></p>
									<p class="description">마감일 : <c:out value="${o.endDate }"/></p>
							  	</div>
							</c:when>
							<c:when test="${empty loginMember }">
								<div class="icon-box" data-aos="fade-up" data-aos-delay="${i.index+1}00" style="cursor: pointer;" onclick="location.assign('${path }/offer/offerView.do?offerNo=${o.offerNo}')">
									<div class="" style="width: 250px; height: 150px">
										<img src="${path}/resources/upload/company/${o.favicon }" style="width: 250px; height: 150px">
									</div>
									<br>
									<h4 class="title"><c:out value="${o.companyName }"/></h4>
									<p class="description"><c:out value="${o.offerTitle }"/></p>
									<p class="description">${fn:replace(o.tech, ',', ' · ') }</p>
									<p class="description"><c:out value="${o.location }"/> / <c:out value="${o.carrer }"/></p>
									<p class="description">마감일 : <c:out value="${o.endDate }"/></p>
							  	</div>
							</c:when>
						</c:choose>
						</div>
		      		</c:when>
		      	</c:choose>
            
            
         </c:forEach>
        </div>
         
	          
        
           
      </div>
    </section><!-- End Featured Services Section -->
      <!-- 페이징 바 -->
      <%-- <div id="pageBar">
         ${pageBar }
      </div> --%>
      
   </div>
   <!-- End 채용공고 리스트 -->
    
</section>



  <script src="${path}/resources/assets2/vendor/purecounter/purecounter.js"></script>
  <script src="${path}/resources/assets2/vendor/aos/aos.js"></script>
  <script src="${path}/resources/assets2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/resources/assets2/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${path}/resources/assets2/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${path}/resources/assets2/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${path}/resources/assets2/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="${path}/resources/assets2/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${path}/resources/assets2/js/main.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>