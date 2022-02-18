<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/companyReview.css" rel="stylesheet">

	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>기업리뷰 상세보기</h2>
				<ol>
					<li><a href="${path }">Home</a></li>
					<li>기업리뷰 상세보기</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs Section -->

	<section class="inner-page">
		<div class="content">
			<div class="layout">
				<div class="inner">
					<div class="company_info">
						<div class="logo">
							<img class="logoimg" alt="사진드러갈거야" src="${path}/resources/upload/company/${company.companyImage }">
							<div class="star-point">
								<span class="currentpoint"><c:out value="${percentCounts.STARPOINT }"/></span><span class="maxpoint"> / 5</span>
							</div>
							<div class="star-ratings">
								<div class="star-ratings-fill space-x-2 text-lg" style="width: ${percentCounts.STARRATING}%">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<div class="star-ratings-base space-x-2 text-lg">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
							</div>
						</div>
						<div class="title">
							<a class="companyName" href=""><c:out value="${company.companyName }"/></a>
							<a href=""><span>채용중</span><span><c:out value=""/></span></a>
							<a href="">인터뷰 몇개</a>
						</div>
						<div class="subTitle">
							<div class="sub"><c:out value="${company.service }"/></div>
							<div class="sub">
								<c:choose>
									<c:when test="${company.companySize eq 1 }">스타트업</c:when>
									<c:when test="${company.companySize eq 2 }">중소기업</c:when>
									<c:when test="${company.companySize eq 3 }">중견기업</c:when>
									<c:when test="${company.companySize eq 4 }">대기업</c:when>
								</c:choose>
							</div>
							<div class="sub">직원수<c:out value="${company.employeeNumber }"/>명</div>
							<div class="sub_end"><c:out value="${company.ceoName }"/></div>
						</div>
						<div class="best">
							<span>1번</span>
							<span>2번</span>
							<span>3번</span>
							<span>4번</span>
						</div>
					</div>
					
					<div class="review_box">
						<div class="review_content">
							<h4 class="title">전체 리뷰 통계</h4>
							<div class="wrap_card">
								<div class="card">
									<span class="title"><strong>Q 회의는 얼마나 자주하나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MEETING1}%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MEETING1 }% 필요할때만 진행"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MEETING2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MEETING2  }% 주 1~2회"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MEETING3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MEETING3 }% 주 3~4회"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MEETING4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MEETING4 }% 매일"/>
									</div>
								</div>
								<div class="card">
									<span class="title"><strong>Q 회식주기는 어떤가요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.DRINKINGCYCLE1}%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.DRINKINGCYCLE1 }% 연 1~2번"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.DRINKINGCYCLE2}%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.DRINKINGCYCLE2 }% 3~4개월에 한번"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.DRINKINGCYCLE3}%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.DRINKINGCYCLE3 }% 매달 진행"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.DRINKINGCYCLE4}%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.DRINKINGCYCLE4 }% 필요할 때 진행"/>
									</div>
								</div>
								<div class="card">
									<span class="title"><strong>Q 회식은 어떻게 진행되나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WAYOFDRINKING1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WAYOFDRINKING1 }% 간단하게 식사만"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WAYOFDRINKING2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WAYOFDRINKING2 }% 회식은 술과 함께"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WAYOFDRINKING3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WAYOFDRINKING3 }% 문화 회식을 즐겨요"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 연차는 어떻게 사용하나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WAYOFVACATION1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WAYOFVACATION1 }% 자유롭게 사용"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WAYOFVACATION2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WAYOFVACATION2 }% 눈치보며 사용"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WAYOFVACATION3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WAYOFVACATION3 }% 잘 사용하지 못해요"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 연차를 몇일 정도 사용하나요? (1년기준)</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NUMBEROFAVGVACATION1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NUMBEROFAVGVACATION1 }% 15일 이상"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NUMBEROFAVGVACATION2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NUMBEROFAVGVACATION2 }% 10~14일"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NUMBEROFAVGVACATION3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NUMBEROFAVGVACATION3 }% 5~9일"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NUMBEROFAVGVACATION4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NUMBEROFAVGVACATION4 }% 0~4일"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 직원 성비가 어떻게 되나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.GENDERRATIO1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.GENDERRATIO1 }% 남자가 많아요"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.GENDERRATIO2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.GENDERRATIO2 }% 여자가 많아요"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.GENDERRATIO3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.GENDERRATIO3 }% 비슷해요!"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 출근시간이 자유로운 편인가요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.FREEATTENDANCE1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.FREEATTENDANCE1 }% 유연근무제 시행중!"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.FREEATTENDANCE2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.FREEATTENDANCE2 }% 정해진 시간에만 출근"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.FREEATTENDANCE3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.FREEATTENDANCE3 }% 재택근무 진행"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 회사 직원의 평균 연령대는 어떤가요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.AVARAGEOFAGE1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.AVARAGEOFAGE1 }% 20대"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.AVARAGEOFAGE2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.AVARAGEOFAGE2 }% 30대"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.AVARAGEOFAGE3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.AVARAGEOFAGE3 }% 40대 이상"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 출근 복장은 어떤가요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.CLOTHES1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.CLOTHES1 }% 칼정장"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.CLOTHES2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.CLOTHES2 }% 세미정장"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.CLOTHES3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.CLOTHES3 }% 캐주얼 복장"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 워라밸이 잘 지켜지나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WORKLIFEBALANCE1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WORKLIFEBALANCE1 }% 그럼요! 항상 칼퇴합니다 :)"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WORKLIFEBALANCE2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WORKLIFEBALANCE2 }%  어느 정도 지켜지기는 합니다"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.WORKLIFEBALANCE3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.WORKLIFEBALANCE3 }% 아니요, 지켜지지 않습니다 :("/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 야근은 많이 하시나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NIGHTSHIFT1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NIGHTSHIFT1 }% 야근 없음! "/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NIGHTSHIFT2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NIGHTSHIFT2 }% 주 1~2회"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NIGHTSHIFT3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NIGHTSHIFT3 }% 주 3~4회"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.NIGHTSHIFT4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.NIGHTSHIFT4 }% 거의 매일"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 최근 연봉 인상률은 어땠나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.SALARYINCREASERATIO1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.SALARYINCREASERATIO1 }% 4% 이하"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.SALARYINCREASERATIO2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.SALARYINCREASERATIO2 }% 5~10%"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.SALARYINCREASERATIO3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.SALARYINCREASERATIO3 }% 11~15%"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.SALARYINCREASERATIO4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.SALARYINCREASERATIO4 }% 16% 이상"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 성과금은 얼마나 지급되나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.INCENTIVE1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.INCENTIVE1 }% 100% 미만"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.INCENTIVE2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.INCENTIVE2 }% 100~200%"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.INCENTIVE3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.INCENTIVE3 }% 201~300%"/>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.INCENTIVE4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.INCENTIVE4 }% 300% 초과"/>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 육아휴직은 자유롭게 사용하시나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.BABYVACATION1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.BABYVACATION1 }%"/><span> 자유롭게 사용</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.BABYVACATION2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.BABYVACATION2 }%"/><span> 눈치보며 사용</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.BABYVACATION3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.BABYVACATION3 }%"/><span> 육아휴직 없어요</span>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 일을 하면서 스스로 성장하고 있나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.GROWUP1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.GROWUP1 }%"/><span> 네, 성장하고 있어요</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.GROWUP2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.GROWUP2 }%"/><span> 정체되고 있는것 같아요</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.GROWUP3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.GROWUP3 }%"/><span> 아니요, 뒤쳐지는 느낌입니다.</span>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 나의 커리어에 도움이 될까요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.CARRER1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.CARRER1 }%"/><span>도움이 돼요</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.CARRER2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.CARRER2 }%"/><span>도움이 되지 않아요</span>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 직원을 위해 자기개발비를 지원해주나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.SELFDEV1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.SELFDEV1 }%"/><span>네</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.SELFDEV2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer3">
										<c:out value="${percentCounts.SELFDEV2 }%"/><span>아니요</span>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 회사에 본받을 사람이 있나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MENTO1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MENTO1 }%"/><span>나를 이끌어주는 상사</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MENTO2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MENTO2 }%"/><span>함께 일하는 동료</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MENTO3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MENTO3 }%"/><span>열정 넘치는 부하직원</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.MENTO4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.MENTO4 }%"/><span>없어요 없었어요? 아니요 원래 없어요</span>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 직원들의 평균 근속 연수는 얼마나 되나요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.AVARAGEOFYEARS1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.AVARAGEOFYEARS1 }%"/><span>2년 미만</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.AVARAGEOFYEARS2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.AVARAGEOFYEARS2 }%"/><span>2~6년</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.AVARAGEOFYEARS3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.AVARAGEOFYEARS3 }%"/><span>6~10년</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.AVARAGEOFYEARS4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.AVARAGEOFYEARS4 }%"/><span>10년 이상</span>
									</div>
								</div>
								
								<div class="card">
									<span class="title"><strong>Q 경영진의 리더십 스타일은 어떤가요?</strong></span>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.LEADERSHIPSTYLE1 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.LEADERSHIPSTYLE1 }%"/><span>의견존중형</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.LEADERSHIPSTYLE2 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.LEADERSHIPSTYLE2 }%"/><span>업무지시형</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.LEADERSHIPSTYLE3 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.LEADERSHIPSTYLE3 }%"/><span>공유형</span>
									</div>
									<div class="progress">
									  	<div class="progress-bar" role="progressbar" aria-valuenow="70"
									 		 aria-valuemin="0" aria-valuemax="100" style="width:${percentCounts.LEADERSHIPSTYLE4 }%">
									    <span class="sr-only"></span>
									  </div>
									</div>
									<div class="card_answer">
										<c:out value="${percentCounts.LEADERSHIPSTYLE4 }%"/><span>분석형</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>