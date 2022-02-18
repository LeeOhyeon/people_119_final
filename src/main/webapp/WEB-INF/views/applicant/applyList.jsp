<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path}/resources/assets/css/apply.css" rel="stylesheet">

	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>입사지원 현황</h2>
				<ol>
					<li><a href="${path }">Home</a></li>
					<li>입사지원 현황</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <div>
          <h3><strong>입사지원 현황</strong></h3>
        </div>
        <div class="apply-parse">
          <div class="apply-count">
            <p><strong><c:out value="전체 ${total }건"/></strong></p>
          </div>
          <div class="apply-group">
            <!-- <div class="apply-yn">
              <select class="form-select" aria-label="Default select example" style="width:120px">
                <option selected>열람여부</option>
                <option value="">열람</option>
                <option value="">미열람</option>
              </select>
            </div> -->
            <div class=apply-input>
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="search" aria-label="Recipient's username"
                  aria-describedby="basic-addon2">
                <span class="input-group-text" id="basic-addon2"><i class="fas fa-search"></i></span>
              </div>
            </div>
          </div>
        </div>
        <c:if test="${empty applyList }">
        	<div class="apply-info">
		          <div class="apply-info-title">
		          	<h2><strong>지원한 공고가 없습니다.</strong></h2>
		          </div>
	        </div>
        </c:if>
        
       	<c:if test="${not empty applyList }">
	        <c:forEach var="al" items="${applyList }">
		        <div class="apply-info">
		          <div class="apply-info-title">
		              <c:forEach var="o" items="${al.offer }">
		              	<div class="content">
		              		<h4><c:out value="${o.companyName }"/></h4>
		              	</div>
			            <div class="content">
			              <h2><strong><a href="${path }/offer/offerView.do?offerNo=${o.offerNo}"><c:out value="${o.offerTitle }"/></a></strong></h2>
			            </div>
			            <div class="content">
			              <c:set var="techArr" value="${fn:split(o.tech, ',') }"/>
			              <c:forEach var="t" items="${techArr }">
			              	<span><c:out value="${t } "/></span>
		              	  </c:forEach>
			            </div>
			            <div class="content">
			              <p class="condition"><c:out value="${o.location } / ${o.carrer }"/></p>
			            </div>
		              </c:forEach>
		          </div>
		          <div class="apply-info-yn">
		            <div class="alram-yn">
		              <h4><strong>알람여부</strong></h4>
		            </div>
		            <div class="apply-btn">
		              <button type="button" class="btn btn-light" style="width:170px" 
		              	onclick="if(confirm('정말 지원을 취소하시겠습니까?')) {
		              				location.assign('${path}/applicant/deleteApply.do?offerNo=${al.offerNo }&&memberId=${loginMember.memberId }')
		              			}">지원취소</button>
		            </div>
		          </div>
		        </div>
	        </c:forEach>
        </c:if>
      </div>
    </section>
    
    <script>
    
    </script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>