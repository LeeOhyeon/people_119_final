<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path}/resources/assets/css/board.css" rel="stylesheet">
<main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>커뮤니티</h2>
          <ol>
            <li><a href="${path }">Home</a></li>
            <li>커뮤니티</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <div class="boardInfo">
          <div class="boardCount">
            <h3><strong>실시간 전체글 ${count}개</strong></h3>
          </div>
          <div class="boardSearch">
            <div class="boardSearch-container">
             <%--  <c:if test="${loginMember==null}">
	              <div class="board-login">
	                <div>
	                  <p class="login">로그인 후 이용해주세요</p>
	                </div>
	                <div class="board-login-btn">
	                  <button type="button" onclick="login();" class="btn btn-primary" style="width:200px">커뮤니티 로그인하기</button>
	                </div>
	              </div>
              </c:if> --%>
             <%--  <c:if test="${loginMember!=null}">
              	<div class="board-login">
	                <div>
	                  <p class="login">환영합니다. <strong>${loginMember.memberId}님</strong></p>
	                </div>
	                <div>
	                  <a href="" class="board-confirm">내 글 확인하기</a>
	                </div>
	                <div class="board-btn">
	               		<div class="board-logout-btn">
	                  		<button type="button" onclick="logout();" class="btn btn-primary" style="width:100px">로그아웃</button>
	                	</div> 
	                	<div class="board-mypage-btn">
	                		<button type="button" onclick="myPage();" class="btn btn-primary" style="width:120px">마이페이지</button>
	                	</div>
	                </div>
	            </div>
              </c:if> --%>
            </div>
          </div>
        </div>
        <div class="board-content">
          <div class="topic">
            <div class="topic-font">
              <a href="#" class="hot-topic"><strong>HOT</strong> 이번주 전체 인기글</a>
            </div>
            <div class="hot-image-div">
              <p class="hot-image"><i class="fas fa-fire"></i></p>
            </div>
          </div>
          <div class="content">
            <c:if test="${not empty list}">
            	<c:forEach var="h" items="${hot}" begin="0" end="4">
		            <div>
			            <div class="content-container">
			              <a href="${path}/board/selectBoard.do?boardNo=${h.boardNo}" class="whole-color"><c:out value="${h.boardTitle}"/></a>
			            </div>
			            <div class="parse">
			              <span class="comment"><i class="fas fa-comment"></i>&nbsp;${h.commentCount}</span>
			              <span class="view"><i class="fas fa-eye"></i>&nbsp;${h.boardView}</span>
			              <span class="like"><i class="fas fa-thumbs-up"></i>&nbsp;${h.likeCount}</span>
			            </div>
		            </div>
            	</c:forEach>
            </c:if>
          </div>
        </div>
        <div class="board-category">
          <div>
            <h3><strong>주제별 커뮤니티</strong></h3>
          </div>
          <div class="category">
            <div class="category-btn">
              <button type="button" class="btn btn-primary" style="width:100px" onclick="whole();">전체글</button>
              <button type="button" class="btn btn-light" style="width:100px" onclick="ready();">취준</button>
              <button type="button" class="btn btn-light" style="width:100px" onclick="turn();">이직</button>
              <button type="button" class="btn btn-light" style="width:100px" onclick="leave();">퇴사</button>
              <button type="button" class="btn btn-light" style="width:100px" onclick="free();">잡담</button>
              <button type="button" class="btn btn-light" style="width:100px" onclick="qa();">Q&A</button>
            </div>
          </div>
        </div>
        <div class="board">
          <div class="board-1">
            <div class="whole-content">
              <div class="whole">
                <div class="whole-title">
                  <h5><strong>전체글</strong></h5>  
                </div>
                <div class="whole-total-view">
                  <a href="${path}/board/boardCategory.do?category=게시글전체" class="whole-total">더보기</a>
                </div>
                <div class="whole-contents">
                  <c:if test="${not empty list}">
            		<c:forEach var="l" items="${list}" begin="0" end="4">
                 	 	<div>
                 	 		<div class="content-container"><a href="${path}/board/selectBoard.do?boardNo=${l.boardNo}" class="whole-color"><c:out value="${l.boardTitle}"/></a></div>
                 	 		<div class="parse">
					              <span class="comment"><i class="fas fa-comment"></i>&nbsp;${l.commentCount}</span>					             
					              <span class="like"><i class="fas fa-thumbs-up"></i>&nbsp;${l.likeCount}</span>
				            </div>                 		
                 	 	</div>                 	 	
                  	</c:forEach>
                  </c:if>
                </div>
              </div>
            </div>
            <div class="ready-empl">
              <div class="ready">
                <div class="ready-title">
                  <h5><strong>취준</strong></h5>  
                </div>
                <div class="ready-total-view">
                  <a href="${path}/board/boardCategory.do?category=취준" class="ready-total">더보기</a>
                </div>
                 <div class="ready-contents">               
            		<c:forEach var="r" items="${ready}" begin="0" end="4">        		
         					<div>
         						<div class="content-container"><a href="${path}/board/selectBoard.do?boardNo=${r.boardNo}" class="whole-color"><c:out value="${r.boardTitle}"/></a></div>
	         					<div class="parse">
					              <span class="comment"><i class="fas fa-comment"></i>&nbsp;${r.commentCount}</span>					             
					              <span class="like"><i class="fas fa-thumbs-up"></i>&nbsp;${r.likeCount}</span>
				            	</div>
         					</div>	
            		</c:forEach>
             	 </div>
              </div>
            </div>
          </div>
          <div class="board-2">
            <div class="turnover-content">
              <div class="turnover">
                <div class="turnover-title">
                  <h5><strong>이직</strong></h5>  
                </div>
                <div class="turnover-total-view">
                  <a href="${path}/board/boardCategory.do?category=이직" class="turnover-total">더보기</a>
                </div>
                <div class="turnover-contents">                 
            		<c:forEach var="t" items="${turnover}" begin="0" end="4">            			
                 			 <div>
                 			 	<div class="content-container"><a href="${path}/board/selectBoard.do?boardNo=${t.boardNo}"  class="whole-color"><c:out value="${t.boardTitle}"/></a></div>
								 <div class="parse">
					              <span class="comment"><i class="fas fa-comment"></i>&nbsp;${t.commentCount}</span>				 
					              <span class="like"><i class="fas fa-thumbs-up"></i>&nbsp;${t.likeCount}</span>
				            	</div>
			            	</div>					
					</c:forEach>
             	 </div>
              </div>
            </div>
            <div class="leave-content">
              <div class="leave">
                <div class="leave-title">
                  <h5><strong>퇴사</strong></h5>  
                </div>
                <div class="leave-total-view">
                  <a href="${path}/board/boardCategory.do?category=퇴사" class="leave-total">더보기</a>
                </div>
                <div class="leave-contents">                 
            		<c:forEach var="e" items="${leave}" begin="0" end="4">
            			<div>
	            		 	<div class="content-container"><a href="${path}/board/selectBoard.do?boardNo=${e.boardNo}"  class="whole-color"><c:out value="${e.boardTitle}"/></a></div>
	                  		<div class="parse">
						       <span class="comment"><i class="fas fa-comment"></i>&nbsp;${e.commentCount}</span>				 
						       <span class="like"><i class="fas fa-thumbs-up"></i>&nbsp;${e.likeCount}</span>
					        </div>
            			</div>              
                  	</c:forEach>
             	 </div>
              </div>
            </div>
          </div>
          <div class="board-3">
            <div class="free-content">
              <div class="free">
                <div class="free-title">
                  <h5><strong>잡담</strong></h5>  
                </div>
                <div class="free-total-view">
                  <a href="${path}/board/boardCategory.do?category=잡담" class="free-total">더보기</a>
                </div>
                <div class="free-contents">                 
            		<c:forEach var="f" items="${free}" begin="0" end="4">
            			<div>
            				<div class="content-container"><a href="${path}/board/selectBoard.do?boardNo=${f.boardNo}" class="whole-color"><c:out value="${f.boardTitle}"/></a></div>
            				<div class="parse">
						       <span class="comment"><i class="fas fa-comment"></i>&nbsp;${f.commentCount}</span>				 
						       <span class="like"><i class="fas fa-thumbs-up"></i>&nbsp;${f.likeCount}</span>
					        </div>
            			</div>                 			             
                  	</c:forEach>
             	 </div>
              </div>
            </div>
            <div class="question-content">
              <div class="question">
                <div class="question-title">
                  <h5><strong>Q&A</strong></h5>  
                </div>
                <div class="question-total-view">
                  <a href="${path}/board/boardCategory.do?category=질문" class="question-total">더보기</a>
                </div>
                <div class="qa-contents">                 
            		<c:forEach var="q" items="${qa}" begin="0" end="4">
            			<div>
            				<div class="content-container"><a href="${path}/board/selectBoard.do?boardNo=${q.boardNo}" class="whole-color"><c:out value="${q.boardTitle}"/></a></div>
            				<div class="parse">
						       <span class="comment"><i class="fas fa-comment"></i>&nbsp;${q.commentCount}</span>				 
						       <span class="like"><i class="fas fa-thumbs-up"></i>&nbsp;${q.likeCount}</span>
					        </div>            			
            			</div>          		                 		                 
                  	</c:forEach>
             	 </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <script>
		const login=()=> {
			location.assign("${path}/member/memberLoginView.do");
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