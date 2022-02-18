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
          <h2>기업 리뷰</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>기업 리뷰</li>
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
	              <input type="text" id="searchCompanyName" name="keyword" class="form-control" placeholder="어떤 기업의 리뷰가 궁금하세요?" aria-label="Recipient's username"
	                aria-describedby="basic-addon2">
	              <!-- <span class="input-group-text" id="basic-addon2"><i class="fas fa-search"></i></span> -->
	              <button type="button" class="input-group-text" id="basic-addon2" onclick="getSearchList();"><i class="fas fa-search"></i></button>
	            </div>
            </form>
          </div>
          <div class="company-review-image">
          
          </div>
        </div>
        <div>
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
          </div>
          
          <div class="content-wrap">
	          <div class="info-wrap">
	          <c:forEach var="cl" items="${companyList }">
		          <div class="total-review-info">
		            <div class="company-image">
		              <img alt="" src="${path }/resources/upload/company/${cl.companyImage }" style="width: 100px; height: 100px;">
		            </div>
		            <div class="company-name">
		              <h5><strong><a href="${path }/review/companyReview.do?companyName=${cl.companyName}"><c:out value="${cl.companyName }"/></a></strong></h5>
		              <p>현재 채용중 <span></span></p>
		            </div>
		            <div class="review-info">
		              <p><c:out value="${cl.service }"/></p>
		            </div>
		            <div class="review-view-count">
		              <p><strong>조회수 </strong><c:out value="${cl.companyViewCount }"/></p>
		            </div>
		            <input type="hidden" name="companyId" value="${cl.companyId }"/>
		            <div class="interest">
		              <button type="button" class="btn btn-light" style="width:100px" onclick="insertLikeCompany(this);">관심기업</button>
		            </div>
		          </div>
	          </c:forEach>
	          </div>
          </div>
	          
        </div>
      </div>
    </section>
    
    
    <script>
    	// 회사이름으로 검색하기
		function getSearchList(){
			$.ajax({
				url: "${path}/company/searchList.do",
				data: {search: $('input[name=keyword]').val()},
				dataType:"json",
				success: data=>{
					console.log(data);
					// 먼저 초기화 시키고
					$(".info-wrap").empty();
					
					var wrapDiv = $("<div class='info-wrap'>");
					var totalDiv = $("<div class='total-review-info'>");
					var imageDiv = $("<div class='company-image'>");
					var nameDiv = $("<div class='company-name'>");
					var infoDiv = $("<div class='review-info'>");
					var viewCountDiv = $("<div class='review-view-count'>");
					var interestDiv = $("<div class='interest'>");
					
					if(data.length == 0) {
						console.log("없어");
						const span = $("<span>").html("검색어에 해당하는 기업이 존재하지 않습니다.");
						totalDiv.append(span);
						wrapDiv.append(totalDiv);
						$(".content-wrap").append(wrapDiv);
					}
					
					if(data.length > 0) {
						console.log("있어");
						data.forEach(function(d){
							// 이미지
							var companyImage = d["companyImage"];
							var image = $("<img style='width: 100px; height: 100px;'>");
							image.attr("src","${path}/resources/upload/company/"+companyImage);
							imageDiv.append(image);
							// 회사이름
							var companyName = d["companyName"];
							var h5 = $("<h5>");
							var strong = $("<strong>");
							var a = $("<a href='${path}/review/companyReview.do?companyName=" + companyName + "'>").text(companyName);
							strong.append(a);
							h5.append(strong);
							nameDiv.append(h5);
							// 정보
							var info = d["service"];
							var infoP = $("<p>").text(info);
							infoDiv.append(infoP);
							// 조회수
							var readCountP = $("<p>").text("조회수");
							viewCountDiv.append(readCountP);
							// 관심기업
							var button = $("<button type='button' class='btn btn-light' style='width:100px'>").text("관심기업");
							interestDiv.append(button);
							
							totalDiv.append(imageDiv).append(nameDiv).append(infoDiv).append(viewCountDiv).append(interestDiv);
							wrapDiv.append(totalDiv);
							
							$(".content-wrap").append(wrapDiv);
						})
					}
				}
			})
		}		
    	
    	// 관심기업 등록
		const insertLikeCompany=(e)=>{
			
			let companyId = $($(e).parents(".total-review-info")).find("input[name=companyId]").val();
			console.log(companyId);
			
			$.ajax({
				url:"${path}/member/checkLikeCompany.do",
				type:"post",
				data:{memberId:"${loginMember.memberId}",
						companyId:companyId},
				success:data=>{
						if(data){
							$.ajax({
								url:"${path }/member/insertLikeCompany.do",
								type:"post",
								data:{memberId:"${loginMember.memberId}",
									companyId:companyId	
								},
								success:data=>{
									alert("관심기업 등록 완료");					
								},
								error:e=>{
									alert("관심기업 등록 실패");
								}
							});		
						}else{
							alert("이미 관심기업으로 등록된 기업 입니다.");
						}
									
					}
			});
		}
    </script>
  </main><!-- End #main -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 