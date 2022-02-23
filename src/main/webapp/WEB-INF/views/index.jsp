<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h1 data-aos="fade-up">치타는 지금 웃고있다</h1>
          <h2 data-aos="fade-up" data-aos-delay="400">이제 출발한다<br> 경주장의 치타가...<br> 다른 경주견들은 직감적으로 긴장하기 시작했다... </h2>
          <div data-aos="fade-up" data-aos-delay="800">
          	<!-- 달리기 시작하기 누르면? MyPage에 이력서 작성하는 쪽으로 연결시켜주는거야. 아이디어 개쩔었다 ㄹㅇㅋㅋ -->
            <a href="${path }/resume/insertResumeView.do?memberId=${loginMember.memberId}" class="btn-get-started scrollto">달리기 시작하기</a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="fade-left" data-aos-delay="200">
          <img src="${path}/resources/assets/img/cheetahSmile.jpg" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">


    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container">

        <div class="row">
          <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-xl-start" data-aos="fade-right" data-aos-delay="150">
            <img src="${path}/resources/assets/img/counts-img.svg" alt="" class="img-fluid">
          </div>

          <div class="col-xl-7 d-flex align-items-stretch pt-4 pt-xl-0" data-aos="fade-left" data-aos-delay="300">
            <div class="content d-flex flex-column justify-content-center">
              <div class="row">
                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-emoji-smile"></i>
                    <!-- start숫자는 0으로 고정하고 end숫자를 DB에서 최종합격자 수를 가져오면 될듯 -->
                    <span data-purecounter-start="0" data-purecounter-end="275" data-purecounter-duration="1" class="purecounter"></span>
                    <p><strong>Smiling Cheetah</strong> PEOPLE119를 통해 취업에 성공한 치타의 수</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-journal-richtext"></i>
                    <span class="countOffer"></span>
                    <p ><strong>Job Posting</strong> PEOPLE119에 올라와 있는 채용공고의 수</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-clock"></i>
                    <span data-purecounter-start="0" data-purecounter-end="975" data-purecounter-duration="1" class="purecounter"></span>
                    <p><strong>Starting Cheetah</strong> PEOPEL119를 통해 취업을 준비하고 있는 치타의 수</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-award"></i>
                    <span class="countCompany"></span>
                    <p><strong>Company</strong> PEOPLE119와 연결되어 있는 회사 수</p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End Counts Section -->

    <!-- ======= 마감임박 공고 ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
           <h2>새로 올라온 공고</h2>
          <p>새로 올라온 공고를 확인하고, 나에게 맞는 포지션에 지원하세요!</p>
        </div>

        <div class="row newOffer">

        </div>

      </div>
    </section><!-- End 마감임박 공고 -->


    <!-- ======= 합격 후기 ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>면접 후기</h2>
          <p>면접을 보고온 치타의 생생한 후기를 확인해보세요</p>
        </div>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End 합격 후기 -->
   
   </main>
	
	
	<script type="text/javascript">

		$(document).ready(()=>{
			countOffer();
			countCompany();
			newOfferList();
			 newInterview();
		});
		
		//전체 공고 갯수
		function countOffer(){
			
			$.ajax({
				url : "${path}/offer/countOffer.do",
				success:data=>{
					$(".countOffer").html(data);
				}
			});
			
		}
		
		//전체 회사 수
		function countCompany(){
			$.ajax({
				url : "${path}/company/countCompany.do",
				success:data=>{
					$(".countCompany").html(data);
				}
			});
			
		}
		
		//새로 올라온 공고
		function newOfferList(){
			$.ajax({
				url:"${path}/offer/newOfferList.do",
				success:data=>{
				 for(let i=0;i<4;i++){
					 const div1 = $("<div class='col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0'>");
			         const div2 =  
			   $("<div class='icon-box' data-aos='fade-up' data-aos-delay='"+(i+1)+"00'><a href='${path}/offer/offerView.do?offerNo="+data[i]["offerNo"]+"'><div style='width: 250px; height: 150px'><img src='${path}/resources/upload/company/"+data[i]['favicon']+"'style='width: 250px; height: 150px'></div><h4 class='title companyNameTitle'>"+data[i]["companyName"]+"</h4><p class='description'>"+data[i]["offerTitle"]+"</p><p class='description'>"+data[i]["tech"]+"</p><p class='description'>마감일 : <span style='color:red'>"+data[i]["endDate"]+"</span></p>");  
			         /* const div3 = $("<div style='width: 250px; height: 150px'>"); 
			         const img = $("<img>");
			         img.attr("src","${path}/resources/upload/"+data[i]["image"]);
			         img.css("width","250px");
			         img.css("height","150px");
			         const companyName = $("<h4 class='title'><a href='${path}/offer/offerView.do?offerNo="+data[i]["offerNo"]+"'>"+data[i]["companyName"]+"</a></h4>"); 
			         const offerTitle = $("<p class='description'>"+data[i]["offerTitle"]+"</p>");
			         const tech=$("<p class='description'>"+data[i]["tech"]+"</p>");    
			         const endDate=$("<p class='description'>"+data[i]["endDate"]+"</p>");	 
			         div1.append(div2).append(companyName).append(offerTitle).append(tech).append(endDate); */
			         
			         div1.append(div2);
			         $(".newOffer").append(div1);
				 }	
					
				}
			});
			
		}

	//면접후기
		
		function newInterview(){
			$.ajax({
				url : "${path}/interview/newInterviewList.do",
				success:data=>{
					console.log(data);
					for(let i=0;i<data.length;i++){
						const div1 = $("<div class='swiper-slide'>");
						const div2 = $("<div class='testimonial-wrap'>");
						const div3 = $("<div class='testimonial-item' style='display:flex; cursor:pointer; justify-content:space-around;' onclick=\"location.assign('${path}/interview/selectInterview.do?interviewReviewNo="+data[i]["interviewReviewNo"]+"')\"><div style='display:inline-block'><h3>"+data[i]["companyName"]+"</h3><h4>"+data[i]["enrollDate"]+"</h4><p><p><span style='font-weight:bold'>직무직업</span> : "+data[i]["workType"]+"</p><p><span style='font-weight:bold'>면접 당시 경력</span> : "+data[i]["career"]+"</p><p><span style='font-weight:bold'>평가</span> : "+data[i]["evaluation"]+"</p><p><span style='font-weight:bold'>난이도</span> : "+data[i]["difficulty"]+"</p><p style='margin:0px;display:inline-block; width:177.75px; white-space:nowrap; overflow:hidden;text-overflow:ellipsis;'><span style='font-weight:bold'>면접Tip</span> : "+data[i]["interviewTip"]+"</p></p></div><div style='display:inline-block'><img onerror=\"this.src='${path}/resources/upload/company/basic.png'\" width='220px' height='280px' src='${path}/resources/upload/company/"+data[i]["companyImage"]+"'></div></a>");
						div1.append(div2).append(div3);
						$(".swiper-wrapper").append(div1);
					}
					
					
				}
			});
		}

	</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  