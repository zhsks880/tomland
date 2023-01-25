<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="include/header.jsp"%>

<!-- ======= Home Section ======= -->
<section id="hero" class="d-flex align-items-center">

	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 d-lg-flex flex-lg-column justify-content-center align-items-stretch pt-5 pt-lg-0 order-2 order-lg-1"
				data-aos="fade-up">
				<div>
					<h1>Welcome to TomLand</h1>
					<h2>안녕하세요. TomLand 에 오신걸 환영합니다. <br>톰랜드는 개인용 포트폴리오 입니다.</h2>
					<a href="https://google.com" class="download-btn"><i
						class="bx bxl-play-store"></i> 구글 가기</a> <a
						href="https://blog.naver.com/zhsks880" class="download-btn"><i
						class="bx bxl-apple"></i> 네이버블로그 가기</a>
					<!-- 구글플레이 박스 & 앱스토어 박스 모음-->
					<!-- <a href="#" class="download-btn"><i class="bx bxl-play-store"></i> Google Play</a>
            <a href="#" class="download-btn"><i class="bx bxl-apple"></i> App Store</a> -->
				</div>
			</div>
			<div
				class="col-lg-6 d-lg-flex flex-lg-column align-items-stretch order-1 order-lg-2 hero-img"
				data-aos="fade-up">
				<img src="resources/img/hero-img.png" class="img-fluid" alt="">
			</div>
		</div>
	</div>

</section>
<!-- End Hero -->

<main id="main">

	<!-- ======= Intro Section ======= -->
	<section id="features" class="features">
		<div class="container">

			<div class="section-title">
				<h2>Introduce</h2>
				<p>현재까지 구현된 포트폴리오의 서비스 입니다</p>
			</div>

			<div class="row no-gutters">
				<div class="col-xl-7 d-flex align-items-stretch order-2 order-lg-1">
					<div class="content d-flex flex-column justify-content-center">
						<div class="row">
							<div class="col-md-6 icon-box" data-aos="fade-up">
								<i class="bx bx-receipt"></i>
								<h4>회원가입 서비스</h4>
								<p>우측상단 Login 버튼 클릭 시 회원 가입이 가능합니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="100">
								<i class="bx bx-cube-alt"></i>
								<h4>Mypage 서비스</h4>
								<p>Mypage 에서는 여러가지 들을 확인할 수 있습니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="200">
								<i class="bx bx-images"></i>
								<h4>자유게시판</h4>
								<p>일반적인 텍스트만 작성하는 자유게시판이 있습니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="300">
								<i class="bx bx-shield"></i>
								<h4>이미지게시판</h4>
								<p>FaceBook과 유사한 이미지와 오늘의 생각을 등록하는 이미지게시판이 있습니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="400">
								<i class="bx bx-atom"></i>
								<h4>따릉이찾기</h4>
								<p>서울시내에 있는 따릉이(자전거대여) 의 잔여대수가 확인이 가능합니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="500">
								<i class="bx bx-id-card"></i>
								<h4>감자마켓</h4>
								<p>회원끼리 물건을 사고 팔 수 있는 감자마켓이 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
				<div
					class="image col-xl-5 d-flex align-items-stretch justify-content-center order-1 order-lg-2"
					data-aos="fade-left" data-aos-delay="100">
					<img src="resources/img/features.svg" class="img-fluid" alt="">
				</div>
			</div>

		</div>
	</section>
	<!-- End Intro Section -->

	<!-- =======  Intro Details Section ======= -->
	<section id="details" class="details">
		<div class="container">

			<div class="row content">
				<div class="col-md-4" data-aos="fade-right">
					<img src="resources/img/details-1.png" class="img-fluid" alt="">
				</div>
				<div class="col-md-8 pt-4" data-aos="fade-up">
					<h3>회원가입 기능</h3>
					<p class="fst-italic">우측상단에 있는 Login 버튼을 클릭하면 회원 가입, 로그인, 아이디찾기, 비밀번호 찾기 등의 기능이 구현되어 있습니다.</p>
					<ul>
						<li><i class="bi bi-check"></i> 회원가입시에는 E-mail 인증 체크로 진행이 이루어 집니다.</li>
						<li><i class="bi bi-check"></i> 회원가입시 등록하는 E-mail은 실제 본인의 E-mail을 사용해야 추후에 아이디 찾기 및 비밀번호 찾기 서비스가 이용이 가능합니다.</li>
						<li><i class="bi bi-check"></i> 로그인 한 회원은 Mypage 내에서 내정보수정, 내게시물확인, 장바구니 기능이 가능합니다.</li>
						<li><i class="bi bi-check"></i> 회원정보 수정 시 회원의 E-mail 인증을 거쳐야 하며, 본인의 프로필 사진 또한 첨부를 해야 합니다.</li>
					</ul>
					<p>TomaLand의 대부분의 서비스는 로그인 한 사용자에게 제공이 되고 있으므로 회원가입을 꼭 진행 후 서비스를 이용해 주시기 바랍니다.</p>
				</div>
			</div>

			<div class="row content">
				<div class="col-md-4 order-1 order-md-2" data-aos="fade-left">
					<img src="resources/img/details-2.png" class="img-fluid" alt="">
				</div>
				<div class="col-md-8 pt-5 order-2 order-md-1" data-aos="fade-up">
					<h3>자유게시판</h3>
					<p class="fst-italic">자유게시판은 상단메뉴의 Tom`s Service 를 통해 접속이 가능합니다.</p>
					<ul>
						<li><i class="bi bi-check"></i> 일반적인 텍스트 형식을 지원하는 자유게시판입니다.</li>
						<li><i class="bi bi-check"></i> 글등록, 글수정, 글삭제 가 가능합니다.</li>
						<li><i class="bi bi-check"></i> 자유게시판 글들은 댓글 기능도 지원을 하고 있습니다. 댓글 또한 회원에 한해서 등록 및 삭제가 가능합니다.</li>
						<li><i class="bi bi-check"></i> 자유게시판의 페이징 처리는 1페이지당 5개의 글만 보여지게 되어있으며, 페이징 처리는 페이지 버튼으로 되어 있습니다.</li>
						<li><i class="bi bi-check"></i> 자유게시판의 댓글은 페이징 처리는 1페이지당 2개의 댓글만 보여지게 되어있으며, 페이징 처리는 더보기 버튼으로 되어 있습니다.</li>
					</ul>
					<p>내 글을 수정하게 되었다면, 내글을 클릭 시에 작성일->수정일로 변경되어 보여지게 됩니다.</p>
				</div>
			</div>

			<div class="row content">
				<div class="col-md-4" data-aos="fade-right">
					<img src="resources/img/details-3.png" class="img-fluid" alt="">
				</div>
				<div class="col-md-8 pt-5" data-aos="fade-up">
					<h3>이미지게시판</h3>
					<p class="fst-italic">이미지게시판은 상단메뉴의 Tom`s Service 를 통해 접속이 가능합니다.</p>
					<ul>
						<li><i class="bi bi-check"></i> SNS를 모티브로 한 이미지게시판 입니다.</li>
						<li><i class="bi bi-check"></i> 사진한장과 오늘의 생각 등 짧은 주제거리를 등록이 가능한 곳 입니다.</li>
						<li><i class="bi bi-check"></i> 이미지게시판에도 간단한 댓글이 가능하도록 구현되어 있습니다.</li>
						<li><i class="bi bi-check"></i> 이미지게시판의 페이징 처리는 1페이지당 3개의 글만 보여지게 되어있으며, 페이징 처리는 스크롤을 내리면 계속 보는 형식으로 되어 있습니다.</li>
						<li><i class="bi bi-check"></i> 회원들간 이미지게시물에 대하여 좋아요 기능이 가능하며, 좋아요 취소도 가능합니다. </li>
					</ul>
					<p>화면왼쪽편은 이미지업로드 버튼 클릭 시 내가 등록 할 이미지를 미리보는 형식으로 되어 있습니다.</p>
				</div>
			</div>

			<div class="row content">
				<div class="col-md-4 order-1 order-md-2" data-aos="fade-left">
					<img src="resources/img/details-4.png" class="img-fluid" alt="">
				</div>
				<div class="col-md-8 pt-5 order-2 order-md-1" data-aos="fade-up">
					<h3>감자마켓</h3>
					<p class="fst-italic">감자마켓은 상단메뉴의 Tom`s Service 를 통해 접속이 가능합니다.</p>
					<ul>
						<li><i class="bi bi-check"></i> 번개장터를 모티브로 한 중고물품 거래 서비스 입니다.</li>
						<li><i class="bi bi-check"></i> 판매하고자하는 물건에 대해 메인이미지, 상세이미지4장으로 물품을 등록하도록 구성되어 있으며, 물품에 대한 정보를 등록할 수 있게 되어 있습니다.</li>
						<li><i class="bi bi-check"></i> 등록되어 있는 물건들은 장바구니로 이동 후 구매가 가능하며, 장바구니는 Mypage 내의 탭에서 확인이 가능합니다.</li>
						<li><i class="bi bi-check"></i> 감자마켓의 페이징 처리는 1페이지당 4개의 글만 보여지게 되어있으며, 페이징 처리는 페이지 버튼으로 되어 있습니다.</li>
						<li><i class="bi bi-check"></i> 회원들간 서로 물건을 올리고 서로 구매 및 판매 기능을 구현하고자 만든 서비스 입니다.</li>
					</ul>
					<p>따릉이 찾기는 공공데이터포털 사이트에 있는 따릉이(자전거대여) 서비스 내에 현재 대여가 가능한 자전거 대수를 맵에서 확인이 가능하게 구현하였습니다.</p>
				</div>
			</div>

		</div>
	</section>
	<!-- End Intro Details Section -->

	<!-- ======= Gallery Section ======= -->
	<section id="gallery" class="gallery">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>Gallery</h2>
				<p>TomLand 프로젝트를 구성한 Programming Language</p>
			</div>

		</div>

		<div class="container" data-aos="fade-up">
			<div class="gallery-slider swiper">
				<div class="swiper-wrapper">

					<div class="swiper-slide" style="margin: 0,auto;">
						<img src="./resources/img/gallery/m_bootstrap.png"
							class="img-fluid" alt=""> 
							<img src="./resources/img/gallery/m_css3.png" class="img-fluid"
							alt=""> <img src="./resources/img/gallery/m_git.png" class="img-fluid"
							alt=""> <img src="./resources/img/gallery/m_github.png"
							class="img-fluid" alt=""> <img
							src="./resources/img/gallery/m_html5.png" class="img-fluid"
							alt=""> <img src="./resources/img/gallery/m_java.png"
							class="img-fluid" alt=""> <img
							src="./resources/img/gallery/m_javascript.png" class="img-fluid"
							alt=""> <img src="./resources/img/gallery/m_jquery.png"
							class="img-fluid" alt=""> <img
							src="./resources/img/gallery/m_oracle.png" class="img-fluid"
							alt=""> <img src="./resources/img/gallery/m_spring.png"
							class="img-fluid" alt=""> <img
							src="./resources/img/gallery/m_tomcat.png" class="img-fluid"
							alt=""> <img
							src="./resources/img/gallery/m_visualstudio.png"
							class="img-fluid" alt=""> <img
							src="./resources/img/gallery/m_jsp.png" class="img-fluid" alt="">
					</div>


				</div>

				<div class="swiper-pagination"></div>
			</div>

		</div>
	</section>
	<!-- End Gallery Section -->

	<!-- ======= NameCard Section ======= -->
	<!-- <section id="testimonials" class="testimonials section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>NameCard</h2>
				<p>NameCard 에 대한 설명이야</p>
			</div>

			<div class="testimonials-slider swiper" data-aos="fade-up"
				data-aos-delay="100">
				<div class="swiper-wrapper">

					<div class="swiper-slide">
						<div class="testimonial-item">
							<img src="resources/img/testimonials/testimonials-1.jpg"
								class="testimonial-img" alt="">
							<h3>Saul Goodman</h3>
							<h4>Ceo &amp; Founder</h4>
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Proin
								iaculis purus consequat sem cure digni ssim donec porttitora
								entum suscipit rhoncus. Accusantium quam, ultricies eget id,
								aliquam eget nibh et. Maecen aliquam, risus at semper. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="testimonial-item">
							<img src="resources/img/testimonials/testimonials-2.jpg"
								class="testimonial-img" alt="">
							<h3>Sara Wilsson</h3>
							<h4>Designer</h4>
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export
								tempor illum tamen malis malis eram quae irure esse labore quem
								cillum quid cillum eram malis quorum velit fore eram velit sunt
								aliqua noster fugiat irure amet legam anim culpa. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="testimonial-item">
							<img src="resources/img/testimonials/testimonials-3.jpg"
								class="testimonial-img" alt="">
							<h3>Jena Karlis</h3>
							<h4>Store Owner</h4>
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Enim nisi
								quem export duis labore cillum quae magna enim sint quorum nulla
								quem veniam duis minim tempor labore quem eram duis noster aute
								amet eram fore quis sint minim. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
						</div>
					</div>

				</div>
				<div class="swiper-pagination"></div>

			</div>

		</div>
	</section> -->
	<!-- NameCard Section -->

	<!-- ======= Pricing Section ======= -->
	<!-- <section id="pricing" class="pricing">
		<div class="container">

			<div class="section-title">
				<h2>Pricing</h2>
				<p>Magnam dolores commodi suscipit. Necessitatibus eius
					consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit.
					Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit
					alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
			</div>

			<div class="row no-gutters">

				<div class="col-lg-4 box" data-aos="fade-right">
					<h3>Free</h3>
					<h4>
						$0<span>per month</span>
					</h4>
					<ul>
						<li><i class="bx bx-check"></i> Quam adipiscing vitae proin</li>
						<li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
						<li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
						<li class="na"><i class="bx bx-x"></i> <span>Pharetra
								massa massa ultricies</span></li>
						<li class="na"><i class="bx bx-x"></i> <span>Massa
								ultricies mi quis hendrerit</span></li>
					</ul>
					<a href="#" class="get-started-btn">Get Started</a>
				</div>

				<div class="col-lg-4 box featured" data-aos="fade-up">
					<h3>Business</h3>
					<h4>
						$29<span>per month</span>
					</h4>
					<ul>
						<li><i class="bx bx-check"></i> Quam adipiscing vitae proin</li>
						<li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
						<li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
						<li><i class="bx bx-check"></i> Pharetra massa massa
							ultricies</li>
						<li><i class="bx bx-check"></i> Massa ultricies mi quis
							hendrerit</li>
					</ul>
					<a href="#" class="get-started-btn">Get Started</a>
				</div>

				<div class="col-lg-4 box" data-aos="fade-left">
					<h3>Developer</h3>
					<h4>
						$49<span>per month</span>
					</h4>
					<ul>
						<li><i class="bx bx-check"></i> Quam adipiscing vitae proin</li>
						<li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
						<li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
						<li><i class="bx bx-check"></i> Pharetra massa massa
							ultricies</li>
						<li><i class="bx bx-check"></i> Massa ultricies mi quis
							hendrerit</li>
					</ul>
					<a href="#" class="get-started-btn">Get Started</a>
				</div>

			</div>

		</div>
	</section> -->
	<!-- End Pricing Section -->

	<!-- ======= FAQ Section ======= -->
	<section id="faq" class="faq section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-title">

				<h2>Frequently Asked Questions</h2>
				<p>개발자 전상현에 관한 FaQ</p>
			</div>

			<div class="accordion-list">
				<ul>
					<li data-aos="fade-up"><i class="bx bx-help-circle icon-help"></i>
						<a data-bs-toggle="collapse" class="collapse" data-bs-target="#accordion-list-1">개발자로 전향 
						<i class="bx bx-chevron-down icon-show"></i>
						<i class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-1" class="collapse show" data-bs-parent=".accordion-list">
							<p>늦은나이에 개발자로 전향하였지만 배움에 있어서는 열정이 가득합니다.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="100"><i class="bx bx-help-circle icon-help"></i>
					<a data-bs-toggle="collapse" data-bs-target="#accordion-list-2" class="collapsed">학원수료생 
					<i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-2" class="collapse" data-bs-parent=".accordion-list">
							<p>ict 인재개발원에서 2022년 8월 23일~ 2023년 2월 14일 까지 (스마트웹&콘텐츠 개발)웹기반 스마트 콘텐츠 응용 SW 개발자 양성과정을 수료 하였습니다.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="200"><i class="bx bx-help-circle icon-help"></i>
					<a data-bs-toggle="collapse" data-bs-target="#accordion-list-3" class="collapsed">프로그래밍적으로 가능한 것들
					<i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-3" class="collapse" data-bs-parent=".accordion-list">
							<p>HTML5, CSS, JavaScript, JQuery, Java, JSP, Oracle, Spring, myBatis, ajax, git, gitHub, visualStudio, 등을 다룰 수 있습니다.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="300"><i class="bx bx-help-circle icon-help"></i>
					<a data-bs-toggle="collapse" data-bs-target="#accordion-list-4" class="collapsed">TomLand 제작
					<i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-4" class="collapse" data-bs-parent=".accordion-list">
							<p>현재까지는 TomLand 는 혼자서 모두 기획하고 제작한 포트폴리오 사이트 입니다.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="400"><i class="bx bx-help-circle icon-help"></i>
					<a data-bs-toggle="collapse" data-bs-target="#accordion-list-5" class="collapsed">개발자로 나아갈 방향
					<i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-5" class="collapse" data-bs-parent=".accordion-list">
							<p>끝없는 공부와 연습으로 개발자로 앞으로 나아가고 싶습니다.</p>
						</div></li>
				</ul>
			</div>

		</div>
	</section>
	<!-- End FAQ Section -->

	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>Contact</h2>
				<p>Tom 에게 일거리를 줘</p>
			</div>

			<div class="row">

				<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-6 info">
							<i class="bx bx-map"></i>
							<h4>Address</h4>
							<p>
								경기도 고양시 덕양구 화정동<br>옥빛마을 14단지
							</p>
						</div>
						<div class="col-lg-6 info">
							<i class="bx bx-phone"></i>
							<h4>Call Me</h4>
							<p>
								+82 10 8242 8141<br>+82 10 8242 8141
							</p>
						</div>
						<div class="col-lg-6 info">
							<i class="bx bx-envelope"></i>
							<h4>Email Me</h4>
							<p>zhsks880@naver.com</p>
						</div>
						<div class="col-lg-6 info">
							<i class="bx bx-time-five"></i>
							<h4>Working Hours</h4>
							<p>
								Mon - Fri: 10AM to 5PM<br>Saturday & Sunday: None
							</p>
						</div>
					</div>
				</div>

				<!-- Send E-mail 양식 -->
				<div class="col-lg-6">
					<form action="forms/contact.php" method="post" role="form"
						class="php-email-form" data-aos="fade-up">
						<div class="form-group">
							<input placeholder="Your Name" type="text" name="name"
								class="form-control" id="name" required>
						</div>
						<div class="form-group mt-3">
							<input placeholder="Your Email" type="email" class="form-control"
								name="email" id="email" required>
						</div>
						<div class="form-group mt-3">
							<input placeholder="Subject" type="text" class="form-control"
								name="subject" id="subject" required>
						</div>
						<div class="form-group mt-3">
							<textarea placeholder="Message" class="form-control"
								name="message" rows="5" required></textarea>
						</div>
						<div class="my-3">
							<div class="loading">Loading</div>
							<div class="error-message"></div>
							<div class="sent-message">Your message has been sent. Thank
								you!</div>
						</div>
						<div class="text-center">
							<button type="submit">Send E-mail</button>
						</div>
					</form>
				</div>
				<!-- end Send E-mail 양식 -->

			</div>

		</div>
	</section>
	<!-- End Contact Section -->
</main>

<%@ include file="include/footer.jsp"%>

<script>

AOS.init();

 const msg = '${msg}';
	 if(msg === 'join'){
		 alert('회원가입을 축하드립니다.');
	 }
	 if(msg === 'logout'){
		 alert('로그아웃 되었습니다.');
	 }
	 if(msg === 'userDel'){
		 alert('회원탈퇴 처리 되었습니다.');
	 }
 </script>