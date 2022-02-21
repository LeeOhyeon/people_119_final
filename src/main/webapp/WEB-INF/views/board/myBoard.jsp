<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path}/resources/assets/css/category.css" rel="stylesheet">

 <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>커뮤니티</h2>
          <ol>
            <li><a href="${path}">Home</a></li>
            <li>커뮤니티</li>
            <li>내 글 목록</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <div class="category">
          <div class="category-btn">
            <button type="button" class="btn btn-light" id="btn-all" style="width:100px" onclick="whole();">전체글</button>
            <button type="button" class="btn btn-light" style="width:100px" onclick="ready();">취준</button>
            <button type="button" class="btn btn-light" style="width:100px" onclick="turn();">이직</button>
            <button type="button" class="btn btn-light" style="width:100px" onclick="leave();">퇴사</button>
            <button type="button" class="btn btn-light" style="width:100px" onclick="free();">잡담</button>
            <button type="button" class="btn btn-light" style="width:100px" onclick="qa();">Q&A</button>
          </div>
        </div>
        <div class="category-name">
          <h2><strong>${loginMember.memberId}</strong>님의 글 목록</h2>
          <p><strong>${loginMember.memberId}</strong>님이 작성하신 최신 글 목록입니다.</p>
        </div>
        <div class="cate">
          <div class="count">
            <h4>전체<strong>${count}</strong>건</h4>
          </div>
          <div class="search">
          </div>
        </div>
        <div class="boardContainer">
        <c:forEach var="l" items="${list}">  
         	<div class="board">
         		<div class="boardTitle">
         			<a href="${path}/board/selectBoard.do?boardNo=${l.boardNo}" id="board-Title"><strong>[${l.category}]&nbsp;&nbsp;${l.boardTitle}</strong></a>
         		</div>
         		<div class="boardSort">
         			<div class="boardLike">
         				${l.likeCount}
         				<span class="board-like"><i class="fas fa-thumbs-up"></i></span>
         			</div>
         			<div class="boardComment">
         				${l.commentCount}
         				<span class="board-comment"><i class="fas fa-comment"></i></span>
         			</div>
         			<div class=boardView>
         				${l.boardView}
         				<span class="board-view"><i class="fas fa-eye"></i></span>
         			</div>
         			<div class="enrollDate">
         				${l.boardDate}
         			</div>
         			<div class="boardWriter">
         				<strong>${l.memberId}</strong>
         			</div>
         		</div>
         	</div>
         	</c:forEach>
        </div>
        <div>
        	${pageBar}
        </div>
      </div>
    </section>
    <script>
      const insertBoard=()=>{
        	location.assign("${path}/board/insertBoard.do");
      }
      const whole=()=>{
			location.assign("${path}/board/boardCategory.do?category=게시글전체");
		}
		const ready=()=>{
			location.assign("${path}/board/boardCategory.do?category=취준");
		}
		const leave=()=>{
			location.assign("${path}/board/boardCategory.do?category=퇴사");
		}
		const turn=()=>{
			location.assign("${path}/board/boardCategory.do?category=이직");
		}
		const free=()=>{
			location.assign("${path}/board/boardCategory.do?category=잡담");
		}
		const qa=()=>{
			location.assign("${path}/board/boardCategory.do?category=질문");
		} 
		
    </script>
  </main><!-- End #main -->
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>