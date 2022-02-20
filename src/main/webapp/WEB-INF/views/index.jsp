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
            <a href="" class="btn-get-started scrollto">달리기 시작하기</a>
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
          <h2>마감임박 공고</h2>
          <p>지원 마감이 얼마 남지 않았습니다. 늦기 전에 꼭 지원하세요!</p>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
               <!-- DB에서 가져오게 -->
              <!-- <div class="icon"><i class="bx bxl-dribbble"></i></div> -->
              <div class="" style="width: 250px; height: 150px"><img src="${path}/resources/assets/img/275.jpg" style="width: 250px; height: 150px"></div>
              <h4 class="title"><a href="">275 Company</a></h4>
              <p class="description">노력하는 천재 채용중</p>
              <p class="description">JAVA, JavaScript, Spring Framework</p>
              <p class="description">마감일 : 2022. 00. 00</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
               <!-- DB에서 가져오게 -->
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4 class="title"><a href="">회사이름</a></h4>
              <p class="description">뽑는 내용</p>
              <p class="description">기술스택</p>
              <p class="description">마감일 : 2022. 00. 00</p> <!-- D-00 으로 표시하는게 더 좋을까? -->
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
               <!-- DB에서 가져오게 -->
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4 class="title"><a href="">회사이름</a></h4>
              <p class="description">뽑는 내용</p>
              <p class="description">기술스택</p>
              <p class="description">마감일 : 2022. 00. 00</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
              <!-- DB에서 가져오게 -->
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4 class="title"><a href="">회사이름</a></h4>
              <p class="description">뽑는 내용</p>
              <p class="description">기술스택</p>
              <p class="description">마감일 : 2022. 00. 00</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End 마감임박 공고 -->

    <!-- ======= 새로 올라온 공고 ======= -->
    <section id="more-services" class="more-services">
      <div class="container">
      
	    <div class="section-title" data-aos="fade-up">
          <h2>새로 올라온 공고</h2>
          <p>새로 올라온 공고를 확인하고, 나에게 맞는 포지션에 지원하세요!</p>
        </div>

        <div class="row">
          <div class="col-md-6 d-flex align-items-stretch">
            <div class="card" style='background-image: url("${path}/resources/assets/img/more-services-1.jpg");' data-aos="fade-up" data-aos-delay="100">
              <div class="card-body">
                <h5 class="card-title"><a href="">시프 Company</a></h5>
                <p class="card-text">월급루팡 채용중</p>
                <p class="card-text">JAVA, JavaScript, Spring Framework</p>
                <div class="read-more"><a href="#"><i class="bi bi-arrow-right"></i> 지원하기</a></div>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="card" style='background-image: url("${path}/resources/assets/img/more-services-2.jpg");' data-aos="fade-up" data-aos-delay="200">
              <div class="card-body">
                <h5 class="card-title"><a href="">회사이름</a></h5>
                <p class="card-text">채용내용</p>
                <p class="card-text">요구 기술스택</p>
                <div class="read-more"><a href="#"><i class="bi bi-arrow-right"></i> 지원하기</a></div>
              </div>
            </div>

          </div>
          <div class="col-md-6 d-flex align-items-stretch mt-4">
            <div class="card" style='background-image: url("${path}/resources/assets/img/more-services-3.jpg");' data-aos="fade-up" data-aos-delay="100">
              <div class="card-body">
                <h5 class="card-title"><a href="">회사이름</a></h5>
                <p class="card-text">채용내용</p>
                <p class="card-text">요구 기술스택</p>
                <div class="read-more"><a href="#"><i class="bi bi-arrow-right"></i> 지원하기</a></div>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch mt-4">
            <div class="card" style='background-image: url("${path}/resources/assets/img/more-services-4.jpg");' data-aos="fade-up" data-aos-delay="200">
              <div class="card-body">
                <h5 class="card-title"><a href="">회사이름</a></h5>
                <p class="card-text">채용내용</p>
                <p class="card-text">요구 기술스택</p>
                <div class="read-more"><a href="#"><i class="bi bi-arrow-right"></i> 지원하기</a></div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End 새로 올라온 공고 -->


    <!-- ======= 합격 후기 ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>면접 후기</h2>
          <p>면접을 보고온 치타의 생생한 후기를 확인해보세요</p>
        </div>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="${path}/resources/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                  <h3>Saul Goodman</h3>
                  <h4>Ceo &amp; Founder</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="${path}/resources/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                  <h3>Sara Wilsson</h3>
                  <h4>Designer</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="${path}/resources/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                  <h3>Jena Karlis</h3>
                  <h4>Store Owner</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="${path}/resources/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                  <h3>Matt Brandon</h3>
                  <h4>Freelancer</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-wrap">
                <div class="testimonial-item">
                  <img src="${path}/resources/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                  <h3>John Larson</h3>
                  <h4>Entrepreneur</h4>
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                </div>
              </div>
            </div><!-- End testimonial item -->

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
		
	
	
	</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  