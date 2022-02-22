<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PEOPLE119</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<!-- font -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
   <!-- bootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  
  <!-- jquery -->
  <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${path }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${path }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${path }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${path }/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${path }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${path }/resources/assets/css/style.css" rel="stylesheet">
</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1><a href="${path}">PEOPLE119</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="/resources/assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="${path}">Home</a></li>
          <li><a class="nav-link scrollto active" href="${path}/company/companyIndex.do">기업메인</a></li>
          <li class="dropdown"><a href="${path }/offer/offerList.do"><span>채용정보</span></a>
          </li>
          <li class="dropdown"><a href="#"><span>기업 정보</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="${path }/company/companyList.do">기업리뷰</a></li>
              <li><a href="${path}/interview/interviewList.do">면접후기</a></li>
            </ul>
          </li>
          
          <li class="dropdown"><a href="${path}/board/boardList.do"><span>커뮤니티</span></a>
            
          </li>
          <c:if test="${loginMember == null }">
          	<li><a href="${path}/member/memberLoginView.do">로그인</a></li>
          	<li><a href="${path}/member/enrollMemberView.do">회원가입</a></li>
          </c:if>
          <c:if test="${loginMember != null }">
          	<c:if test="${loginMember.memberName eq null }">
				<li class="dropdown"><a data-bs-toggle="tooltip" data-bs-placement="right" title="내 정보를 수정해 주세요!" href="#"><span><c:out value="${loginMember.memberId }"/></span> <i class="bi bi-chevron-down"></i></a>
			</c:if>
			<c:if test="${loginMember.memberName ne null }">
				<li class="dropdown"><a href="#"><span><c:out value="${loginMember.memberName }"/></span> <i class="bi bi-chevron-down"></i></a>
			</c:if>
				<ul>
					<li><a  href="${path }/member/memberInfoView.do?memberId=${loginMember.memberId }">마이페이지</a></li>
					<li><a href="${path }/resume/memberResumeList.do?memberId=${loginMember.memberId }">이력서 관리</a></li>
					<li><a href="${path}/member/memberScrapList.do?memberId=${loginMember.memberId}">스크랩</a></li>
					<li><a href="${path}/member/memberlikeCompanyList.do?memberId=${loginMember.memberId}">관심기업</a></li>
					<li><a href="${path }/applicant/applyList.do?memberId=${loginMember.memberId}">지원내역</a></li>
					<li><a href="${path}/member/logout.do">로그아웃</a></li>
				</ul>
			</li>
          	
          </c:if>
          <!-- <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
          <li><a class="getstarted scrollto" href="#about">Get Started</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
