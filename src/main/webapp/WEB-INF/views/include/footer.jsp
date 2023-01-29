<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ======= Footer ======= -->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-md-6 footer-contact">
					<h3>Tomland</h3>
					<p>
						경기도 고양시 덕양구 화정동<br> 옥빛마을 14단지<br> <strong>Phone:</strong>
						+82 10 8242 8141<br> <strong>Email:</strong>
						zhsks880@naver.com<br>
					</p>
				</div>

				<div class="col-lg-3 col-md-6 footer-links">
					<h4>Service Links</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/board/boardList' />">자유게시판</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/sns/snsBoard' />">이미지게시판</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/util/gonggong' />">따릉이</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/gamja/gamjaList' />">감자마켓</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-6 footer-links">
					<h4>Useful Links</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="https://www.naver.com/">Naver</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="https://www.google.com/">Google</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="https://blog.naver.com/zhsks880">네이버블로그</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-6 footer-links">
					<h4>Our Social Networks</h4>
					<p>트위터, 인스타, 페이스북</p>
					<div class="social-links mt-3">
						<a href="https://twitter.com/" class="twitter"><i class="bx bxl-twitter"></i></a>
						<a href="https://www.facebook.com/" class="facebook"><i class="bx bxl-facebook"></i></a>
						<a href="https://www.instagram.com/" class="instagram"><i class="bx bxl-instagram"></i></a>
<!--  						<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a> -->
						<a href="https://www.linkedin.com/" class="linkedin"><i class="bx bxl-linkedin"></i></a>
					</div>
				</div>

			</div>
		</div>
	</div>
</footer>
<!-- End Footer -->

<a href="#"
	class="back-to-top d-flex align-items-center justify-content-center"><i
	class="bi bi-arrow-up-short"></i></a>


  
<script>
  $(function () {
    // # 로그인 버튼 활성화
    $('#myLogin').click(function (e) {
      $('#log-in').modal('show');
      $('#log-in').appendTo('body');
    })

    $('#modalClose').click(function () {
      $('#log-in').modal('hide');
    }) //end myLogin

  }) // end jQuery
</script>
<!-- footer 여기까지 가져가기 -->