<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path}/resources/assets/css/selectBoard.css" rel="stylesheet">
<script>
$(document).ready(()=>{ 
	selectComment(); 
	
	likeCount();
	countComment();
});
</script>
 <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>커뮤니티</h2>
          <ol>
            <li><a href="/">커뮤니티 홈</a></li>
            <li><a href="/">전체 게시글</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <div>
            <button type="button" class="btn btn-light" style="width:120px" onclick="wholeBoard();">전체 게시글</button>
        </div>
        <div class="board">
          <div>
	          <div class="boardTitle">
	              <h5><strong>[${b.category}]&nbsp;${b.boardTitle}</strong></h5>
	          </div>
	          <c:if test="${b.memberId eq loginMember.memberId}">
	          	<div class="updateboard">
	          	  <span class="boardupdate" onclick="location.assign('${path}/board/updateBoardView.do?boardNo=${b.boardNo}');">수정</span>
	          	  <span class="boarddelete" onclick="boardDelete();">삭제</span>
	          </div>
	          </c:if>
          </div>
          <div class="writer">
            <div class="writerInfo">
              <div class="writerImage">
                <span class="writer-image"><i class="fas fa-user-tie"></i></span>
              </div>
              <div class="boardWriter">
                <p>${b.memberId}<br>
                  ${b.boardDate}
                </p>
              </div>
              <div class="boardInfo">
                <div class="boardInfo-like">
                  <span class="boardInfo-like-image"><i class="far fa-thumbs-up"></i></span>
                  <span class="boardLikeCount"></span>
                </div>
                <div class="boardInfo-comment">
                  <span class="boardInfo-comment-image"><i class="far fa-comment"></i></span>
                  <span class="boardCommentCount"></span>
                </div>
              </div>
            </div>
          </div>
          <div class="boardContent">
              <div class="content">
                ${b.boardContent}
              </div>
          </div>
          <div class="boardLike" onclick="like();">
            <div class="image">
             <span class="like-image"><i class="far fa-laugh-wink"></i></span> 
            </div>
            <div class="like">
              <p>좋아요</p>
            </div>
            <div class="like-count">
              <p class="like-count-px"><strong></strong></p>
            </div>
          </div>
        </div>
        <div class="comment"> 
          <div class="memberId">
            <div><p class="nickname"><strong>${loginMember.memberId}</strong></p></div>
          </div>
          <div class="form-floating">
            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height:100px; width: 900px; resize: none;" ></textarea>
            <label for="floatingTextarea2">Comments</label>
          </div>
          <div class="submit">
              <button type="button" class="btn btn-primary" style="width:120px" onclick="insertComment();">등록하기</button>
          </div>
        </div>
        <div class="comment-list">
            <div class="comment-horizon">
              <h5><strong>답변</strong></h5>
            </div>
        </div>
      </div>
    </section>
  <script>
  	//댓글 db등록
  	const insertComment=()=>{
  		const commentContent=$("#floatingTextarea2").val();
  		const comment=document.getElementById("floatingTextarea2");
  		let memberIdVal = "${loginMember.memberId}"; 
  		
  		if(memberIdVal!="") {
  			$.ajax({
  	  			url: "${path}/board/insertComment.do",
  	  			data: {boardNo:"${b.boardNo}","memberId":"${loginMember.memberId}","commentContent":commentContent,"commentLevel":"1"},
  	  			dataType:"json",
  	  			success:data=>{
  	  				selectComment();
  	  				countComment();
  	  				comment.value=null;
  	  			}
  	  		});	
  		}else{
  			alert("로그인 후 이용해주세요");
  			location.assign("${path}/member/memberLoginView.do");
  		}
  	}
  	
  	
  	//댓글 화면출력
  	function selectComment(){
  		let memberIdVal = "${loginMember.memberId}"; 
  		$.ajax({
  			url : "${path}/board/selectComment.do",
  			data : {boardNo:"${b.boardNo}"},
  			dataType:"json",
  			success:data=>{
  				selectReply();
  				let commentNo;
  				$(".comment-content").remove();
  				$(".comment-reply").remove();
  				$(".reply-container").remove();
  				if(data.length != 0){
  					for(let i=0;i<data.length;i++){
  						commentNo = data[i]["commentNo"];
  	  					if(data[i]["commentLevel"]==1) {
  	  					const comment=$("<div class='cm'>");
  						const commentContainer=$("<div class='comment-content'>");
  	  					const container=$("<div class='comment-container'>");
  	  					const content = $("<div class='comment-1'>");
  	  					const deleteDiv=$("<div class='comment-delete'>");
  	  					
  	  					
	  					const image=$("<span class='delete-btn' onclick='deleteComment(this);'>");
  	  					const j=$("<i class='fas fa-ellipsis-v'>");
  	  					
  	  					
  	  					
  	  					
  	  					const memberContainer=$("<div class='member-container'>");
  	  					const member=$("<div class='member'>");
  	  					const memberId=$("<span class='member-id'>");
  	  					
  	  					const enrollDate=$("<div class='enrolldate'>")
  	  					const p=$("<p>");
  	  					const reply=$("<div class='comment-reply' id='"+commentNo+"'>");
  	  					const arrow=$("<div class='arrow'>");
  	  					const span=$("<span class='arrow-image'>");
  	  					const im=$("<i class='fas fa-angle-right'>");
  	  					const inputGroup=$("<div class='input-group mb-3'>");
  	  					const input=$("<input name='commentContent' type='text' class='form-control recomment' placeholder='답변에 댓글을 입력해주세요' aria-label='reply' aria-describedby='button-addon2'>")
  	  					const button=$("<button type='button' class='btn btn-outline-secondary' id='button-addon2' onclick='reply(this);'>")
  	  					
  	  					
  	  					button.text("등록하기");
  	  					span.append(im);
  	  					arrow.append(span);
  	  					inputGroup.append(input).append(button);
  	  					reply.append(arrow).append(inputGroup);
  	  					
  	  					image.html("삭제");
  	  					deleteDiv.append(image);
  	  					
  	  					p.text(data[i]["commentDate"]);
  	  					enrollDate.append(p);
  	  					content.text(data[i]["commentContent"]);
  	  					container.append(content).append(deleteDiv); 					
  	  					memberId.text(data[i]["memberId"]);
  	  					member.append(memberId);
  	  					memberContainer.append(member).append(enrollDate);
  	  					commentContainer.append(container).append(memberContainer);
  	  					comment.append(commentContainer).append(reply);
  	  					$(".comment-horizon").append(comment);
  	  					
	  	  					if(data[i]["memberId"]!=memberIdVal) {
	  	  						deleteDiv.css({"display":"none"});
	  	  					}
  	  					}
  	  					
  					}
  				}
  						
  			}
  		})
  	}
  	
  	
  	//댓글 숫자 출력
  	function countComment() {
  		$.ajax({
  			url: "${path}/board/countComment.do",
  			data: {boardNo:"${b.boardNo}"},
  			dataType: "json",
  			success:data=>{
  				$(".boardCommentCount").html(data);
  			}
  		})
  	}
  	
  	
  	//좋아요 데이터 입력
  	const like=()=> {
  		let memberIdVal = "${loginMember.memberId}"; 
  		if(memberIdVal!="") {
  			$.ajax({
  	  			url:"${path}/board/boardLike.do",
  	  			data:{boardNo:"${b.boardNo}","memberId":"${loginMember.memberId}"},
  	  			dataType:"json",
  	  			success:data=>{
  	  				if(data>0) {
  	  					alert("좋아요 성공!");
  	  					likeCount();	
  	  				}else{
  	  					alert("이미 좋아요한 게시글입니다.")
  	  				}
  	  			}
  	  		});
  		}else{
  			alert("로그인 후 이용해주세요");
  			location.assign("${path}/member/memberLoginView.do");
  		}
  	} 
  
  	//좋아요 숫자 출력
  	function likeCount() {
  		$.ajax({
  			url:"${path}/board/boardLikeCount.do",
  			data:{boardNo:"${b.boardNo}","memberId":"${loginMember.memberId}"},
  			dataType:"json",
  			success:data=>{
  				$(".like-count-px").text(data);
  				$(".boardLikeCount").html(data);
  				
  			}
  		});
  	}
  	
  	//게시글 전체 이동
  	const wholeBoard=()=>{
  		location.assign("${path}/board/boardCategory.do?category=게시글전체");
  	}
  	
  	
  	//대댓글 ajax
  	const reply=(e)=>{
  		let btn = $(e);
  		
  		let commentContent = $(btn.parents('.comment-reply')).find('input[name=commentContent]').val();
  		let commentNo=$(btn.parents('.comment-reply')).attr("id");
  		console.log(commentNo);
  		$.ajax({
  			url:"${path}/board/commentReply.do",
  			data:{boardNo:"${b.boardNo}",commentRef:commentNo,"memberId":"${loginMember.memberId}",commentContent:commentContent},
  			dataType:"json",
  			success:data=>{	
  				alert("대댓글 등록성공!");
  				selectReply();
  				$(btn.parents('.comment-reply')).find('input[name=commentContent]').val("");
  			}
  		})
  	
  	}
  	
  	//대댓글 화면출력
  	function selectReply() {
  		let memberIdVal = "${loginMember.memberId}"; 
  		$.ajax({
  	 		url:"${path}/board/selectReply.do",
  			data:{boardNo:"${b.boardNo}"},
  			dataType:"json",
  			success:data=>{	
  				$(".reply-container").remove();
  				$(".reply-content").remove();
  				for(let i=0; i<data.length; i++) {
  					
  					const reply=$("<div class='reply-container'>");
  					const content=$("<div class='reply-content' id='"+data[i]["commentNo"]+"'>");
  					const replyinfo=$("<div class='reply-info'>");
  					const imgDiv=$("<div class='imgDiv'>");
  					const span=$("<span class='reply-image'>");
  					const image=$("<i class='fas fa-ellipsis-h'></i>");
  					const replydiv=$("<div class='"+data[i]["commentRef"]+"'style='display:inline-block;'>");	
  					const replydelete=$("<span class='reply-delete' onclick='replyDelete(this);'>")
  					const id=$("<div class='memberId'>");
  					const date=$("<div class='enrolldate'>");
  					const info=$("<div class='info'>");
  					
  					
  				
  					if($("#"+data[i]["commentRef"]).attr("id")==replydiv.attr("class")) {
  						span.append(image);
  						imgDiv.append(span);
  						id.html(data[i]["memberId"]);
  						date.html(data[i]["commentDate"]);	
  						replydiv.html(data[i]["commentContent"]); //얘는 내용 출력
  						replydelete.text("삭제");
  						info.append(replydelete).append(id).append(date);
  						replyinfo.append(replydiv).append(info); //대댓 하나 통 틀어
  						content.append(imgDiv).append(replyinfo);
  						$("#"+data[i]["commentRef"]).after(content);
  						if(data[i]["memberId"]!=memberIdVal) {
  	  						replydelete.css({"display":"none"});
  	  					}
  					}
  				}  
  				
  			}
  	 	})
  	}
  	
  	//댓글삭제
  	const deleteComment=(e)=>{
  		let span = $(e);
  		let del = $(span.parents('.cm')).find('.comment-reply').attr("id");
  		if(confirm("댓글을 삭제하시겠습니까??")==true) {
  			$.ajax({
  				url:"${path}/board/deleteComment.do",
  				data:{commentNo:del},
  				dataType:"json",
  				success:data=>{
  					alert("댓글이 삭제되었습니다!");
  					$(span.parents('.cm')).remove();
  				}
  			});		
  		}else{
  			return;
  		} 
  	}
  	
  	//대댓글 삭제
  	const replyDelete=(e)=>{
  		let span = $(e);
  		let del = $(span.parents('.reply-content')).attr("id");
  		if(confirm("댓글을 삭제하시겠습니까??")==true) {
  			$.ajax({
  				url:"${path}/board/deleteReply.do",
  				data:{commentNo:del},
  				dataType:"json",
  				success:data=>{
  					alert("댓글이 삭제되었습니다!");
  					$(span.parents('.reply-content')).remove();
  				}
  			});		
  		}else{
  			return;
  		}
  	}
  	
  	const boardDelete=()=>{
  		if(confirm("게시글을 삭제하시겠습니까??")==true) {
  			$.ajax({
  				url:"${path}/board/deleteBoard.do",
  				data:{boardNo:"${b.boardNo}"},
  				dataType:"json",
  				success:data=>{
  					location.assign("${path}/board/boardList.do");
  					alert("게시글 삭제가 완료되었습니다");
  				}
  			})
  		}
  	}
  	
  	
  	
  	
  	
  	//조회하는거
  	//얘가 실시간처럼 보이게 하려면
  	//일단 function selectComment(){여기에 댓글 가져오는 ajax}
  	//$(document).ready(()=>{ selectComment();  });
  </script>
  </main><!-- End #main -->



 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>