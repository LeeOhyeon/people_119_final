<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path }/resources/assets/css/mypage.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>마이페이지</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>마이페이지</li>
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
                  <li class="resume-link"><a href="${path }/resume/insertResumeView.do?memberId=${loginMember.memberId }">이력서 등록</a></li>
                  <li class="resume-link"><a href="${path }/resume/memberResumeList.do?memberId=${loginMember.memberId }">이력서 관리</a></li>
                </ul>
              </li>
              <li class="link-tab-li"><a href="${path}/member/memberScrapList.do?memberId=${loginMember.memberId}"><i class="fas fa-star"></i>채용공고 스크랩</a></li>
              <li class="link-tab-li"><a href="${path}/member/memberlikeCompanyList.do?memberId=${loginMember.memberId}"><i class="fas fa-star"></i>관심 기업</a></li>
              <li class="link-tab-li"><a href="${path }/review/enrollCompanyReview.do?"><i class="fa-solid fa-microphone-stand"></i> 기업 리뷰 작성하기</a></li>
              <li class="link-tab-li"><a href="${path }/applicant/applyList.do?memberId=${loginMember.memberId}"><i class="fas fa-location-arrow"></i> 지원 내역</a></li>
            </ul>
          </div>
          <div class="update-info-container">
            <div class="info-title">
              개인정보 수정
            </div>
            <div class="info-update">
            
              <div class="member_info_container">
                <div style="font-size: 20px; font-weight: bold;margin-top: 50px; margin-bottom: 20px;">
                  기본 정보
                </div>
                <div class="member_info">
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" id="memberName" name="memberName" value="${loginMember.memberName }" placeholder="이름" aria-label="Recipient's username"
                      aria-describedby="updateName">
                    <button class="btn btn-outline-secondary" type="button" onclick="updateName();">수정</button>
                  </div>
                </div>
                <div class="member_info">
                  <div class="input-group mb-3">
                    <input type="date" class="form-control" placeholder="생년월일" id="birth" value="${loginMember.birth }" name="birth" aria-label="Recipient's username"
                      aria-describedby="updateBirth">
                    <button class="btn btn-outline-secondary" type="button" onclick="updateBirth();">수정</button>
                  </div>
                </div>
                <div class="member_info">
                  <div class="select_gender">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gender" id="genderM" value="M" ${loginMember.gender eq "M"?"checked":""}>
                      <label class="form-check-label" for="genderM">
                        남
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gender" id="genderF" value="F" ${loginMember.gender eq "F"?"checked":""}>
                      <label class="form-check-label" for="genderW">
                        여
                      </label>
                    </div>
                </div>
                <div class="gender-btn">
                  <button type="button" class="btn btn-outline-secondary" onclick="updateGender();">수정</button>
                </div>
              </div> 
               <div class="member_info">
               	
                <div class="input-group mb-3">
                
                <c:set var="address" value="${loginMember.address }"/>	
                <c:set var="addressVal" value="${fn:substring(address,0,address.lastIndexOf(',')-1) }"/>
                <c:set var="addressDetailVal" value="${fn:substring(address,address.lastIndexOf(',')+1,fn:length(address)) }"/>
                
                  <input type="text" class="form-control" placeholder="주소" name="address" id="address" 
                  value="${addressVal }" aria-label="Recipient's username"
                    aria-describedby="searchAddress">
                  <button class="btn btn-outline-secondary" type="button" onclick="searchAddress()">주소검색</button>
                </div>
                <div class="input-group mb-3">
                 <input type="text" class="form-control" placeholder="상세주소" id="addressDetail"  aria-label="Recipient's username"
                    aria-describedby="updateAddress"
                    value="${addressDetailVal}" >
                  <button class="btn btn-outline-secondary" type="button" onclick="updateAddress()">수정</button>
                </div>
              </div>
              <div style="font-size: 20px; font-weight: bold; margin-top: 50px; margin-bottom: 20px;">
                연락처 정보
              </div>
              
              
              
              <div class="find_info">
						<div class="find_info_input">
							<div class="input-group mb-3" style="margin-bottom: 0px;">
								<input type="text" id="email" class="form-control" placeholder="이메일"
									aria-label="Recipient's username" name="email" value="${loginMember.email }"
									aria-describedby="sendMail_">
								<button class="btn btn-outline-secondary" type="button"
									id="sendMail_" onclick="sendMail();">인증번호 발송</button>
							</div>
						</div>
						<div class="resultEmail"></div>
					</div>
					
					
					<div class="find_info">
						<div class="find_info_input">
							<div class="input-group mb-3" style="margin-bottom: 0px;">
								<input type="text" class="form-control"
									aria-label="Recipient's username" required="required" placeholder="인증번호"
									aria-describedby="sendMail" id="emailCode">
								<button class="btn btn-outline-secondary" type="button"
									onclick="compareKey();">인증확인 및 수정</button>
							</div>
						</div>
						<div class="resultCode"></div>
					</div>
              
              
              <div class="member_info">
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="휴대폰(-)포함 입력" name="phone" id="phone" value="${loginMember.phone }"  aria-label="Recipient's username"
                    aria-describedby="updatePhone">
                  <button class="btn btn-outline-secondary" type="button" onclick="updatePhone();">수정</button>
                </div>
              </div>
              
               <div class="member_info">
                <div class="">
                 <button class="btn btn-outline-secondary" type="button"  id="searchpasswordBtn"data-bs-toggle="modal" data-bs-target="#updatePassword">비밀번호 변경</button>
                 <button class="btn btn-outline-secondary" type="button" id="deleteMemberBtn" data-bs-toggle="modal" data-bs-target="#deleteMember">회원 탈퇴</button>
                </div>
              </div>
              
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
  <!--비밀번호 변경 Modal -->
<div class="modal fade" id="updatePassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body updatePw">
      <div class="input-name">새 비밀번호</div>
							<div class="input-info">
								<input class="form-control" type="password" required="required"
									aria-label="default input example" name="password" id="password" placeholder="영문 대/소문자+숫자+특수문자 조합 최소 8자리 이상">
							</div>
							<div class="password_ck">
							</div>
							
							<div class="input-name"  style="margin-top: 20px;">비밀번호 확인</div>
							<div class="input-info">
								<input class="form-control" type="password"
									aria-label="default input example" id="password_">
							</div>
							<div class="checkPassword"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeBtn">닫기</button>
        <button type="button" class="btn btn-primary" id="updatePasswordBtn" onclick="updatePassword();">비밀번호 변경</button>
      </div>
    </div>
  </div>
</div>

<!--회원탈퇴 Modal -->
<div class="modal fade" id="deleteMember" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div>
      		<p>회원 탈퇴를 위해 현재 비밀번호를 입력해 주세요.</p>
      	</div>
      	<div>
			<input type="password" class="form-control" name="password" id="delPassword"/>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeBtn">닫기</button>
        <button type="button" class="btn btn-primary" id="deleteMemberModalBtn" onclick="deleteMember();">회원 탈퇴</button>
      </div>
    </div>
  </div>
</div>
  
  <script>
  	//회원아이디
	const memberId = "${loginMember.memberId}";
  
	//패스워드 맞는는지 체크  
	$("#delPassword").change(()=>{
		let password = $("#delPassword").val();
		$.ajax({
			url :"${path}/member/checkPassword.do",
			type:"post",
			data:{memberId:memberId,password:password},
			success:data=>{
				if(data){
					alert("비밀번호 확인 완료!");	
				}else{
					alert("비밀번호를 확인해 주세요!");	
				}
					
			}
		});
		
	});
	
	//회원 탈퇴
	const deleteMember=()=>{
		
		$.ajax({
			url :"${path}/member/deleteMember.do",
			type:"post",
			data:{memberId:memberId},
			success:data=>{
				if(data>0){
					alert("그동안 서비스를 이용해 주셔서 감사합니다.");
					location.assign('${path}/member/logout.do');
				}else{
					alert("회원 탈퇴 실패!");	
				}
					
			}
		});
	}
	
	
  
  	//이름 수정
  	const updateName=()=>{
  		
  		const memberName = $("#memberName").val();
  		const getName= RegExp(/^[가-힣]+$/);
  		
		if(!getName.test(memberName)){
			alert("정확한 이름을 입력해 주세요.");
	        $("#memberName").focus();
		}else{
			$.ajax({
				url : "${path}/member/updateMemberName.do",
				data : {memberId:memberId,memberName:memberName},
				dataType:"json",
				success:data=>{
					if(data != null){
						console.log(data);
						alert("변경성공");
					}else{
						alert("변경실패");
					}
					
				}
			});
		}
  	}
  	
  	//생년월일 수정
  	const updateBirth=()=>{
  		
  		const birth = $("#birth").val();
  		
  		$.ajax({
  			url : "${path}/member/updatebirth.do",
			data : {memberId:memberId,birth:birth},
			dataType:"json",
			success:data=>{
				if(data != null){
					console.log(data);
					alert("변경성공");
				}else{
					alert("변경실패");
				}
			}
  		});
  		
  		
  	}
  
  	//성별 수정
  		const updateGender=()=>{
	  		
  			const gender = $("input[name=gender]:checked").val();
  			$.ajax({
  	  			url : "${path}/member/updateGender.do",
  				data : {memberId:memberId,gender:gender},
  				dataType:"json",
  				success:data=>{
  					if(data != null){
  						console.log(data);
  						alert("변경성공");
  					}else{
  						alert("변경실패");
  					}
  				}
  	  		});
  	}
  	
  	//주소 검색
  	const searchAddress=()=>{
  		const addressDetail = "";
  		
  		 new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				let addr = ''; // 주소 변수
                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 $("#address").val(addr);
             }
         }).open();
  	}
  	
  	//주소 수정
  	const updateAddress = ()=>{
  		
  		const addressInfo =  $("#address").val();
  		const addressDetail = $("#addressDetail").val();
  		
  		const address = addressInfo +"," +addressDetail;
  		
  		$.ajax({
	  			url : "${path}/member/updateAddress.do",
				data : {memberId:memberId,address:address},
				dataType:"json",
				success:data=>{
					if(data != null){
						console.log(data);
						alert("변경성공");
					}else{
						alert("변경실패");
					}
				}
	  		});
  		
  	}
  	
  	
  	
  //인증번호 확인
  	let compareResult = false;
  	const compareKey=()=>{
  		const emailCode = $("#emailCode").val();
  		$(".resultCode").html("");
  		if(comparekey == emailCode){
  			$(".resultCode").html("<span style='color:green'>인증 성공</span>");
  			compareResult = true;
  			
  			//이메일 변경
  			$.ajax({
	  			url : "${path}/member/updateEmail.do",
				data : {memberId:memberId,email:$("#email").val()},
				dataType:"json",
				success:data=>{
					if(data != null){
						console.log(data);
						alert("변경성공");
					}else{
						alert("변경실패");
					}
				}
	  		});
  			
  			
  		}else{
  			$(".resultCode").html("<span style='color:red'>인증 번호를 다시 입력해 주세요.</span>");
  			$("#emailCode").val("");
  			compareResult = false;
  		}
  	}

  	//이메일 중복체크
  	$("#email").keyup(()=>{
  		let email = $("#email").val();
  		$.ajax({
  			type:"post",
  			url:"${path}/member/checkEmail.do",
  			data:{email:email},
  			success:data=>{
  				$(".resultEmail").html("");
  				if(data){
  					$(".resultEmail").html("<span style='color:red;'>존재하지 않는 이메일 입니다.</span>");
  					$("#sendMail_").attr("onclick","sendMail();");
  					
  				}else{
  					$(".resultEmail").html("<span style='color:green;'>이미 존재하는 이메일 입니다.</span>");
  					$("#sendMail_").removeAttr("onclick");
  				}
  			}
  		});
  	});
  	//이메일 인증
  	let comparekey;
  	const sendMail=()=>{
  		
  		let email = $("#email").val();
  		if(email.trim().length == 0 || email == null){
  			alert("이메일을 입력해 주세요!");
  		}else{
  			$.ajax({
  				type:"post",
  				url:"${path}/member/sendMail.do",
  				data:{email:email},
  				success:data=>{
  					console.log("성공");
  					console.log(data);
  					comparekey = data;	
  				},
  				error : e=>{
  					console.log("실패");
  				}
  			});
  		}
  		
  	}

  	//핸드폰 번호 수정
  	const updatePhone=()=>{
  		const hpReg = /^\d{3}-\d{3,4}-\d{4}$/; // '-'를포함해야함
  		const phone = $("#phone").val();
  		if (!hpReg.test(phone)) {
            alert("'-' 를 포함해서 입력해주세요.");
        }else{
        	
        	$.ajax({
	  			url : "${path}/member/updatePhone.do",
				data : {memberId:memberId,phone:phone},
				dataType:"json",
				success:data=>{
					if(data != null){
						console.log(data);
						alert("변경성공");
					}else{
						alert("변경실패");
					}
				}
	  		});
        	
        }
  	}
  	

  	//비밀번호 변경
  	const updatePassword=()=>{
  		let memberId = "${loginMember.memberId}";
  		$.ajax({
  			url:"${path}/member/updatePassword.do",
  			data:{memberId:memberId,password:$("#password").val()},
  			dataType:"json",
  			success:data=>{
  				if(data>0){
  					alert("비밀번호가 변경되었습니다. 로그인 하세요!");
  					$("#closeBtn").click();
  					loginMember();
  					
  				}else{
  					alert("비밀번호 변경 실패.");
  					$("#closeBtn").click();
  				}
  			},
  			error: e=>{
  				console.log("에러");
  			}
  		});
  	}
  	
  	function loginMember(){
  		location.assign('${path}/member/logout.do');
  	}
  	
  	$("#password").change(()=>{
  		
  		const password = $("#password").val();
  		const checkPw=RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,25}$/);
  		
  		if(password.length<8 || password.length>16){
  			$(".password_ck").html("<span>비밀번호는 8글자 이상 16자 이하 입니다.</span>");
  			$("#password").val("");
  			$("#password").focus();
  		}else{
  			if(!checkPw.test(password)){
  				$(".password_ck").html("<span>비밀번호는 영문 대소문자+숫자+특수문자 조합 최소 8자리 이상으로 작성해주세요.</span>");
  				$("#password").val("");
  				$("#password").focus();
  			}else{
  				$(".password_ck").html("");
  			}
  		}

  		$("#password_").change(()=>{
  			
  			const password = $("#password").val();
  			const password_ = $("#password_").val();
  			
  			if(password == password_){
  				$(".checkPassword").html("<span style='color:green;'>비밀번호가 일치합니다.</span>");
  			}else{
  				$(".checkPassword").html("<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>");
  				$("#password_").val("");
  				$("#password_").focus();
  			}
  		});
  	});
  	
  </script>
  	
  
  
  
  
  

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>