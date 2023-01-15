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
					<h1>Welcome to Tom land page</h1>
					<h2>여기에 나의 프로젝트들을 모아놓아보자</h2>
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
				<p>안녕안녕 소개소개 하는 곳이야</p>
			</div>

			<div class="row no-gutters">
				<div class="col-xl-7 d-flex align-items-stretch order-2 order-lg-1">
					<div class="content d-flex flex-column justify-content-center">
						<div class="row">
							<div class="col-md-6 icon-box" data-aos="fade-up">
								<i class="bx bx-receipt"></i>
								<h4>Corporis voluptates sit</h4>
								<p>Consequuntur sunt aut quasi enim aliquam quae harum
									pariatur laboris nisi ut aliquip</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="100">
								<i class="bx bx-cube-alt"></i>
								<h4>Ullamco laboris nisi</h4>
								<p>Excepteur sint occaecat cupidatat non proident, sunt in
									culpa qui officia deserunt</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="200">
								<i class="bx bx-images"></i>
								<h4>Labore consequatur</h4>
								<p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus
									ut maiores omnis facere</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="300">
								<i class="bx bx-shield"></i>
								<h4>Beatae veritatis</h4>
								<p>Expedita veritatis consequuntur nihil tempore laudantium
									vitae denat pacta</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="400">
								<i class="bx bx-atom"></i>
								<h4>Molestiae dolor</h4>
								<p>Et fuga et deserunt et enim. Dolorem architecto ratione
									tensa raptor marte</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="500">
								<i class="bx bx-id-card"></i>
								<h4>Explicabo consectetur</h4>
								<p>Est autem dicta beatae suscipit. Sint veritatis et sit
									quasi ab aut inventore</p>
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
					<h3>어떤게 있을까?</h3>
					<p class="fst-italic">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit, sed do eiusmod tempor incididunt ut labore et
						dolore magna aliqua.</p>
					<ul>
						<li><i class="bi bi-check"></i> Ullamco laboris nisi ut
							aliquip ex ea commodo consequat.</li>
						<li><i class="bi bi-check"></i> Duis aute irure dolor in
							reprehenderit in voluptate velit.</li>
						<li><i class="bi bi-check"></i> Iure at voluptas aspernatur
							dignissimos doloribus repudiandae.</li>
						<li><i class="bi bi-check"></i> Est ipsa assumenda id facilis
							nesciunt placeat sed doloribus praesentium.</li>
					</ul>
					<p>Voluptas nisi in quia excepturi nihil voluptas nam et ut.
						Expedita omnis eum consequatur non. Sed in asperiores aut
						repellendus. Error quisquam ab maiores. Quibusdam sit in officia</p>
				</div>
			</div>

			<div class="row content">
				<div class="col-md-4 order-1 order-md-2" data-aos="fade-left">
					<img src="resources/img/details-2.png" class="img-fluid" alt="">
				</div>
				<div class="col-md-8 pt-5 order-2 order-md-1" data-aos="fade-up">
					<h3>두번째 소개란</h3>
					<p class="fst-italic">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit, sed do eiusmod tempor incididunt ut labore et
						dolore magna aliqua.</p>
					<p>Ullamco laboris nisi ut aliquip ex ea commodo consequat.
						Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
						cupidatat non proident, sunt in culpa qui officia deserunt mollit
						anim id est laborum</p>
					<p>Inventore id enim dolor dicta qui et magni molestiae.
						Mollitia optio officia illum ut cupiditate eos autem. Soluta
						dolorum repellendus repellat amet autem rerum illum in. Quibusdam
						occaecati est nisi esse. Saepe aut dignissimos distinctio id enim.
					</p>
				</div>
			</div>

			<div class="row content">
				<div class="col-md-4" data-aos="fade-right">
					<img src="resources/img/details-3.png" class="img-fluid" alt="">
				</div>
				<div class="col-md-8 pt-5" data-aos="fade-up">
					<h3>세번째 소개란</h3>
					<p>Cupiditate placeat cupiditate placeat est ipsam culpa.
						Delectus quia minima quod. Sunt saepe odit aut quia voluptatem hic
						voluptas dolor doloremque.</p>
					<ul>
						<li><i class="bi bi-check"></i> Ullamco laboris nisi ut
							aliquip ex ea commodo consequat.</li>
						<li><i class="bi bi-check"></i> Duis aute irure dolor in
							reprehenderit in voluptate velit.</li>
						<li><i class="bi bi-check"></i> Facilis ut et voluptatem
							aperiam. Autem soluta ad fugiat.</li>
					</ul>
					<p>Qui consequatur temporibus. Enim et corporis sit sunt harum
						praesentium suscipit ut voluptatem. Et nihil magni debitis
						consequatur est.</p>
					<p>Suscipit enim et. Ut optio esse quidem quam reiciendis esse
						odit excepturi. Vel dolores rerum soluta explicabo vel fugiat eum
						non.</p>
				</div>
			</div>

			<div class="row content">
				<div class="col-md-4 order-1 order-md-2" data-aos="fade-left">
					<img src="resources/img/details-4.png" class="img-fluid" alt="">
				</div>
				<div class="col-md-8 pt-5 order-2 order-md-1" data-aos="fade-up">
					<h3>네번째 소개란</h3>
					<p class="fst-italic">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit, sed do eiusmod tempor incididunt ut labore et
						dolore magna aliqua.</p>
					<p>Ullamco laboris nisi ut aliquip ex ea commodo consequat.
						Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
						cupidatat non proident, sunt in culpa qui officia deserunt mollit
						anim id est laborum</p>
					<ul>
						<li><i class="bi bi-check"></i> Et praesentium laboriosam
							architecto nam .</li>
						<li><i class="bi bi-check"></i> Eius et voluptate. Enim earum
							tempore aliquid. Nobis et sunt consequatur. Aut repellat in
							numquam velit quo dignissimos et.</li>
						<li><i class="bi bi-check"></i> Facilis ut et voluptatem
							aperiam. Autem soluta ad fugiat.</li>
					</ul>
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
	<section id="testimonials" class="testimonials section-bg">
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
	</section>
	<!-- NameCard Section -->

	<!-- ======= Pricing Section ======= -->
	<section id="pricing" class="pricing">
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
	</section>
	<!-- End Pricing Section -->

	<!-- ======= FAQ Section ======= -->
	<section id="faq" class="faq section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-title">

				<h2>Frequently Asked Questions</h2>
				<p>여기는 F.A.Q 야...궁금궁금</p>
			</div>

			<div class="accordion-list">
				<ul>
					<li data-aos="fade-up"><i class="bx bx-help-circle icon-help"></i>
						<a data-bs-toggle="collapse" class="collapse"
						data-bs-target="#accordion-list-1">1번째 궁금함 <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-1" class="collapse show"
							data-bs-parent=".accordion-list">
							<p>1번째 궁금함의 답</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="100"><i
						class="bx bx-help-circle icon-help"></i> <a
						data-bs-toggle="collapse" data-bs-target="#accordion-list-2"
						class="collapsed">2번째 궁금함 <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-2" class="collapse"
							data-bs-parent=".accordion-list">
							<p>2번째 궁금함의 답</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="200"><i
						class="bx bx-help-circle icon-help"></i> <a
						data-bs-toggle="collapse" data-bs-target="#accordion-list-3"
						class="collapsed">3번째 궁금함 <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-3" class="collapse"
							data-bs-parent=".accordion-list">
							<p>3번째 궁금함의 답</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="300"><i
						class="bx bx-help-circle icon-help"></i> <a
						data-bs-toggle="collapse" data-bs-target="#accordion-list-4"
						class="collapsed">4번째 궁금함 <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-4" class="collapse"
							data-bs-parent=".accordion-list">
							<p>4번째 궁금함의 답.</p>
						</div></li>

					<li data-aos="fade-up" data-aos-delay="400"><i
						class="bx bx-help-circle icon-help"></i> <a
						data-bs-toggle="collapse" data-bs-target="#accordion-list-5"
						class="collapsed">5번째 궁금함 <i
							class="bx bx-chevron-down icon-show"></i><i
							class="bx bx-chevron-up icon-close"></i></a>
						<div id="accordion-list-5" class="collapse"
							data-bs-parent=".accordion-list">
							<p>5번째 궁금함의 답</p>
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
								+82 10 8243 8141<br>+82 10 8243 8141
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
 </script>