<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <link href="${path }/resources/assets/css/memberScrap.css" rel="stylesheet">
  <link href="${path }/resources/assets/css/mypage.css" rel="stylesheet">
  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>채용공고 스크랩</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>채용공고 스크랩</li>
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
               <li class="link-tab-li"><a href="${path }/review/enrollCompanyReview.do?"><i class="fa-solid fa-microphone-stand"></i> 기업 리뷰 작성하기</a></li>
              <li class="link-tab-li"><a href="${path }/applicant/applyList.do?memberId=${loginMember.memberId}"><i class="fas fa-location-arrow"></i> 지원 내역</a></li>
            </ul>
          </div>
          <div class="update-info-container">
            <div>
              <h1><strong>채용공고 스크랩</strong></h1>
            </div>
           
            <div class="total-count">
              <p><strong>총 <c:out value="${scrapCount }"/>건</strong></p>
            </div>
            
              
          <div class="scrap-container">
                <div class="scrap-searchContainer">
                 <button type="button" class="btn btn-outline-secondary" style="height:38px;" onclick="location.reload();">전체보기</button>
                  <div class="scrap-search">
	                  <div style="width: 150px;">
		                  <select class="form-select" aria-label="Default select example" name="searchCol">
							  <option value="OFFERTITLE" selected="selected">공고명</option>
							  <option value="COMPANYNAME">회사명</option>
						</select>
	                  </div>
                      <div class="input-group mb-3" >
                        <input type="text" name="keyword" class="form-control" aria-label="Recipient's username" aria-describedby="search-scrap">
                        <button class="btn btn-outline-secondary" type="button" id="search-scrap" onclick="searchScrap();">검색</button>
                      </div>
                  </div>
                </div>
               
               
             <div class="searchCoatainer">
              <c:if test="${scrapCount == 0 }">
             	<div class="nonScrap">
                	<div class="nonScrapText">등록된 스크랩 정보가 없습니다. 마음에 드는 공고를 스크랩 하세요!</div>
                	<button type="button" class="btn btn-outline-primary scrapAdd" onclick="location.assign('${path}/offer/offerList.do')">채용공고 보러가기</button>
                </div>
              </c:if>
              <c:if test="${scrap != null }">
               <c:forEach var="s" items="${scrap }">
               
	                <div class="searchList-container">
	                	<input type="hidden" value="${s.scrapNo }" name="scrapNo">
	                    <div class="company-title"><c:out value="${s.offer.companyName}"/></div>
	                    <div class="offer-title">
	                   	  <div><a href="${path }/offer/offerView.do?offerNo=${s.offer.offerNo}"><c:out value="${s.offer.offerTitle}"/></a></div>
	                   	  <div>
	                   	  	<span class="offerContent"><c:out value="${s.offer.carrer}"/></span>
	                   	  	<span class="offerContent"><c:out value="${s.offer.education}"/></span>
	                   	  	<span class="offerContent"><c:out value="${s.offer.location}"/></span>
	                   	  	<span class="offerContent"><c:out value="${s.offer.tech}"/></span>
	                   	  </div>
	                    </div>
	                    <div class="finishDate-container">
	                    <p>공고마감일</p>
	                    <c:out value="${s.offer.endDate}"/>
	                    </div>
						<div class="deleteBtn-container">
						<button type="button" class="delBtn" onclick="deleteScrap(this);"><i class="fas fa-trash-alt"></i></button>
						</div>	                    
	                </div>
                </c:forEach>
                </c:if>
               </div>   
          </div>
          
            
          </div>
        </div>
        <div>
        	<div style="margin-top: 30px; text-align: center;" class="pageBar">${pageBar }</div>
        </div>
      </div>
    </section>

	<script type="text/javascript">
		function searchScrap(cPage){
			$.ajax({
				url:"${path}/member/searchScrap.do",
				type:"post",
				data:{searchCol:$("select[name=searchCol]").val(),
					keyword:$("input[name=keyword]").val(),
					memberId:"${loginMember.memberId}",
					cPage:cPage
				},
				success:data=>{
					$(".searchCoatainer").html("");
					$(".total-count").html("");
					$(".total-count").html("<p><strong>총"+data["count"]+"건</strong></p>");
					$(".pageBar").html("");
					$(".pageBar").html(data["pageBar"]);
					
					
						for(let i=0; i<data["scrap"].length;i++){
							const searchListContainer = $("<div class='searchList-container'>");
							const companyTitle = $("<div class='company-title'>"+data["scrap"][i]["offer"]["companyName"]+"</div>");
							const companyTitleAfter=$("<div><span class='offerContent'>"+data["scrap"][i]["offer"]["carrer"]+"</span><span class='offerContent'>"+data["scrap"][i]["offer"]["education"]+"</span><span class='offerContent'>"+data["scrap"][i]["offer"]["location"]+"</span><span class='offerContent'>"+data["scrap"][i]["offer"]["tech"]+"</span></div>");
							const offerTitle = $("<div class='offer-title'>"+data["scrap"][i]["offer"]["offerTitle"]+"</div>");
							const finishDateContainer = $("<div class='finishDate-container'><p>공고마감일</p>"+data["scrap"][i]["offer"]["endDate"]+"</div>");
							const deleteBtnContainer = $("<div class='deleteBtn-container'><button type='button' class='delBtn' onclick='deleteScrap(this);'><i class='fas fa-trash-alt'></i></button></div>");
							offerTitle.append(companyTitleAfter);
							searchListContainer.append(companyTitle).append(offerTitle).append(finishDateContainer).append(deleteBtnContainer);
							$(".searchCoatainer").append(searchListContainer);
						} 
				}
				
			});
			
		}	
		
		function deleteScrap(e){
			
			let scrapNo = $(e).parents('.searchList-container').find("input[name=scrapNo]").val();
			
			$.ajax({
				url:"${path}/member/deleteScrap.do",
				type:"post",
				data:{
					memberId:"${loginMember.memberId}",
					scrapNo:scrapNo},
				success:data=>{
					alert("삭제하였습니다.");
					location.reload();
				}
			});
		}
		
	</script>

  </main><!-- End #main -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>