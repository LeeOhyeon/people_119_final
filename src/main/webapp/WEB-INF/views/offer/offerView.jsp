<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/offerView.css" rel="stylesheet">

 <main id="main" style="background: #f1f3f9;">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
        
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->
	<c:set var="techArr" value="${fn:split(offer.tech, ',') }"/>
		<c:set var="businessArr" value="${fn:split(offer.business, ',') }"/>
		<c:set var="qualificationArr" value="${fn:split(offer.qualification, ',') }"/>
		<c:set var="treatmentArr" value="${fn:split(offer.treatment, ',') }"/>
		<c:set var="welfareArr" value="${fn:split(offer.welfare, ',') }"/>
		
    <section class="inner-page">
      <div class="container">
          <div class="offer_container">
              <div class="offer_header">
                  <div class="likeCompany_container">
                    <div class="companyName"><c:out value="${offer.companyName }"/></div>
                    <button type="button" class="likeCompany" onclick="insertLikeCompany();"><span class="likeHeart"><i class="fas fa-heart"></i></span> 관심기업 등록</button> 
                  	<div class="endDate">마감일 : <c:out value="${offer.endDate }"/></div>
                  </div>
                  <div class="offer_titleContainer">
                    <div class="offerTitle">
                    	<h1><c:out value="${offer.offerTitle }"/></h1>
                    </div>
                    <div class="scrapBtn">
	                    <span onclick="insertScrap();" class="star" style="cursor: pointer; font-size: 35px;"><i class="fas fa-star"></i></span>
                    </div>
                    <c:choose>
                    	<c:when test="${offer.status eq 1 }">
		                    <div class="applyBtnContainer">
								 <button class="apply-end" type="button" onclick="" class="btn btn-primary" disabled="disabled">지원이 마감되었습니다.</button>
							</div>
						</c:when>
                    	<c:when test="${offer.status eq 0 }">
                    		<c:choose>
                    			<c:when test="${check eq 0 }">
				                    <div class="applyBtnContainer">
										 <button class="apply" type="button" onclick="if(confirm('정말 지원하시겠습니까?')){location.assign('${path }/applicant/apply.do?offerNo=${offer.offerNo}&memberId=${loginMember.memberId}')};" class="btn btn-primary">지원하기</button>
									</div>
                    			</c:when>
                    			<c:when test="${check eq 1 }">
                    				<div class="applyBtnContainer">
								 		<button class="apply-end" type="button" onclick="" class="btn btn-primary" disabled="disabled">지원이 완료되었습니다.</button>
									</div>
                    			</c:when>
                    		</c:choose>
						</c:when>
					</c:choose>
					
                  </div>
              </div>

              <div class="info_container">
                  <div class="offer_infoCotainer">
                      <table class="table table-borderless align-middle tableTd">
                          <tr>
                          	<td class="firstTd">경력</td>
                          	<td style="color:#4c78ea;"><c:out value="${offer.carrer }"/></td>
                          </tr>
                          <tr>
                          	<td>학력</td>
                          	<td style="color:#4c78ea;"><c:out value="${offer.education }"/></td>
                          </tr>
                         
                          <tr>
                          	<td>기술</td>
                          	<td><c:forEach var="tech" items="${techArr }">
								<c:out value="${tech }" />
								</c:forEach></td>
                          </tr>
                        
                          <tr>
                          	<td>근무지역</td>
                          	<td><c:out value="${offer.location }"/></td>
                          </tr>
                      </table>
                  </div>
                  <div class="company_infoContainer">
                      <table class="table table-borderless align-middle tableTd">
 						<tr>
                          	<td class="firstTd">주요업무</td>
                          	<td><c:forEach var="business" items="${businessArr }">
									<c:out value="${business }"/>
								</c:forEach></td>
                          </tr>
                          <tr>
                          	<td>자격요건</td>
                          	<td>
                          	<c:forEach var="qualification" items="${qualificationArr }">
								<c:out value="${qualification }"/>
							</c:forEach>
                          	</td>
                          </tr>
                          <tr>
                          	<td>우대사항</td>
                          	<td><c:forEach var="treatment" items="${treatmentArr }">
									<c:out value="${treatment }"/>
								</c:forEach></td>
                          </tr>
                          <tr>
                          	<td>복지/혜택</td>
                          	<td>
                          	<c:forEach var="welfare" items="${welfareArr }">
								<c:out value="${welfare }"/>
							</c:forEach>
                          	</td>
                          </tr>
                      </table>
                  </div>
            </div>

            <div class="content_container"></div>
				<img alt="회사사진" src="${path}/resources/upload/offer/${offer.image }">
				<c:out value="${offer.offerContent }"/>
          </div>
        


      </div>
    </section>

  </main>
		

<script>

$(document).ready(()=>{
	checkScrap();
	checkCompany();
});

function checkScrap(){
	
	$.ajax({
		url:"${path}/member/checkScrap.do",
		type:"post",
		data:{memberId:"${loginMember.memberId}",
				offerNo:"${offer.offerNo}"},
		success:data=>{
				if(data){
					$(".star").css("color","black");
				}else{
					$(".star").css("color","yellow");
				}		
			}
	});
	
}


const insertScrap=()=>{
	
	
	if("${loginMember.memberId}" == '' || "${loginMember.memberId}" =='undefined'){
		alert("로그인 후 이용 가능한 서비스 입니다.")
	}else{
		$.ajax({
			url:"${path}/member/checkScrap.do",
			type:"post",
			data:{memberId:"${loginMember.memberId}",
					offerNo:"${offer.offerNo}"},
			success:data=>{
					if(data){
						$.ajax({
							url:"${path }/member/insertScrap.do",
							type:"post",
							data:{memberId:"${loginMember.memberId}",
									offerNo:"${offer.offerNo}"	
							},
							success:data=>{
								alert("스크랩이 완료 되었습니다.");
								$(".star").css("color","yellow");		
							},
							error:e=>{
								alert("스크랩실패");
							}
						});		
					}else{
						$.ajax({
							url:"${path }/member/deleteScrapStar.do",
							type:"post",
							data:{memberId:"${loginMember.memberId}",
									offerNo:"${offer.offerNo}"	
							},
							success:data=>{
								alert("스크랩 삭제 완료.");
								$(".star").css("color","black");	
							},
							error:e=>{
								console.log("취소실패");
							}
						});		
					}
								
				}
		});

	}
}


//관심기업 체크
function checkCompany(){
	$.ajax({
		url:"${path}/member/checkLikeCompany.do",
		type:"post",
		data:{memberId:"${loginMember.memberId}",
				companyId:"${offer.companyId}"},
		success:data=>{
			if(data){
				$(".likeHeart").css("color","black");
			}else{
				$(".likeHeart").css("color","red");
			}	
							
			}
	});
}


//관심기업
const insertLikeCompany=()=>{
	
	if("${loginMember.memberId}" == '' || "${loginMember.memberId}" =='undefined'){
		alert("로그인 후 이용 가능한 서비스 입니다.")
	}else{
		$.ajax({
			url:"${path}/member/checkLikeCompany.do",
			type:"post",
			data:{memberId:"${loginMember.memberId}",
					companyId:"${offer.companyId}"},
			success:data=>{
					if(data){
						$.ajax({
							url:"${path }/member/insertLikeCompany.do",
							type:"post",
							data:{memberId:"${loginMember.memberId}",
								companyId:"${offer.companyId}"	
							},
							success:data=>{
								alert("관심기업 등록 완료");				
								$(".likeHeart").css("color","red");
							},
							error:e=>{
								alert("관심기업 등록 실패");
								$(".likeHeart").css("color","black");
							}
						});		
					}else{
						$.ajax({
							url:"${path }/member/deleteLikeCompany.do",
							type:"post",
							data:{memberId:"${loginMember.memberId}",
								companyId:"${offer.companyId}"	
							},
							success:data=>{
								alert("관심기업 삭제 완료");		
								$(".likeHeart").css("color","black");
							},
							error:e=>{
								alert("관심기업 취소 실패");		
								$(".likeHeart").css("color","red");
							}
						});		
					}
								
				}
		});
	}
}
	// 퀵 메뉴
	$(document).ready(function(){
		var currentPosition = parseInt($(".quickmenu").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop(); 
			$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		});
	});
	
	/* // 모달
	$('#myModal').on('shown.bs.modal', function () {
		$('#myInput').trigger('focus')
	}) */
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>