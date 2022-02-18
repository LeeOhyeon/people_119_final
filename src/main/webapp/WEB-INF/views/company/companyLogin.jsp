<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/companyHeader.jsp"/>

<head>
    <title>companylogin</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="${path }/resources/company/companylogin/resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="${path }/resources/company/companylogin/data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="${path }/resources/company/companylogin/files/companylogin/styles.css" type="text/css" rel="stylesheet"/>
    <script src="${path }/resources/company/companylogin/resources/scripts/jquery-3.2.1.min.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/axQuery.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/globals.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axutils.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/annotation.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/axQuery.std.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/doc.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/messagecenter.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/events.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/recording.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/action.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/expr.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/geometry.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/flyout.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/model.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/repeater.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/sto.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/utils.temp.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/variables.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/drag.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/move.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/visibility.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/style.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/adaptive.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/tree.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/init.temp.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/legacy.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/viewer.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/math.js"></script>
    <script src="${path }/resources/company/companylogin/resources/scripts/axure/jquery.nicescroll.min.js"></script>
    <script src="${path }/resources/company/companylogin/data/document.js"></script>
    <script src="${path }/resources/company/companylogin/files/companylogin/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return '${path}/resources/company/companylogin/resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return '${path}/resources/company/companylogin/resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return '${path}/resources/company/companylogin/resources/reload.html'; };
    </script>
  </head>
  <body>
    <div id="base" class="">

      

      

      <!-- Unnamed (Group) -->
      <div id="u7" class="ax_default" data-left="54" data-top="257" data-width="1271" data-height="506">

        <!-- Unnamed (Rectangle) -->
        <div id="u8" class="ax_default box_1">
          <div id="u8_div" class=""></div>
          <div id="u8_text" class="text " style="display:none; visibility: hidden">
            <p></p>
          </div>
        </div>

        <!-- Unnamed (Group) -->
        <div id="u9" class="ax_default" data-left="784" data-top="296" data-width="417" data-height="317">

          <!-- Unnamed (Rectangle) -->
          <div id="u10" class="ax_default heading_1">
            <div id="u10_div" class=""></div>
            <div id="u10_text" class="text ">
              <p><span>로그인이 필요한 서비스 입니다.</span></p>
            </div>
          </div>

          <!-- Unnamed (Rectangle) -->
          <div id="u11" class="ax_default heading_2">
            <div id="u11_div" class=""></div>
            <div id="u11_text" class="text ">
              <p><span>기업회원</span></p>
            </div>
          </div>

		<form action="${path}/company/companyLogin.do" method="post">

          <!-- 아이디 (Text Field) -->
          <div id="u12" class="ax_default text_field">
            <img id="u12_img" class="img " src="${path}/resources/company/companylogin/images/companylogin/u12.svg"/>
            <input id="u12_input" type="email" value="" name="companyId" class="u12_input" placeholder="아이디(이메일)"/>
          </div>

          <!-- 비밀번호 (Text Field) -->
          <div id="u13" class="ax_default text_field">
            <img id="u13_img" class="img " src="${path}/resources/company/companylogin/images/companylogin/u12.svg"/>
            <input id="u13_input" type="password" value="" name="password" class="u13_input" placeholder="비밀번호"/>
          </div>

          <!-- 로그인버튼 (Rectangle) -->
          <div id="u14" class="ax_default primary_button">
            <button type="submit" >시작하기</button>
            
            
          </div>
        </div>
        
        </form>

        <!-- 기업회원가입 링크 (Rectangle) -->
        <div id="u15" class="ax_default heading_3">
          <div id="u15_div" class=""></div>
          <div id="u15_text" class="text ">
            <p><span>아직 회원이 아니신가요? </span>
            <span style="color:#02A7F0;">기업회원 가입</span></p>
          </div>
        </div>

        <!-- 아이디/비밀번호 찾기 링크 (Rectangle) -->
        <div id="u16" class="ax_default heading_3">
          <div id="u16_div" class=""></div>
          <div id="u16_text" class="text ">
            <p><span>아이디/비밀번호 찾기</span></p>
          </div>
        </div>

        <!-- Unnamed (Image) -->
        <div id="u17" class="ax_default image">
          <img id="u17_img" class="img " src="${path}/resources/company/companylogin/images/companylogin/u17.jpg"/>
          <div id="u17_text" class="text " style="display:none; visibility: hidden">
            <p></p>
          </div>
        </div>
      </div>
    </div>
    <script src="${path}/resources/company/companylogin/resources/scripts/axure/ios.js"></script>
  </body>

<div style="height:1000px; width: 100%"></div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>