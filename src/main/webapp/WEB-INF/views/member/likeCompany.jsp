<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <link href="${path }/resources/assets/css/memberLikeCompany.css" rel="stylesheet">
  <link href="${path }/resources/assets/css/mypage.css" rel="stylesheet">
  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>관심기업</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>관심기업</li>
          </ol>
        </div>
		
      </div>
    </section><!-- End Breadcrumbs Section -->
    <section class="inner-page">
      <div class="container">
        <div class="mypage-container">
          <div class="link-tab">
            <ul class="link-tab-ul">
              <li class="link-tab-li"><a href="${path }/member/memberInfoView.do?memberId=${loginMember.memberId }"><i class="fas fa-home"></i> My Info</a></li>
              <li><i class="fas fa-pen"></i> 이력서 <span id="resumt-toggle"><i class="fas fa-angle-down"></i></span>
                <ul>
                  <li class="resume-link"><a href="${path}/resume/insertResumeView.do?memberId=${loginMember.memberId}">이력서 등록</a></li>
                  <li class="resume-link"><a href="${path}/resume/memberResumeList.do?memberId=${loginMember.memberId}">이력서 관리</a></li>
                </ul>
              </li>
               <li class="link-tab-li"><a href="${path}/member/memberScrapList.do?memberId=${loginMember.memberId}"><i class="fas fa-star"></i>채용공고 스크랩</a></li>
              <li class="link-tab-li"><a href="${path}/member/memberlikeCompanyList.do?memberId=${loginMember.memberId}"><i class="fas fa-star"></i>관심 기업</a></li>
              <li class="link-tab-li"><a href="${path }/applicant/applyList.do?memberId=${loginMember.memberId}"><i class="fas fa-location-arrow"></i> 지원 내역</a></li>
            </ul>
          </div>
          <div class="update-info-container">
            <div>
              <h1><strong>관심기업</strong></h1>
            </div>
           
            <div class="total-count">
              <p><strong>총 <c:out value="${likeCompanyCount }"/>건</strong></p>
            </div>
            
              
               
              <div class="searchCoatainer">
              <c:if test="${likeCompany != null }">
               <c:forEach var="l" items="${likeCompany }" varStatus="vs">
	                <div class="searchList-container" >
	                	<div class="deleteBtn-container">
							<button type="button" class="delBtn" onclick="deletelikeCompany(this);"><i class="fas fa-trash-alt"></i></button>
						</div>	
	                	<input type="hidden" value="${l.likeCompanyNo }" name="likeCompanyNo">
	                    <div class="companyName_conatiner" data-bs-toggle="modal" data-bs-target="#companyInfo${vs.index }">
	                    	<div class="companyFavicon">
	                    		<img src="${path }/resources/upload/company/${l.company.favicon}" class="favicon" style="border-radius: 50%"/>
	                    	</div>
	                    	<div class="companyName_">
	                    		<c:out value="${l.company.companyName }"/>
	                    		<div class="offerCount_conatiner">
			                    	<div class="offerCount_">
			                    		<span>채용중 <c:out value="${l.offerCount }"/>건</span>
			                    	</div>
	                    		</div>
	                    	</div>
	                    		
	                    </div>
						            
					</div>  
					<div class="modal fade" id="companyInfo${vs.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-scrollable modal-lg">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel"><c:out value="${l.company.companyName }"/></h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      <div style="font-size: 20px; font-weight: bold;margin-top: 20px; margin-bottom: 20px;">
                  기본 정보
                </div>
						         <div class="member_info">
                <div class="info-subtitle">
                	회사명
                </div>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="회사명" aria-label="Recipient's username"
                      aria-describedby="button-addon2" value="${l.company.companyName }" disabled>
                  </div>
                </div>
                <div class="member_info">
                <div class="info-subtitle">
                	사업자번호
                </div>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="사업자번호" aria-label="Recipient's username"
                      aria-describedby="button-addon2" value="${l.company.businessNumber }" disabled>
                  </div>
                </div>
                <div class="member_info">
                <div class="info-subtitle">
                	대표
                </div>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="대표" aria-label="Recipient's username"
                      aria-describedby="button-addon2" value="${l.company.ceoName }" disabled>
                  </div>
                </div>
                <div class="member_info">
                <div class="info-subtitle">
                	회사규모
                </div>
                  <div class="input-group mb-3">
                  	<c:choose>
                  		<c:when test="${l.company.companySize eq 1 }">
                  			<input type="text" class="form-control" placeholder="기업규모" aria-label="Recipient's username"
								aria-describedby="button-addon2" value="스타트업" disabled>
                  		</c:when>
                  		<c:when test="${l.company.companySize eq 2 }">
                  			<input type="text" class="form-control" placeholder="기업규모" aria-label="Recipient's username"
								aria-describedby="button-addon2" value="중소기업" disabled>
                  		</c:when>
                  		<c:when test="${l.company.companySize eq 3 }">
                  			<input type="text" class="form-control" placeholder="기업규모" aria-label="Recipient's username"
								aria-describedby="button-addon2" value="중견기업" disabled>
                  		</c:when>
                  		<c:when test="${l.company.companySize eq 4 }">
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
                    aria-describedby="button-addon2" value="${l.company.companyAddress }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	설립년도
                </div>
                <div class="input-group mb-3">
                  <input type="date" class="form-control" placeholder="설립년도" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${l.company.establishment }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	제공하는 서비스
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="제공하는 서비스" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${l.company.service }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	직원수
                </div>
                <div class="input-group mb-3">
                  <input type="number" class="form-control" placeholder="직원수" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${l.company.employeeNumber }" disabled>
                </div>
              </div>
               <div class="member_info">
               <div class="info-subtitle">
                	회사 홈페이지 URL 주소
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="기업 홈페이지 url" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${l.company.companyUrl }" disabled>
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
                    aria-describedby="button-addon2" value="${l.company.managerName }" disabled>
                </div>
              </div>
              <div class="member_info">
              <div class="info-subtitle">
                	담당자 연락처
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="담당자 연락처" aria-label="Recipient's username"
                    aria-describedby="button-addon2" value="${l.company.managerPhone }" disabled>
                </div>
              </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
                </c:forEach>
                </c:if>
               </div>   
          
            
          </div>
        </div>
        <div>
        	<div style="margin-top: 30px; text-align: center;" class="pageBar">${pageBar }</div>
        </div>
      </div>
    </section>


	<script type="text/javascript">
		

		function deletelikeCompany(e){
			
			let likeCompanyNo = $(e).parents('.searchList-container').find("input[name=likeCompanyNo]").val();
			
			$.ajax({
				url:"${path}/member/deletelikeCompany.do",
				type:"post",
				data:{likeCompanyNo:likeCompanyNo},
				success:data=>{
					alert("삭제하였습니다.");
					location.reload();
				}
			});
		}
		
	</script>

  </main><!-- End #main -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>