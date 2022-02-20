<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/interviewList.css" rel="stylesheet">

  <main id="main">
	<!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>면접후기</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>면접 후기</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <div class="title">
          <div>
            <h2><strong>검색결과</strong></h2>
          </div>
          <div class="review-count">
            <p>총 ${totalCount}건</p>
          </div>
        </div>
        <div>
           <p><strong>${keyword}</strong>에 대한 검색 결과입니다 <strong>후기등록</strong>과 <strong>조회</strong>는 회원들만 이용가능한 서비스입니다.</p>
        </div>
        <div class="select-box">
          <div class="enrollInterview">
             <button type="button" class="btn btn-primary" onclick="insertBtn();" style="width:150px">후기 등록하기</button>
         </div>
         <div class="findInterview">
         	 <input type="text" class="find" placeholder="회사명으로 검색">
          	 <input type="button" class="findbtn" value="검색" onclick="findStr();">
         </div>
        </div>
        <c:forEach var="l" items="${list}">
        <div class="company-container" id="${l.interviewReviewNo}">
          <div class="enroll-date">
            <div class="date-info">
              <span onclick="toggle(this);"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
          </div>
          <div class="company-info">
            <div class="company-info-title">
              <div>
                <h3 class="companyName" onclick="detailInfo(this);">${l.companyName}</h3>
              </div>
            </div>
            <div class="info">
              <div class="team-name">
                <p>${l.workType} |</p>
              </div>
              <div class="hire-date">
                <p>${l.interviewDate} |</p>
              </div>
              <div class="carrer-years">
                <p>경력 ${l.career}</p>
              </div>
            </div>
          </div>
          <div class="interview-result">
            <div class="eval">
              <div>
                <span class="smile"><i class="far fa-smile"></i></span>
              </div>
              <div class="review">
                <span>전반적 평가<br></span>
                <c:if test="${l.evaluation eq '긍정적'}">
                  <span style="color:green"><strong>${l.evaluation}</strong></span>
                </c:if>
                <c:if test="${l.evaluation eq '부정적'}">
                  <span style="color:red"><strong>${l.evaluation}</strong></span>
                </c:if>
                <c:if test="${l.evaluation eq '보통'}">
                  <span><strong>${l.evaluation}</strong></span>
                </c:if>
              </div>
            </div>
            <div class="difficulty">
              <div>
                <span class="smile"><i class="fas fa-file-alt"></i></span>
              </div>
              <div class="review">
                <span>난이도<br></span>
               <c:if test="${l.difficulty eq '어려움'}">
               	  <span style="color:red"><strong>${l.difficulty}</strong></span>
               </c:if>
               <c:if test="${l.difficulty eq '쉬움'}">
               	  <span style="color:green"><strong>${l.difficulty}</strong></span>
               </c:if>
               <c:if test="${l.difficulty eq '보통'}">
               		<span><strong>${l.difficulty}</strong></span>
               </c:if>
              </div>
            </div>
            <div class="result">
              <div>
                <span class="smile"><i class="fas fa-id-card"></i></span>
              </div>
              <div class="review">
                <span>합격여부<br></span>
                <c:if test="${l.passOrNot eq '불합격'}">
                	<span class="passorNot" style="color:red"><strong>${l.passOrNot}</strong></span>
                </c:if>
                <c:if test="${l.passOrNot eq '합격'}">
                	<span class="passorNot" style="color:green"><strong>${l.passOrNot}</strong></span>
                </c:if>
              </div>
            </div>
          </div>
          <div class="way-of-interview" style="display:none;">
            <div class="interview-type">
              <div>
                <p>면접 유형&nbsp;&nbsp;</p>
              </div>
              <div>
                <span><strong>${l.interviewType}</strong></span>
              </div>
            </div>
            <div class="interviewee-count">
              <div>
                <p>면접 인원&nbsp;&nbsp;</p>
              </div>
              <div>
                <span><strong>${l.interviewees}</strong></span>
              </div>
            </div>
            <div class="interview-process">
              <div>
                <p>전형 및 면접 진행방식&nbsp;&nbsp;</p>
              </div>
              <div>
                <span><strong>${l.interviewProcess}</strong></span>
              </div>
            </div>
            <div class="interview-question">
              <div>
                <p>면접 질문</p>
              </div>        
              <div class="question-container">
                <c:set var="qaArr" value="${fn:split(l.interviewQuestion,',')}"></c:set>
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
          </div>
         </div>
        </c:forEach>
      </div>
      <div>
         ${pageBar}
     </div>
    </section>
    <script>
    const memberId="${loginMember.memberId}";  
  
    
	    const insertBtn=()=>{
		   	 if(memberId!="") {
		   		 location.assign('${path}/interview/interviewEnrollView.do?memberId='+memberId);	 
		   	 }else{
		   		 alert("후기 등록은 회원만 이용가능합니다");
		   		 return;
		   	 }	 
	    }
    
 
    
      const toggle=(e)=>{
    	  if(memberId=="") {
    		  alert("로그인 후 이용가능한 서비스입니다");
    	  }else{
    		  let btn = $(e);
        	  let wayOf = $(btn.parents('.company-container')).find('.way-of-interview');
        	  wayOf.toggle();  
    	  }	
      }
      
      const detailInfo=(e)=>{
    	  let btn=$(e);
    	  const num=$(btn.parents(".company-container")).attr("id");
    	  if(memberId!="") {
    		  location.assign("${path}/interview/selectInterview.do?interviewReviewNo="+num);  
    	  }else{
    		  alert("후기 조회는 회원만 이용가능합니다");
 	   		  return;
    	  }
    	  
      }
      
     const findStr=()=>{
    	 let str=$(".find").val();
    	 location.assign("${path}/interview/findInterview.do?keyword="+str);
     }
 
      
    </script>
    
  </main><!-- End #main -->
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>