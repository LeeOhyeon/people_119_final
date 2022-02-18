<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link href="${path }/resources/assets/css/login.css" rel="stylesheet">

<main id="main">

	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>개인회원 로그인</h2>
				<ol>
					<li><a href="index.html">Home</a></li>
					<li>개인회원 로그인</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs Section -->

	<section class="inner-page">
		<div class="container">

			<div class="loginContainer">
				<div class="loginouter">
					<div class="loginTitle">로그인이 필요한 서비스 입니다.</div>
					<div class="loginTitle2">개인회원</div>
					<div>
						<form action="${path}/member/memberLogin.do" method="post">
							<input class="form-control form-control-lg" type="text"placeholder="ID" aria-label=".form-control-lg example" name="memberId">
							<input class="form-control form-control-lg" required="required" type="password"placeholder="password" aria-label=".form-control-lg example" name="password">
							<button type="submit" class="btn btn-primary" onclick="">Login</button>
						</form>
					</div>
					<div class="enroll">
						<a href="${path}/member/enrollMemberView.do"><strong>회원가입</strong></a> | <a href="${path}/member/searchIdpasswordView.do">아이디/비밀번호
							찾기</a>
					</div>
				</div>
			</div>
		</div>
	</section>

</main>
<!-- End #main -->




<jsp:include page="/WEB-INF/views/common/footer.jsp" />