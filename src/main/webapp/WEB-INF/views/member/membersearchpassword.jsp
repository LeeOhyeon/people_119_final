<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <link href="${path }/resources/assets/css/searchpassword.css" rel="stylesheet">
<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>아이디/비밀번호 찾기</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>아이디/비밀번호 찾기</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
          <div>
            <p class="find_title">이메일 주소로 찾기</p>
            <p class="find_title2">회원정보에 등록된 이메일 정보로 비밀번호를 변경할 수 있습니다.</p>
          </div>
          <br>
          <br>
          <div class="find_container">
            <div class="find_outer">
              <div class="find_info">
                <div class="find_info_name">아이디</div>
                <div class="find_info_input">
                  <input class="form-control" type="text" aria-label="default input example" name="memberId" id="memberId">
                </div>
                 <div class="checkIdResult"></div>
              </div>
             
        
              <div class="find_info">
						<div class="find_info_name">이메일 주소</div>
						<div class="find_info_input">
							<div class="input-group mb-3" style="margin-bottom: 0px;">
								<input type="text" id="email" class="form-control"
									aria-label="Recipient's username" name="email"
									aria-describedby="sendMail_">
								<button class="btn btn-outline-secondary" type="button"
									id="sendMail_" onclick="sendMail();">인증번호 발송</button>
							</div>
						</div>
						<div class="resultEmail"></div>
					</div>
					
					
					<div class="find_info">
						<div class="find_info_name">인증 번호</div>
						<div class="find_info_input">
							<div class="input-group mb-3" style="margin-bottom: 0px;">
								<input type="text" class="form-control"
									aria-label="Recipient's username" required="required"
									aria-describedby="sendMail" id="emailCode">
								<button class="btn btn-outline-secondary" type="button"
									onclick="compareKey();">인증확인</button>
							</div>
						</div>
						<div class="resultCode"></div>
					</div>
					<div class="find_btn">
						<div class="find_btn_outer">
							<button class="btn btn-outline-secondary" type="button" onclick="updatePasswordModal();" id="searchpasswordBtn"
								data-bs-toggle="modal" data-bs-target="#searchPasswordResult"
							>비밀번호 변경</button>
						</div>
					</div>
            </div>
            
          </div>
      </div>
    </section>
<!-- Modal -->
<div class="modal fade" id="searchPasswordResult" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
  </main><!-- End #main -->
<script>

//아이디 체크
$("#memberId").change(()=>{
		
		const memberId = $("#memberId").val();
			$.ajax({
				url : "${path}/member/enrollCheckId.do",
				data:{memberId:$("#memberId").val()},
				dataType:"json",
				success : data=>{
					console.log(data);
					if(data){
						$(".checkIdResult").html("<span style='color:red;'>존재하지 않는 아이디 입니다.</span>");
						
					}else{
						$(".checkIdResult").html("<span style='color:green;'>존재하는 아이디 입니다.</span>");
					}
				}
			});	
	})

//인증번호 확인
let compareResult = false;
const compareKey=()=>{
	const emailCode = $("#emailCode").val();
	$(".resultCode").html("");
	if(comparekey == emailCode){
		$(".resultCode").html("<span style='color:green'>인증 성공</span>");
		compareResult = true;
		$("#searchpasswordBtn").css("margin-bottom","10px");
	}else{
		$(".resultCode").html("<span style='color:red'>인증 번호를 다시 입력해 주세요.</span>");
		$("#emailCode").val("");
		$("#searchpasswordBtn").css("margin-bottom","10px");
		compareResult = false;
	}
}
//비밀번호 변경 모달
const updatePasswordModal=()=>{
	if(compareResult){
		$("#updatePasswordBtn").show();
	}else{
		$(".updatePw").html("이메일 인증을 진행해 주세요!");
		$("#updatePasswordBtn").hide();
	}
}

//비밀번호 변경
const updatePassword=()=>{
	$.ajax({
		url:"${path}/member/updatePassword.do",
		data:{memberId:$("#memberId").val(),password:$("#password").val()},
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
	location.assign('${path}/member/memberLoginView.do');
}

//이메일 중복체크
$("#email").keyup(()=>{
	let email = $("#email").val();
	$.ajax({
		type:"post",
		url:"/member/checkEmail.do",
		data:{email:email},
		success:data=>{
			$(".resultEmail").html("");
			if(data){
				$(".resultEmail").html("<span style='color:red;'>존재하지 않는 이메일 입니다.</span>");
				$("#sendMail_").removeAttr("onclick");
			}else{
				$(".resultEmail").html("<span style='color:green;'>존재하는 이메일 입니다.</span>");
				$("#sendMail_").attr("onclick","sendMail();");
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
			url:"/member/sendMail.do",
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