<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link href="${path }/resources/assets/css/searchId.css" rel="stylesheet">
<main id="main">

	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>아이디/비밀번호 찾기</h2>
				<ol>
					<li><a href="${path }">Home</a></li>
					<li>아이디/비밀번호 찾기</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs Section -->

	<section class="inner-page">
		<div class="container">
			<div>
				<p class="find_title">이메일 주소로 찾기</p>
				<p class="find_title2">회원정보에 등록된 이메일 정보로 아이디를 찾을 수 있습니다.</p>
			</div>
			<br> <br>
			<div class="find_container" style="height: 380px;">
				<div class="find_outer">
					<div class="find_info name_info">
						<div class="find_info_name">이름</div>
						<div class="find_info_input">
							<input class="form-control" type="text"
								aria-label="default input example" name="memberName" id="memberName">
						</div>
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
							<button class="btn btn-outline-secondary" type="button" onclick="searchId();" id="searchIdBtn"
								data-bs-toggle="modal" data-bs-target="#searchIdResult"
							>아이디 찾기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<!-- Modal -->
<div class="modal fade" id="searchIdResult" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">아이디 찾기 결과</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body resultSearchId">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="location.assign('${path}/member/memberLoginView.do')">로그인</button>
      </div>
    </div>
  </div>
</div>

</main>
<!-- End #main -->

<script>
//인증번호 확인
let compareResult = false;
const compareKey=()=>{
	const emailCode = $("#emailCode").val();
	$(".resultCode").html("");
	if(comparekey == emailCode){
		$(".resultCode").html("<span style='color:green'>인증 성공</span>");
		compareResult = true;
	}else{
		$(".resultCode").html("<span style='color:red'>인증 번호를 다시 입력해 주세요.</span>");
		$("#emailCode").val("");
		compareResult = false;
	}
}
//아이디 찾기
const searchId=()=>{
	
	if(compareResult){
		$.ajax({
			url:"${path}/member/searchId.do",
			data:{memberName:$("#memberName").val(),email:$("#email").val()},
			dataType:"json",
			success:data=>{
				if(data != null){
					$(".resultSearchId").html(data.memberId);	
				}
			},
			error: e=>{
				console.log("실패");
				$(".resultSearchId").html("검색 결과가 없습니다.");
			}
		});
	
	}else{
		$(".resultSearchId").html("이메일 인증을 진행해 주세요.");
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



</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />