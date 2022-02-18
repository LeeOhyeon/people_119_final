<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link href="${path }/resources/assets/css/enrollMember.css" rel="stylesheet">
<main id="main">


	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>회원가입</h2>
				<ol>
					<li><a href="index.html">Home</a></li>
					<li>회원가입</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs Section -->

	<section class="inner-page">
		<div class="container">

			<div class="enroll-Container">
				<form action="${path }/member/enrollMember.do" method="post" onsubmit="return submitCheck();">
					<div class="input-info-container">
						<div class="enroll_title">개인회원가입</div>
						<div class="input-name">ID</div>
						<div class="input-info">
							<div class="input-group mb-3">
								<input type="text" class="form-control" required="required"
									aria-label="Recipient's username"
									aria-describedby="button-addon2" name="memberId" id="memberId">
								<button class="btn btn-outline-secondary" type="button"
									id="button-addon2" onclick="checkId();">중복확인</button>
							</div>
							<div class="checkIdResult">
							</div>
							<div class="input-name">PASSWORD</div>
							<div class="input-info">
								<input class="form-control" type="password" required="required"
									aria-label="default input example" name="password" id="password" placeholder="영문 대/소문자+숫자+특수문자 조합 최소 8자리 이상">
							</div>
							<div class="password_ck">
							</div>
							
							<div class="input-name">PASSWORD_CHECK</div>
							<div class="input-info">
								<input class="form-control" type="password"
									aria-label="default input example" id="password_">
							</div>
							<div class="checkPassword"></div>
							
							<div class="input-name">EMAIL</div>
							<div class="input-info">
								<div class="input-group mb-3">
									<input type="email" class="form-control"
										aria-label="Recipient's username" name="email" id="email" required="required"
										aria-describedby="sendMail">
									<button class="btn btn-outline-secondary" type="button" id="sendMail_"
									 onclick="sendMail();">인증</button>
								</div>
							</div>
							<div class="resultEmail"></div>
							
							
							<div class="input-name">EMAIL_CHECK</div>
							<div class="input-info">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										aria-label="Recipient's username" required="required"
										aria-describedby="sendMail" id="emailCode">
									<button class="btn btn-outline-secondary" type="button"
										onclick="compareKey();">인증확인</button>
								</div>
							</div>
							<div class="resultCode"></div>
							
							
							
							<div class="input-name">약관 동의</div>
							<div class="agree">
								<div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault"> (필수)
											개인회원 약관에 동의 </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault2"> <label
											class="form-check-label" for="flexCheckDefault2"> (필수)
											개인정보 수집 및 이용에 동의 </label>
									</div>
								</div>
							</div>
							<div class="input-info">
								<div class="enroll-btn">
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

</main>
<!-- End #main -->

<script>
	const checkId=()=>{
		
		const memberId = $("#memberId").val();
		if(memberId.length<5 || memberId.length>13){
			$(".checkIdResult").html("<span style='color:red;'>아이디는 5글자 이상 13글자 미만입니다.</span>");
		}else{
			$.ajax({
				url : "${path}/member/enrollCheckId.do",
				data:{memberId:$("#memberId").val()},
				dataType:"json",
				success : data=>{
					console.log(data);
					if(data){
						$(".checkIdResult").html("<span style='color:green;'>사용 가능한 아이디 입니다.</span>");
						
					}else{
						$(".checkIdResult").html("<span style='color:red;'>이미 사용중인 아이디 입니다.</span>");
					}
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
	
	//이메일 중복체크
	$("#email").keyup(()=>{
		let email = $("#email").val();
		$.ajax({
			type:"post",
			url:"/member/checkEmail.do",
			data:{email:email},
			success:data=>{
				if(data){
					$(".resultEmail").html("<span style='color:green;'>사용 가능한 이메일 입니다.</span>");
					$("#sendMail_").attr("onclick","sendMail();");
				}else{
					$(".resultEmail").html("<span style='color:red;'>이미 사용중인 이메일 입니다.</span>");
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

	
	//인증번호 확인
	let compareResult;
	const compareKey=()=>{
		const emailCode = $("#emailCode").val();
		
		if(comparekey == emailCode){
			$(".resultCode").html("<span style='color:green'>인증 성공</span>");
			compareResult = true;
		}else{
			$(".resultCode").html("<span style='color:red'>인증 번호를 다시 입력해 주세요.</span>");
			$("#emailCode").val("");
			compareResult = false;
		}
	}
	
	//이메일 인증 확인
	const submitCheck=()=>{
		if(!compareResult){
			alert("메일 인증이 완료되지 않았습니다.");
			return false;
		}else{
			return true;
		}
		
	}
	
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />