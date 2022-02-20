<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/searchidpassword.css" rel="stylesheet">
<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>아이디/비밀번호 찾기</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>아이디/비밀번호 찾기</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
          <div>
            <p>가입한 아이디와 비밀번호를 잊으셨습니까?</p>
          </div>
          <div class="find_container">
              <div class="find_inner">
                <div class="find_title">개인회원</div>
                <div class="link_container">
                  <div class="find_link"><button type="button" class="btn btn-primary"
                  onclick="location.assign('${path}/member/searchIdView.do')"
                  >아이디 찾기</button></div>
                  <div class="find_link"><button type="button" class="btn btn-primary"
                    onclick="location.assign('${path}/member/searchpasswordView.do')"
                  >비밀번호 찾기</button></div>
              </div>
              </div>

              <div class="find_inner">
                <div class="find_title">기업회원</div>
                <div class="link_container">
                <div class="find_link"><button type="button" class="btn btn-primary">아이디 찾기</button></div>
                <div class="find_link"><button type="button" class="btn btn-primary">비밀번호 찾기</button></div>
              </div>
            </div>
          </div>
          


      </div>
    </section>

  </main><!-- End #main -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>