<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/companyHeader.jsp"/>

	<head>

    <title>기업 회원 가입</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="${path }/resources/company/enrollcompany/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="${path }/resources/company/enrollcompany/styles.css" type="text/css" rel="stylesheet"/>
    <link href="${path }/resources/company/enrollcompany/files/enrollcompany/styles.css" type="text/css" rel="stylesheet"/>
    
    
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (Group) -->
      <div id="u2764" class="ax_default" data-left="48" data-top="147" data-width="1271" data-height="764">

        <!-- Unnamed (Group) -->
        <div id="u2765" class="ax_default" data-left="725" data-top="147" data-width="594" data-height="764">

          <!-- Unnamed (Rectangle) -->
          <div id="u2766" class="ax_default box_1">
            <div id="u2766_div" class=""></div>
            <div id="u2766_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>

          

          

          
          <!-- Unnamed (Rectangle) -->
          <div id="u2771" class="ax_default heading_1">
            <div id="u2771_div" class=""></div>
            <div id="u2771_text" class="text ">
              <p><span>119에서 </span></p><p><span>개발자 채용을 시작해보세요!</span></p>
            </div>
          </div>

          <form action="${path }/company/enrollCompany.do" method="post">

            <!-- Unnamed (Rectangle) -->
            <div id="u2772" class="ax_default heading_3">
              <div id="u2772_div" class=""></div>
              <div id="u2772_text" class="text ">
                <p><span>기업 이메일</span></p>
              </div>
            </div>
            <!-- 이메일 input (Text Field) -->
            <div id="u2767" class="ax_default text_field">
              <img id="u2767_img" class="img " src="${path}/resources/company/enrollcompany/images/기업_회원_가입/u2767.svg"/>
              <input id="u2767_input" name="companyId" type="email" value="" class="u2767_input"/>
            </div>
            <!-- Unnamed (Rectangle) -->
            <div id="u2774" class="ax_default button">
              <div id="u2774_div" class=""></div>
              <div id="u2774_text" class="text ">
                <p><span>메일인증</span></p>
              </div>
            </div>
            <!-- Unnamed (Rectangle) -->
            <div id="u2779" class="ax_default heading_3">
              <div id="u2779_div" class=""></div>
              <div id="u2779_text" class="text ">
                <input type="text" >
              </div>
            </div>


            <!-- Unnamed (Rectangle) -->
            <div id="u2773" class="ax_default heading_3">
              <div id="u2773_div" class=""></div>
              <div id="u2773_text" class="text ">
                <p><span>비밀번호</span></p>
              </div>
            </div>
            <!-- 비밀번호 input (Text Field) -->
            <div id="u2768" class="ax_default text_field">
              <img id="u2768_img" class="img " src="${path}/resources/company/enrollcompany/images/기업_회원_가입/u2768.svg"/>
              <input id="u2768_input" name="password" type="password" value="" class="u2768_input"/>
            </div>

            
            <!-- Unnamed (Rectangle) -->
            <div id="u2777" class="ax_default heading_3">
              <div id="u2777_div" class=""></div>
              <div id="u2777_text" class="text ">
                <p><span>담당자 이름</span></p>
              </div>
            </div>
            <!-- 이름 input (Text Field) -->
            <div id="u2775" class="ax_default text_field">
              <img id="u2775_img" class="img " src="${path}/resources/company/enrollcompany/images/기업_회원_가입/u2775.svg"/>
              <input id="u2775_input" name="managerName" type="text" value="" class="u2775_input"/>
            </div>
            

            <!-- Unnamed (Rectangle) -->
            <div id="u2778" class="ax_default heading_3">
              <div id="u2778_div" class=""></div>
              <div id="u2778_text" class="text ">
                <p><span>담당자 연락처</span></p>
              </div>
            </div>
            <!-- 연락처 input (Text Field) -->
            <div id="u2776" class="ax_default text_field">
              <img id="u2776_img" class="img " src="${path}/resources/company/enrollcompany/images/기업_회원_가입/u2775.svg"/>
              <input id="u2776_input" name="managerPhone" type="text" value="" class="u2776_input"/>
            </div>
            


            



            <!-- Unnamed (Checkbox) -->
            <div id="u2780" class="ax_default checkbox">
              <label id="u2780_input_label" for="u2780_input" style="position: absolute; left: 0px;">
                
                <div id="u2780_text" class="text ">
                  <p><span>&nbsp;기업회원 전체 약관에 동의합니다.</span></p>
                </div>
              </label>
              <input id="" type="checkbox" value="checkbox"/>
            </div>

            <!-- Unnamed (Vertical Line) -->
            <div id="u2781" class="ax_default line">
              <img id="u2781_img" class="img " src="${path}/resources/company/enrollcompany/images/기업_회원_가입/u2781.svg"/>
              <div id="u2781_text" class="text " style="display:none; visibility: hidden">
                <p></p>
              </div>
            </div>

            <!-- Unnamed (Checkbox) -->
            <div id="u2782" class="ax_default checkbox">
              <label id="u2782_input_label" for="u2782_input" style="position: absolute; left: 0px;">
                
                <div id="u2782_text" class="text ">
                  <p><span>&nbsp;기업회원 이용약관 </span><span style="color:#D9001B;">(필수)</span></p>
                </div>
              </label>
              <input id="" type="checkbox" value="checkbox"/>
            </div>

            <!-- Unnamed (Checkbox) -->
            <div id="u2783" class="ax_default checkbox">
              <label id="u2783_input_label" for="u2783_input" style="position: absolute; left: 0px;">
                
                <div id="u2783_text" class="text ">
                  <p><span>&nbsp;개인정보 수집 및 이용 동의 </span><span style="color:#D9001B;">(필수)</span></p>
                </div>
              </label>
              <input id="" type="checkbox" value="checkbox"/>
            </div>

            <!-- Unnamed (Checkbox) -->
            <div id="u2784" class="ax_default checkbox">
              <label id="u2784_input_label" for="u2784_input" style="position: absolute; left: 0px;">
                
                <div id="u2784_text" class="text ">
                  <p><span>&nbsp;마케팅 수신 동의</span></p>
                </div>
              </label>
              <input id="" type="checkbox" value="checkbox"/>
            </div>

            <!-- Unnamed (Rectangle) -->
            
            <div id="u2769" class="">
              <button id="u2769_text" class=""  type="submit">회원가입</button>
                              
            </div>
            
          </form>

          <!-- Unnamed (Rectangle) -->
          <div id="u2770" class="ax_default heading_3">
            <div id="u2770_div" class=""></div>
            <div id="u2770_text" class="text ">
              <p><span style="color:rgba(170, 170, 170, 0.9921568627450981);">이미 가입되어 있으신가요?</span>
                <span> </span><span style="color:#63A103;">로그인하기</span></p>
            </div>
          </div>


        </div>

        <!-- Unnamed (Group) -->
        <div id="u2785" class="ax_default" data-left="48" data-top="147" data-width="677" data-height="764">

          <!-- Unnamed (Image) -->
          <div id="u2786" class="ax_default image">
            <img id="u2786_img" class="img " src="${path}/resources/company/enrollcompany/images/기업_회원_가입/u2786.jpg"/>
            <div id="u2786_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>
        </div>
      </div>
    </div>
   
  </body>


<div style="height:1100px; width: 100%"></div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>