<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/selectInterview.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css"
    rel="stylesheet">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
  </script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js">
</script>
  <main id="main">
	<script type="text/javascript">
	
	</script>
    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Inner Page</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>Inner Page</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <h3><strong>익명</strong>님의 면접 경험</h3>
        <p>이 페이지는 <strong>PEOPLE119</strong> 회원님이 등록해주신 소중한 경험입니다.<br> <strong>불펌 및 무단 스크랩은 금지합니다.</strong></p>
        <div class="normal-info">
          <h5><strong>기본정보</strong></h5>
            <div class="company-name">
              <div>
                <p>기업명</p>
              </div>
              <div class="select-box">          
              	 <strong>${ir.companyName}</strong>
              </div>
            </div>
            <div class="duty">
              <div>
                <p>직무직업</p>
              </div>
              <div>
              	<input type="text" class="form-control" name="memberId" value="${loginMember.memberId}" style="display:none;">
              </div>
              <div class="workType">
                <strong>${ir.workType}</strong>
              </div>
            </div>
            <div class="carrer-info">
              <div>
                <p>면접 당시 경력</p>
              </div>
              <div class="carrer-select">
                <div>
                	<strong>${ir.dept}</strong>
                </div>
                <div>
                    <strong>${ir.career}</strong>
                </div>
              </div>
            </div>
            <div class="interview-date">
              <div>
                <p>면접날짜</p>
              </div>
              <div class="date">
                <strong>${ir.interviewDate}</strong>
              </div>
            </div>
            <div class="interview-info">
              <h5><strong>면접 정보</strong></h5>
            </div>
            <div class="evaluation">
              <div>
                <p>전반적 평가</p>
              </div>
              <div class="eval-button">
                <c:if test="${ir.evaluation eq '긍정적'}">
	                <label for="eval1" class="eval"><input type="radio" id="eval1" name="evaluation" value="긍정적" checked onclick="return(false);"><span>긍정적</span></label>
	              	<label for="eval2" class="eval"><input type="radio" id="eval2" name="evaluation" value="보통" onclick="return(false);"><span>보통</span></label>
	              	<label for="eval3" class="eval"><input type="radio" id="eval3" name="evaluation" value="부정적" onclick="return(false);"><span>부정적</span></label>
                </c:if>
                 <c:if test="${ir.evaluation eq '보통'}">
	                <label for="eval1" class="eval"><input type="radio" id="eval1" name="evaluation" value="긍정적" onclick="return(false);"><span>긍정적</span></label>
	              	<label for="eval2" class="eval"><input type="radio" id="eval2" name="evaluation" value="보통"  checked onclick="return(false);"><span>보통</span></label>
	              	<label for="eval3" class="eval"><input type="radio" id="eval3" name="evaluation" value="부정적" onclick="return(false);"><span>부정적</span></label>
                </c:if> 
                 <c:if test="${ir.evaluation eq '부정적'}">
	                <label for="eval1" class="eval"><input type="radio" id="eval1" name="evaluation" value="긍정적" onclick="return(false);"><span>긍정적</span></label>
	              	<label for="eval2" class="eval"><input type="radio" id="eval2" name="evaluation" value="보통"  onclick="return(false);"><span>보통</span></label>
	              	<label for="eval3" class="eval"><input type="radio" id="eval3" name="evaluation" value="부정적" checked onclick="return(false);"><span>부정적</span></label>
                </c:if>        
              </div>
            </div>
            <div class="difficulty-container">
              <div>
                <p>난이도</p>
              </div>
              <div class="diffi-button">
                <c:if test="${ir.difficulty eq '쉬움'}">
                	<label for="difficulty1" class="difficulty"><input type="radio" id="difficulty1" name="difficulty" value="쉬움" checked onclick="return(false);"><span>쉬움</span></label>
	              	<label for="difficulty2" class="difficulty"><input type="radio" id="difficulty2" name="difficulty" value="보통" onclick="return(false);"><span>보통</span></label>
	              	<label for="difficulty3" class="difficulty"><input type="radio" id="difficulty3" name="difficulty" value="어려움" onclick="return(false);"><span>어려움</span></label>
                </c:if>
                 <c:if test="${ir.difficulty eq '보통'}">
                	<label for="difficulty1" class="difficulty"><input type="radio" id="difficulty1" name="difficulty" value="쉬움" onclick="return(false);"><span>쉬움</span></label>
	              	<label for="difficulty2" class="difficulty"><input type="radio" id="difficulty2" name="difficulty" value="보통" checked onclick="return(false);"><span>보통</span></label>
	              	<label for="difficulty3" class="difficulty"><input type="radio" id="difficulty3" name="difficulty" value="어려움" onclick="return(false);"><span>어려움</span></label>
                </c:if>
                 <c:if test="${ir.difficulty eq '어려움'}">
                	<label for="difficulty1" class="difficulty"><input type="radio" id="difficulty1" name="difficulty" value="쉬움" onclick="return(false);"><span>쉬움</span></label>
	              	<label for="difficulty2" class="difficulty"><input type="radio" id="difficulty2" name="difficulty" value="보통" onclick="return(false);"><span>보통</span></label>
	              	<label for="difficulty3" class="difficulty"><input type="radio" id="difficulty3" name="difficulty" value="어려움" checked onclick="return(false);"><span>어려움</span></label>
                </c:if>
                
              </div>
            </div>
            <div class="interview-type">
              <div>
                <p>면접 및 전형 유형</p>
              </div>
              <div class="interview-check">
              	<strong>${ir.interviewType}</strong>       
              </div>
            </div>
            <div class="interviewee">
              <div>
                <p>면접인원</p>
              </div>
              <div class="interviewee-check">
                <strong>${ir.interviewees}</strong>
              </div>
            </div>
            <div class="interview-process">
              <div class="wayofinterview">
                <p>전형 및 면접</p>
              </div>
              <div class="mb-3" disabled>
                <strong>${ir.interviewProcess}</strong>
              </div>
            </div>
            <div class="pass-info">
              <h5><strong>합격 정보</strong></h5>
            </div>
            <div class="question-info">
              <div>
                <p>면접질문</p>
              </div>
              <div class="question-container">
                <c:set var="qaArr" value="${fn:split(ir.interviewQuestion,',')}"></c:set>
                <c:forEach var="word" items="${qaArr}">
               		 <div class="question">
		                  <div>
		                    <i class="fas fa-search"></i>
		                  </div>
		                  <div class="question-input">
		                    <strong>${word}</strong>
		                  </div>
               		 </div> 
                </c:forEach>                   
              </div>
            </div>
            <div class="question-tip">
              <div>
                <p>면접 TIP 및<br>특이사항</p>
              </div>
              <div class="mb-3" disabled>
                <strong>${ir.interviewTip}</strong>
              </div>
            </div>
            <div class="pass-yn">
              <div>
                <p>합격 여부</p>
              </div>
              <div class="pass-btn">
                <c:if test="${ir.passOrNot eq '합격'}">
                	<label for="passOrNot1" class="passOrNot"><input type="radio" id="passOrNot1" name="passOrNot" value="합격" checked onclick="return(false);"><span>합격</span></label>
              		<label for="passOrNot2" class="passOrNot"><input type="radio" id="passOrNot2" name="passOrNot" value="불합격" onclick="return(false);"><span>불합격</span></label>
                </c:if>
                <c:if test="${ir.passOrNot eq '불합격'}">
                	<label for="passOrNot1" class="passOrNot"><input type="radio" id="passOrNot1" name="passOrNot" value="합격" onclick="return(false);"><span>합격</span></label>
              		<label for="passOrNot2" class="passOrNot"><input type="radio" id="passOrNot2" name="passOrNot" value="불합격" checked onclick="return(false);"><span>불합격</span></label>
                </c:if>   
              </div>
            </div>
            <div class="btn-container">
              <div>
                <input type="button" onclick="backto();" class="btn btn-primary" value="뒤로가기" style="width:150px; background-color:rgb(64, 194, 255); border:none;">   
                <c:if test="${ir.memberId eq loginMember.memberId}">
                <input type="button" onclick="deleteIr();" class="btn btn-primary" value="삭제하기" style="width:150px; background-color:rgb(64, 194, 255); border:none;">
              	<input type="button" onclick="updateIr();" class="btn btn-primary" value="수정하기" style="width:150px; background-color:rgb(64, 194, 255); border:none;">
                </c:if>  
              </div>
            </div>
        </div>
      </div>
    </section>
    
  </main><!-- End #main -->
  <script>
  	const interviewReviewNo="${ir.interviewReviewNo}";
  	const memberId="${loginMember.memberId}";
  	const backto=()=>{
  		history.back();
  	}
  	
  	//후기 삭제
  	const deleteIr=()=>{
  		let interviewReviewNo="${ir.interviewReviewNo}";
  	    if(confirm("정말 삭제하시겠습니까?")==true) {
  	    	$.ajax({
  	  			url:"${path}/interview/deleteInterview.do",
  	  			data:{interviewReviewNo:interviewReviewNo},
  	  			dataType:"json",
  	  			success:data=>{
  	  				if(data>0) { 					
  	  					alert("후기 삭제 완료");
  	  					location.assign("${path}/interview/interviewList.do");
  	  				}else{
  	  					alert("후기 삭제 실패");
  	  					return;
  	  				}
  	  			}
  	  		});		
  	    }else{
  	    	return;
  	    }
  	}
  	//후기 수정
  	const updateIr=()=>{
  		location.assign("${path}/interview/updateInterviewView.do?interviewReviewNo="+interviewReviewNo+"&&memberId="+memberId);
  	}
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>