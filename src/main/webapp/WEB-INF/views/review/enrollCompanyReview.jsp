<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/enrollCompanyReview.css" rel="stylesheet">

<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>기업 리뷰 등록</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>기업 리뷰 등록</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <form action="${path }/review/enrollCompanyReviewEnd.do">
          <div>
          	<input id="loginMemberId" type="hidden" name="memberId" value="${loginMember.memberId }"/>
          </div>
       	  <h2>회사 선택</h2>
          <div style="display: flex;">
          	<input class="form-control" type="text" list="list" 
          		id="companyName" name="companyName" style="width: 800px;"
          		aria-label="Recipient's username" aria-describedby="button-addon2" required autocomplete="off"/>
          	<datalist id="list">
          		<c:forEach var="cl" items="${companyList }">
          			<option value="${cl.companyName }"/>
          		</c:forEach>
          	</datalist>
          	<button class="btn btn-outline-secondary" 
          		type="button" id="checkButton" style="width: 100px; height: 54px; margin-top: 0;"
          			onclick="checkCompany();">중복확인</button>
          </div>
	   	  <div class="checkComapnyNameResult"></div>
          <div class="company-review">
            <div>
              <h3>회의는 얼마나 자주하나요?</h3>
            </div>
            <div class="meeting-count">
              <div>
                <input type="radio" id="meeting1" name="meetingCount" value="1">
                <label label for="meeting1">필요할때만 진행</label>
              </div>
              <div>
                <input type="radio" id="meeting2" name="meetingCount" value="2">
                <label label for="meeting2">주 1~2회</label>
              </div>
              <div>
                <input type="radio" id="meeting3" name="meetingCount" value="3">
                <label label for="meeting3">주 3~4회</label>
              </div>
              <div>
                <input type="radio" id="meeting4" name="meetingCount" value="4">
                <label label for="meeting4">매일</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>회식주기는 어떤가요?</h3>
            </div>
            <div class="membership">
              <div>
                <input type="radio" id="membership1" name="drinkingCycle" value="1">
                <label label for="membership1">연 1~2번</label>
              </div>
              <div>
                <input type="radio" id="membership2" name="drinkingCycle" value="2">
                <label label for="membership2">3,4개월에 1번</label>
              </div>
              <div>
                <input type="radio" id="membership3" name="drinkingCycle" value="3">
                <label label for="membership3">매달 진행</label>
              </div>
              <div>
                <input type="radio" id="membership4" name="drinkingCycle" value="4">
                <label label for="membership4">필요할때 진행</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>회식은 어떻게 진행되나요?</h3>
            </div>
            <div class="membership-process">
              <div>
                <input type="radio" id="membership-process1" name="wayOfDringking" value="1">
                <label label for="membership-process1">간단하게 식사만</label>
              </div>
              <div>
                <input type="radio" id="membership-process2" name="wayOfDringking" value="2">
                <label label for="membership-process2">회식은 술과함께</label>
              </div>
              <div>
                <input type="radio" id="membership-process3" name="wayOfDringking" value="3">
                <label label for="membership-process3">문화 회식을 즐겨요</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>연차는 어떻게 사용하나요?</h3>
            </div>
            <div class="vacation">
              <div>
                <input type="radio" id="vacation1" name="wayOfVacation" value="1">
                <label label for="vacation1">자유롭게 사용</label>
              </div>
              <div>
                <input type="radio" id="vacation2" name="wayOfVacation" value="2">
                <label label for="vacation2">눈치보며 사용</label>
              </div>
              <div>
                <input type="radio" id="vacation3" name="wayOfVacation" value="3">
                <label label for="vacation3">잘 사용하지 못함</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>연차를 몇일 정도 사용하나요? (1년기준)</h3>
            </div>
            <div class="vacation-count">
              <div>
                <input type="radio" id="vacation-count1" name="numberOfAvgVacation" value="1">
                <label label for="vacation-count1">15일 이상</label>
              </div>
              <div>
                <input type="radio" id="vacation-count2" name="numberOfAvgVacation" value="2">
                <label label for="vacation-count2">10~14일</label>
              </div>
              <div>
                <input type="radio" id="vacation-count3" name="numberOfAvgVacation" value="3">
                <label label for="vacation-count3">5~9일</label>
              </div>
              <div>
                <input type="radio" id="vacation-count4" name="numberOfAvgVacation" value="4">
                <label label for="vacation-count4">0~4일</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>직원 성비가 어떻게 되나요?</h3>
            </div>
            <div class="gender-ratio">
              <div>
                <input type="radio" id="gender-ratio1" name="genderRatio" value="1">
                <label label for="gender-ratio1">남자가 많아요</label>
              </div>
              <div>
                <input type="radio" id="gender-ratio2" name="genderRatio" value="2">
                <label label for="gender-ratio2">여자가 많아요</label>
              </div>
              <div>
                <input type="radio" id="gender-ratio3" name="genderRatio" value="3">
                <label label for="gender-ratio3">비슷해요!</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>출근이 자유로운 편인가요?</h3>
            </div>
            <div class="attendance">
              <div>
                <input type="radio" id="attendance1" name="freeAttendance" value="1">
                <label label for="attendance1">유연근무제 시행</label>
              </div>
              <div>
                <input type="radio" id="attendance2" name="freeAttendance" value="2">
                <label label for="attendance2">정해진 시간에 출근</label>
              </div>
              <div>
                <input type="radio" id="attendance3" name="freeAttendance" value="3">
                <label label for="attendance3">재택근무 진행</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>회사의 평균 연령대는?</h3>
            </div>
            <div class="avarage-age">
              <div>
                <input type="radio" id="avarage-age1" name="avarageOfAge" value="1">
                <label label for="avarage-age1">20대</label>
              </div>
              <div>
                <input type="radio" id="avarage-age2" name="avarageOfAge" value="2">
                <label label for="avarage-age2">30대</label>
              </div>
              <div>
                <input type="radio" id="avarage-age3" name="avarageOfAge" value="3">
                <label label for="avarage-age3">40대 이상</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>어떤 복장으로 출근하나요?</h3>
            </div>
            <div class="clothes">
              <div>
                <input type="radio" id="clothes1" name="clothes" value="1">
                <label label for="clothes1">칼정장</label>
              </div>
              <div>
                <input type="radio" id="clothes2" name="clothes" value="2">
                <label label for="clothes2">세미정장</label>
              </div>
              <div>
                <input type="radio" id="clothes3" name="clothes" value="3">
                <label label for="clothes3">캐주얼 복장</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>워라밸이 잘 지켜지나요?</h3>
            </div>
            <div class="work-life-balance">
              <div>
                <input type="radio" id="wlb1" name="workLifeBalance" value="1">
                <label label for="wlb1">그럼요! 항상 칼퇴합니다 :) </label>
              </div>
              <div>
                <input type="radio" id="wlb2" name="workLifeBalance" value="2">
                <label label for="wlb2">어느 정도는 지켜지기는 합니다 :ㅣ</label>
              </div>
              <div>
                <input type="radio" id="wlb3" name="workLifeBalance" value="3">
                <label label for="wlb3">아니요, 지켜지지 않습니다 :( </label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>야근 많이 하시나요?</h3>
            </div>
            <div class="night-shift">
              <div>
                <input type="radio" id="night-shift1" name="nightShift" value="1">
                <label label for="night-shift1">야근없음</label>
              </div>
              <div>
                <input type="radio" id="night-shift2" name="nightShift" value="2">
                <label label for="night-shift2">주 1~2회</label>
              </div>
              <div>
                <input type="radio" id="night-shift3" name="nightShift" value="3">
                <label label for="night-shift3">주 3~4회</label>
              </div>
              <div>
                <input type="radio" id="night-shift4" name="nightShift" value="4">
                <label label for="night-shift4">매일</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>최근 연봉 인상률은 어땠나요?</h3>
            </div>
            <div class="salary-increase">
              <div>
                <input type="radio" id="salary-increase1" name="salaryIncreaseratio" value="1">
                <label label for="salary-increase1">4% 이하</label>
              </div>
              <div>
                <input type="radio" id="salary-increase2" name="salaryIncreaseratio" value="2">
                <label label for="salary-increase2">5~10%</label>
              </div>
              <div>
                <input type="radio" id="salary-increase3" name="salaryIncreaseratio" value="3">
                <label label for="salary-increase3">11~15%</label>
              </div>
              <div>
                <input type="radio" id="salary-increase4" name="salaryIncreaseratio" value="4">
                <label label for="salary-increase4">16% 이상</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>성과금은 어느 정도 지급되나요?</h3>
            </div>
            <div class="incentive">
              <div>
                <input type="radio" id="incentive1" name="incentive" value="1">
                <label label for="incentive1">100% 미만</label>
              </div>
              <div>
                <input type="radio" id="incentive2" name="incentive" value="2">
                <label label for="incentive2">100~200%</label>
              </div>
              <div>
                <input type="radio" id="incentive3" name="incentive" value="3">
                <label label for="incentive3">201~300%</label>
              </div>
              <div>
                <input type="radio" id="incentive4" name="incentive" value="4">
                <label label for="incentive4">300% 초과</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>육아휴직은 자유롭게 사용하시나요?</h3>
            </div>
            <div class="baby-vacation">
              <div>
                <input type="radio" id="baby-vacation1" name="babyVacation" value="1">
                <label label for="baby-vacation1">자유롭게 사용</label>
              </div>
              <div>
                <input type="radio" id="baby-vacation2" name="babyVacation" value="2">
                <label label for="baby-vacation2">눈치보며 사용</label>
              </div>
              <div>
                <input type="radio" id="baby-vacation3" name="babyVacation" value="3">
                <label label for="baby-vacation3">육아휴직 없어요</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>일을 하면서 성장하고 있나요?</h3>
            </div>
            <div class="grow-up">
              <div>
                <input type="radio" id="grow-up1" name="growUp" value="1">
                <label label for="grow-up1">네, 성장하고 있어요</label>
              </div>
              <div>
                <input type="radio" id="grow-up2" name="growUp" value="2">
                <label label for="grow-up2">정체되고 있는것 같아요</label>
              </div>
              <div>
                <input type="radio" id="grow-up3" name="growUp" value="3">
                <label label for="grow-up3">아니요, 뒤쳐지는 느낌입니다.</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>이직시 나의 커리어에 도움이 될까요?</h3>
            </div>
            <div class="carrer">
              <div>
                <input type="radio" id="carrer1" name="carrer" value="1">
                <label label for="carrer1">도움이 돼요</label>
              </div>
              <div>
                <input type="radio" id="carrer2" name="carrer" value="2">
                <label label for="carrer2">도움이 되지 않아요</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>직원을 위해 자기개발비를 지원해주나요?</h3>
            </div>
            <div class="self-dev">
              <div>
                <input type="radio" id="self-dev1" name="selfDev" value="1">
                <label label for="self-dev1">네</label>
              </div>
              <div>
                <input type="radio" id="self-dev2" name="selfDev" value="2">
                <label label for="self-dev2">아니요</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>회사에 본받을 사람이 있나요?</h3>
            </div>
            <div class="mento">
              <div>
                <input type="radio" id="mento1" name="mento" value="1">
                <label label for="mento1">나를 이끌어주는 상사</label>
              </div>
              <div>
                <input type="radio" id="mento2" name="mento" value="2">
                <label label for="mento2">함께 일하는 동료</label>
              </div>
              <div>
                <input type="radio" id="mento3" name="mento" value="3">
                <label label for="mento3">열정 넘치는 부하직원</label>
              </div>
              <div>
                <input type="radio" id="mento4" name="mento" value="4">
                <label label for="mento4">없어요</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>직원들의 평균 근속 연수는?</h3>
            </div>
            <div class="avarage-years">
              <div>
                <input type="radio" id="avarage-years1" name="avarageOfYears" value="1">
                <label label for="avarage-years1">2년 미만</label>
              </div>
              <div>
                <input type="radio" id="avarage-years2" name="avarageOfYears" value="2">
                <label label for="avarage-years2">2~6년</label>
              </div>
              <div>
                <input type="radio" id="avarage-years3" name="avarageOfYears" value="3">
                <label label for="avarage-years3">6~10년</label>
              </div>
              <div>
                <input type="radio" id="avarage-years4" name="avarageOfYears" value="4">
                <label label for="avarage-years4">10년 이상</label>
              </div>
            </div>
          </div>
          <div class="company-review">
            <div>
              <h3>경영진의 리더십 스타일은?</h3>
            </div>
            <div class="leadership">
              <div>
                <input type="radio" id="leadership1" name="leadershipStyle" value="1">
                <label label for="leadership1">의견존중형</label>
              </div>
              <div>
                <input type="radio" id="leadership2" name="leadershipStyle" value="2">
                <label label for="leadership2">업무지시형</label>
              </div>
              <div>
                <input type="radio" id="leadership3" name="leadershipStyle" value="3">
                <label label for="leadership3">공유형</label>
              </div>
              <div>
                <input type="radio" id="leadership4" name="leadershipStyle" value="4">
                <label label for="leadership4">분석형</label>
              </div>
            </div>
          </div>
          <div class="company">
            <div>
              <h3>기업의 좋은점을 알려주세요</h3>
            </div>
            <div class="mb-3" disabled>
              <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="좋은점을 알려주세요"
                rows="3" style="resize:none;" name="advantages"></textarea>
            </div>
			<div>
			 <h3>별점으로 회사를 표현해주세요</h3>
			</div>
			<div class="starpoint_wrap">
			  <div class="starpoint_box">
			    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
			    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
			    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
			    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
			    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
			    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
			    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
			    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
			    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
			    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
			    <input type="radio" name="avgScore" id="starpoint_1" class="star_radio" value="0.5">
			    <input type="radio" name="avgScore" id="starpoint_2" class="star_radio" value="1">
			    <input type="radio" name="avgScore" id="starpoint_3" class="star_radio" value="1.5">
			    <input type="radio" name="avgScore" id="starpoint_4" class="star_radio" value="2">
			    <input type="radio" name="avgScore" id="starpoint_5" class="star_radio" value="2.5">
			    <input type="radio" name="avgScore" id="starpoint_6" class="star_radio" value="3">
			    <input type="radio" name="avgScore" id="starpoint_7" class="star_radio" value="3.5">
			    <input type="radio" name="avgScore" id="starpoint_8" class="star_radio" value="4">
			    <input type="radio" name="avgScore" id="starpoint_9" class="star_radio" value="4.5">
			    <input type="radio" name="avgScore" id="starpoint_10" class="star_radio" value="5">
			    <span class="starpoint_bg"></span>
			  </div>
			</div>
            <div class="btn">
              <div>
                <button type="button" class="btn btn-light" style="width:150px">이전</button>
              </div>
              <div>
                <button type="submit" class="btn btn-primary" style="width:150px">등록완료</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
    <script>
    	// 기업리뷰 중복 확인
		const checkCompany=()=>{
			const companyName = $("#companyName").val();
			const loginMemberId = "${loginMemberId.memberId}";
			$.ajax({
				url: "${path}/review/enrollCheckCompanyName.do",
				data: {companyName:$("#companyName").val(), memberId:"${loginMember.memberId}"},
				dataType:"json",
				success : data=>{
					console.log(data);
					if(data){
						$(".checkComapnyNameResult").html("<span style='color:green;'>리뷰 등록이 가능한 기업입니다.</span>");
					}else{
						$(".checkComapnyNameResult").html("<span style='color:red;'>이미 리뷰가 등록된 기업입니다.</span>");
					}
				}
			});
		}
    </script>
  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>