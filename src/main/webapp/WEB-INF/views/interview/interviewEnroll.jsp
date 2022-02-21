<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/interviewEnroll.css" rel="stylesheet">
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
          <h2>면접후기 등록</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>면접후기 등록</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <h3>면접 경험 등록</h3>
        <p>등록된 이력서의 입사 경력을 불러옵니다. 작성해주신 면접후기는 <strong>익명</strong>으로 등록됩니다.</p>
        <div class="normal-info">
          <h5><strong>기본정보입력</strong></h5>
          <form action="${path}/interview/interviewEnroll.do" onsubmit="return submitChk();">
            <div class="company-name">
              <div>
                <p>기업명</p>
              </div>
              <div class="select-box">          
              		<c:choose>  
						<c:when test="${empty list}"> 
							<input type="text" class="form-control" name="companyName" id="companyName" style="width:300px">
						</c:when> 
							<c:otherwise>
							 <select class="form-select"  aria-label="Default select example" name="companyName" style="width:250px">
								<c:forEach var="l" items="${list}">
              						<option value="${l.companyName}">${l.companyName}</option>
              					</c:forEach>
              				</select> 
							</c:otherwise> 
					</c:choose>  	              	            
              	 	<%-- <c:forEach var="l" items="${list}">
              			<option value="${l.companyName}">${l.companyName}</option>
              		</c:forEach> --%>
              </div>
            </div>
            <div class="duty">
              <div>
                <p>직무직업</p>
              </div>
              <div>
              	<input type="text" class="form-control" name="memberId" value="${loginMember.memberId}" style="display:none;">
              </div>
              <div>
                <input type="text" class="form-control" name="workType" style="width:300px">
              </div>
            </div>
            <div class="carrer-info">
              <div>
                <p>면접 당시 경력</p>
              </div>
              <div class="carrer-select">
                <div>
                  <select class="form-select" aria-label="Default select example" name="dept" id="dept" style="width:200px">
                    <option value="직급선택" selected="selected">직급선택</option>
                    <option value="인턴">인턴</option>
                    <option value="사원">사원</option>
                    <option value="대리">대리</option>
                    <option value="과장">과장</option>
                    <option value="부장">부장</option>
                  </select>
                </div>
                <div>
                  <select class="form-select" aria-label="Default select example" style="width:200px" name="career" id="career">
                    <option selected="selected">연차선택</option>
                    <option value="신입">신입</option>
                    <option value="1년차">1년차</option>
                    <option value="2년차">2년차</option>
                    <option value="3년차">3년차</option>
                    <option value="4년차">4년차</option>
                    <option value="5년차">5년차</option>
                    <option value="6년차">6년차</option>
                    <option value="7년차">7년차</option>
                    <option value="8년차">8년차</option>
                    <option value="9년차">9년차</option>
                    <option value="10년차">10년차</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="interview-date">
              <div>
                <p>면접날짜</p>
              </div>
              <div class="date">
                <input type="text" id="datePicker" name="interviewDate" placeholder="날짜입력">
              </div>
            </div>
            <div class="interview-info">
              <h5><strong>면접 정보 입력</strong></h5>
            </div>
            <div class="evaluation">
              <div>
                <p>전반적 평가</p>
              </div>
              <div class="eval-button">
                <label for="eval1" class="eval"><input type="radio" id="eval1" name="evaluation" value="긍정적"><span>긍정적</span></label>
              	<label for="eval2" class="eval"><input type="radio" id="eval2" name="evaluation" value="보통"><span>보통</span></label>
              	<label for="eval3" class="eval"><input type="radio" id="eval3" name="evaluation" value="부정적" ><span>부정적</span></label>     
              </div>
            </div>
            <div class="difficulty-container">
              <div>
                <p>난이도</p>
              </div>
              <div class="diffi-button">
                <label for="difficulty1" class="difficulty"><input type="radio" id="difficulty1" name="difficulty" value="쉬움"><span>쉬움</span></label>
              	<label for="difficulty2" class="difficulty"><input type="radio" id="difficulty2" name="difficulty" value="보통"><span>보통</span></label>
              	<label for="difficulty3" class="difficulty"><input type="radio" id="difficulty3" name="difficulty" value="어려움" ><span>어려움</span></label>
              </div>
            </div>
            <div class="interview-type">
              <div>
                <p>면접 및 전형 유형<br>(다중 선택 가능)</p>
              </div>
              <div class="interview-check">

                <input class="form-check-input" type="checkbox" value="직무/인성면접" id="interviewType1" name="interviewType">
                <label class="form-check-label" for="flexCheckDefault">
                  직무/인성면접
                </label>

                <input class="form-check-input" type="checkbox" value="PT면접" id="interviewType2" name="interviewType">
                <label class="form-check-label" for="flexCheckDefault">
                  PT면접
                </label>

                <input class="form-check-input" type="checkbox" value="토론면접" id="interviewType3" name="interviewType">
                <label class="form-check-label" for="flexCheckDefault">
                  토론면접
                </label>

                <input class="form-check-input" type="checkbox" value="실무과제 및 시험" id="interviewType4" name="interviewType">
                <label class="form-check-label" for="flexCheckDefault">
                  실무 과제 및 시험
                </label>

                <input class="form-check-input" type="checkbox" value="인적성 검사" id="interviewType5" name="interviewType">
                <label class="form-check-label" for="flexCheckDefault">
                  인적성 검사
                </label>

                <input class="form-check-input" type="checkbox" value="기타" id="interviewType6" name="interviewType">
                <label class="form-check-label" for="flexCheckDefault">
                  기타
                </label>
              </div>
            </div>
            <div class="interviewee">
              <div>
                <p>면접인원<br>(다중 선택 가능)</p>
              </div>
              <div class="interviewee-check">
                <input class="form-check-input" type="checkbox" value="1:1면접" id="interviewees1" name="interviewees">
                <label class="form-check-label" for="flexCheckDefault">
                  1:1면접
                </label>

                <input class="form-check-input" type="checkbox" value="인적성검사" id="interviewees2" name="interviewees">
                <label class="form-check-label" for="flexCheckDefault">
                  인적성 검사
                </label>

                <input class="form-check-input" type="checkbox" value="그룹 면접" id="interviewees3" name="interviewees">
                <label class="form-check-label" for="flexCheckDefault">
                  그룹 면접
                </label>
              </div>
            </div>
            <div class="interview-process">
              <div>
                <p>전형 및 면접<br>진행방식</p>
              </div>
              <div class="mb-3" disabled>
                <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="서류 합격 후 어떤 전형과 면접을 경험하셨나요?"
                  rows="3" name="interviewProcess" style="resize:none;"></textarea>
              </div>
            </div>
            <div class="pass-info">
              <h5><strong>합격 정보 입력</strong></h5>
            </div>
            <div class="question-info">
              <div>
                <p>면접질문<br>(최소 3개)</p>
              </div>
              <div class="question-container">
                <div class="question">
                  <div>
                    <i class="fas fa-search"></i>
                  </div>
                  <div class="question-input">
                    <input type="text" class="form-control" name="interviewQuestion" id="interviewQuestion1">
                  </div>
                </div>
                <div class="question">
                  <div>
                    <i class="fas fa-search"></i>
                  </div>
                  <div class="question-input">
                    <input type="text" class="form-control" name="interviewQuestion" id="interviewQuestion2">
                  </div>
                </div>
                <div class="question">
                  <div>
                    <i class="fas fa-search"></i>
                  </div>
                  <div class="question-input">
                    <input type="text" class="form-control" name="interviewQuestion" id="interviewQuestion3">
                  </div>
                </div>
              </div>
            </div>
            <div class="question-tip">
              <div>
                <p>면접 TIP 및<br>특이사항</p>
              </div>
              <div class="mb-3" disabled>
                <textarea class="form-control" id="exampleFormControlTextarea1" name="interviewTip" placeholder="면접 후 TIP을 남겨주세요" rows="3"
                  style="resize:none;"></textarea>
              </div>
            </div>
            <div class="pass-yn">
              <div>
                <p>합격 여부</p>
              </div>
              <div class="pass-btn">
                <label for="passOrNot1" class="passOrNot"><input type="radio" id="passOrNot1" name="passOrNot" value="합격"><span>합격</span></label>
              	<label for="passOrNot2" class="passOrNot"><input type="radio" id="passOrNot2" name="passOrNot" value="불합격"><span>불합격</span></label>
              </div>
            </div>
            <div class="btn-container">
              <div>
                <input type="submit" class="submit" value="등록하기">
                
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    
  </main><!-- End #main -->
	<script>
      $("#datePicker").datepicker({
        format: "yyyy-mm-dd",
        language: "kr"
      });
      
      function submitChk(){
       	  
    	//직급, 연차, 날짜, 평가
    	
    	if($("select[name=dept]").val() =='직급선택'){
    		alert("직급을 선택하세용");
    		return false;
    	}else if($("select[name=career]").val() =='연차선택'){
    		alert("연차를 선택하세용");
    		return false;
    	}else if($("input[name=interviewDate]").val() ==''){
    		alert("날짜를 선택하세용");
    		return false;
    	}else if(!$("input[name=evaluation]").is(':checked')){
    		alert("전반적평가를 선택하세용");
    		return false;
    	}else if(!$("input[name=difficulty]").is(':checked')){
    		alert("난이도를 평가해주세용");
    		return false;
    	}else if(!$("input[name=interviewType]").is(':checked')) {
    		alert("면접 및 전형 유형을 선택해주세요");
    		return false;
    	}else if(!$("input[name=interviewees]").is(':checked')) {
    		alert("면접인원을 선택해주세용");
    		return false;
    	}else if($("input[name=workType]").val()=='') {
    		alert("직무직업을 입력해주세용");
    		return false;
    	}else if($("textarea[name=interviewProcess]").val()=='') {
    		alert("면접 진행방식을 입력해주세요");
    		return false;
    	}else if($("input[name=interviewQuestion]").val()=='') {
    		alert("면접질문을 최소 1개 입력해주세요");
    		return false;
    	}else if($("textarea[name=interviewTip]").val()=='') {
    		alert("면접 TIP을 입력해주세요");
    		return false;
    	}else if(!$("input[name=passOrNot]").is(':checked')) {
    		alert("합격 여부를 선택해주세요");
    		return false;
    	}
       	  	
       }
      
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>