<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/review.css" rel="stylesheet">
<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Inner Page</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Inner Page</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <div class="total-company-review">
          <div class="company-review">
            <button type="button" class="btn btn-primary" style="width:150px">전체 기업리뷰</button>
            <h1><strong>기업리뷰</strong></h1>
            <h5>앞으로 근무할 기업은 어떤 모습일까 궁금하시죠?<br>
            <strong>현직자,퇴직자가 알려주는 생생한 기업리뷰</strong></h5>
			<form name="searchFrm">
	            <div class="input-group mb-3">
	              <input type="text" id="searchCompanyName" class="form-control" placeholder="어떤 기업의 리뷰가 궁금하세요?" aria-label="Recipient's username"
	                aria-describedby="basic-addon2">
	              <!-- <span class="input-group-text" id="basic-addon2"><i class="fas fa-search"></i></span> -->
	              <button class="input-group-text" id="basic-addon2" onclick="getSearchList();"><i class="fas fa-search"></i></button>
	            </div>
            </form>
          </div>
          <div class="company-review-image">
          
          </div>
        </div>
        <div class="total-review">
          <div class="review-title">
            <div class="review-title-name">
              <h4><strong>전체 기업리뷰</strong></h4>
            </div>
            <div class="review-title-select">
              <select class="form-select" aria-label="Default select example" style="width:120px">
                <option value="인턴">조회순</option>
                <option value="사원">최신순</option>
              </select>
            </div>
          </div>
          
          <c:forEach var="cl" items="${companyList }">
	          <div class="total-review-info">
	            <div class="company-image">
	              <img alt="" src="${path}/resources/upload/company/${cl.companyImage }" style="width: 100px; height: 100px;">
	              <!-- <span><i class="fas fa-image"></i></span> -->
	            </div>
	            <div class="company-name">
	              <h5><strong><a href="${path }/review/companyReview.do?companyName=${cl.companyName}"><c:out value="${cl.companyName }"/></a></strong></h5>
	              <p>현재 채용중 <span></span></p>
	            </div>
	            <div class="review-info">
	              노력하지 않고 무언가를 잘 해낼 수 있는 사람이 천재라고 한다면, 저는 절대 천재가 아닙니다.
	              하지만 피나는 노력 끝에 뭔가를 이루는 사람이 천재라고 한다면, 저는 천재가 맞습니다.
	              천재의 손끝에는 노력이라는 핏방울이 묻어 있기 마련입니다.
	              제가 대한민국 최고의 취준생이 될 수 있었던 이유는, 저보다 많이 노력한 사람이 한 명도 없었기 때문입니다.
	              저는 단 한 번도 저 자신과 맺은 약속을 어긴 적이 없습니다.
	            </div>
	            <div class="review-view-count">
	              <p><strong>조회수</strong></p>
	            </div>
	            <div class="interest">
	              <button type="button" class="btn btn-light" style="width:100px">관심기업</button>
	            </div>
	          </div>
          </c:forEach>
	          
        </div>
      </div>
    </section>
    
    
    <script>
    	// 회사이름으로 검색하기
		function getSearchList(){
			$.ajax({
				url: "${path}/company/searchList.do",
				data: {search: $('#searchCompanyName').val()},
				dataType:"json",
				success: data=>{
					// 먼저 초기화 시키고
					/* $(".total-review-info").empty();
					
					if(result.length == 0){
						
					} else if(result.length > 0){
						
					} */
				}
			})
		}		
    </script>
  </main><!-- End #main -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 