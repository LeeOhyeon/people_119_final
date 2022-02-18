<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/companyHeader.jsp"/>

 <!-- ======= 메인 최상단부분 ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h1 data-aos="fade-up">치타는 지금 웃고있다</h1>
          <h2 data-aos="fade-up" data-aos-delay="400">이제 출발한다<br> 경주장의 치타가...<br> 다른 경주견들은 직감적으로 긴장하기 시작했다... </h2>
          <div data-aos="fade-up" data-aos-delay="800">
            <a href="#about" class="btn-get-started scrollto">인재채용 시작하기</a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="fade-left" data-aos-delay="200">
          <img src="${path }/resources/assets/img/cheetahSmile.jpg" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- 메인 최상단부분 -->

  <main id="main">

        <!-- ======= 기능 버튼 section ======= -->
        <section id="features" class="features">
        <div class="container">

          <div class="section-title" data-aos="fade-up">
            <h2>기능</h2>
            <p>회사에 필요한 다양한 기능을 사용해 보세요</p>
          </div>

          <div class="row" data-aos="fade-up" data-aos-delay="300">
            <div class="col-lg-3 col-md-4">
              <div class="icon-box">
                <i class="ri-store-line" style="color: #ffbb2c;"></i>
                <h3><a href="${path }/offer/enrollOffer.do">공고 올리기</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
              <div class="icon-box">
                <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
                <h3><a href="#">우리 회사 공고 확인하기</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
              <div class="icon-box">
                <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                <h3><a href="#">지원자 확인하기</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4 mt-lg-0">
              <div class="icon-box">
                <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                <h3><a href="#">인재 찾기</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-database-2-line" style="color: #47aeff;"></i>
                <h3><a href="#">면접 제의하기</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                <h3><a href="">Eiusmod Tempor</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-file-list-3-line" style="color: #11dbcf;"></i>
                <h3><a href="">Midela Teren</a></h3>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 mt-4">
              <div class="icon-box">
                <i class="ri-price-tag-2-line" style="color: #4233ff;"></i>
                <h3><a href="${path }/company/companyMypage.do">MyPage</a></h3>
              </div>
            </div>
          </div>

        </div>
      </section>
      <!-- End 기능버튼 section -->



    <!-- ======= 공고 현황 Section ======= -->
    <section id="counts" class="counts">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>우리회사 공고 현황</h2>
        </div>

        <div class="row">
          <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-xl-start" data-aos="fade-right" data-aos-delay="150">
            <img src="https://cdn.icon-icons.com/icons2/1727/PNG/512/3986718-building-company-skyscraper-skyscraper-icon_112969.png" alt="" class="img-fluid" style="width: 300px; height: 300px;">
          </div>

          <div class="col-xl-7 d-flex align-items-stretch pt-4 pt-xl-0" data-aos="fade-left" data-aos-delay="300">
            <div class="content d-flex flex-column justify-content-center">
              <div class="row">
                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-emoji-smile"></i>
                    <span data-purecounter-start="0" data-purecounter-end="65" data-purecounter-duration="1" class="purecounter"></span>
                    <p><strong>우리 회사에 지원한 치타의 수</strong></p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-journal-richtext"></i>
                    <span data-purecounter-start="0" data-purecounter-end="85" data-purecounter-duration="1" class="purecounter"></span>
                    <p><strong>우리 회사가 올린 공고의 수</strong></p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-clock"></i>
                    <span data-purecounter-start="0" data-purecounter-end="18" data-purecounter-duration="1" class="purecounter"></span>
                    <p><strong>우리 회사 공고를 본 치타의 수</strong></p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-award"></i>
                    <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="1" class="purecounter"></span>
                    <p><strong>우리 회사에 취업이 성공한 치타의 수</strong></p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>
      </div>
    </section><!-- End 공고현황 Section -->


    <!-- ===== 인재찾기 3트 ===== -->
    <section>

      <div class="section-title" data-aos="fade-up">
        <h2>인재 찾기</h2>
        <p>우리 회사에 꼭 맞는 인재를 찾아보세요</p>
      </div>

        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">

          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: black;"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: black;"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3" style="background-color: black;"></button>
          </div>

          <div class="carousel-inner">
            <div class="carousel-item active">
              <div style="background-color: rgb(231, 224, 224); display: flex; text-align: center; width: 80%; margin: 0 auto;"><!-- 1페이지 전체 틀 -->
                <div style="margin: 0 auto;"><!-- 첫번째 사람 -->
                  <div class="cheetah-img" style="text-align: center;">
                    <img src="https://w.namu.la/s/5704ee582976bcceb821acfd8d564bf22056deea7f31678da326372054c6cc1477cc29c1c1cfd80b400c1c665d5a657fc045ec195bdcd2e31a0cd52e06278f2bccf9e688d9e70f53d674f7e2ea293559" style="width: 250px; height: 400px;">
                  </div>
                  <div class="cheetah-info" style="background-color: whitesmoke; margin-bottom: 20%;">
                    <p>(이름 : )탄지로</p>
                    <p>(이력서 제목 : )내가 바로 주인공</p>
                    <p>(보유 기술스택 : )히노카미 카구라</p>
                    <p><a href=""> → 자세히 보러가기</a></p>
                  </div>
                </div><!-- End 첫번째 사람 -->
                <div style="margin: 0 auto;"><!-- 두번째 사람 -->
                  <div class="cheetah-img">
                    <img src="https://ww.namu.la/s/3dec51661405a1b93c9a15bd1c441a47facefe6005170c7da72675f4fbe5c4e68d2e50c5fe1c6e8d90965eb289df1e3a42170d1103645410e2bd3b50f9052511f1193e7232a86c2054d9cb56697e1d8c" style="width: 250px; height: 400px;">
                  </div>
                  <div class="cheetah-info">
                    <p>(이름 : )젠이츠</p>
                    <p>(이력서 제목 : )벽력일섬</p>
                    <p>(보유 기술스택 : )벽력일섬</p>
                    <p><a href=""> → 자세히 보러가기</a></p>
                  </div>
                </div> <!-- End 두번째 사람 -->
                <div style="margin: 0 auto;"><!-- 세번째 사람 -->
                  <div class="cheetah-img">
                    <img src="https://w.namu.la/s/42b74bc2faa854b5c691875a885c90312ff9fbd7980aa389a2d6fcd7c909b5a91fda4efb8152bc1b4bb608205d822bfd21743d8c552fc69534a391afbf1d3867f55a0c3622ac54a5b684eb93a7ec8abc1b87fc83a54c60fbe71214083d94c5da" style="width: 250px; height: 400px;">
                  </div>
                  <div class="cheetah-info">
                    <p>(이름 : )렌고쿠</p>
                    <p>(이력서 제목 : )오니가 되어라</p>
                    <p>(보유 기술스택 : )불의 호흡</p>
                    <p><a href=""> → 자세히 보러가기</a></p>
                  </div>
                </div> <!-- End 세번째 사람 -->
                <div style="margin: 0 auto;"><!-- 네번째 사람 -->
                  <div class="cheetah-img">
                    <img src="https://ww.namu.la/s/2f3991ddf7f7ea28a738d738ac438a7e5d9545dafc189667990a5acaf95e6fa7480e6b48dd2298badf8e6cf69eec8e0400b439501009aa9d881cb8a84571c7fd6179748829b11f97480a7f410e2350c0" style="width: 250px; height: 400px;">
                  </div>
                  <div class="cheetah-info">
                    <p>(이름 : )네즈코</p>
                    <p>(이력서 제목 : )ㅋㅋㅋ</p>
                    <p>(보유 기술스택 : )혈귀술</p>
                    <p><a href=""> → 자세히 보러가기</a></p>
                  </div>
                </div> <!-- End 네번째 사람 -->

              </div><!-- End 1페이지 전체 틀 -->
            </div>
            <div class="carousel-item">
              <img src="" class="d-block w-100" alt="2페" style="width: 25%; height: 100px;">
            </div>
            <div class="carousel-item">
              <img src="" class="d-block w-100" alt="3페" style="width: 25%; height: 100px;">
            </div>
          </div>
        </div>

    </section><!-- End 인재찾기 3트-->
    
   </main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>