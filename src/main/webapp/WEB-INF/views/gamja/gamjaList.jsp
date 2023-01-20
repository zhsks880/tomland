<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<section id="hero" class="d-flex align-items-center freeTable">

	<div class="container">
		<div class="row">
			<div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">

				<!-- 상단 부분 -->
				<form action="<c:url value='/gamja/gamjaList' />" id="searchFormObj" style="margin-bottom: 30px;">
					<div class="user2">
						<a href="<c:url value="/gamja/gamjaList" />">
						<img src="../resources/img/potato.png"
							style="width: 180px; height: 50px;"></a> 
							<input type="text" class="form-control search" name="keyword" id="keywordInput" placeholder="상품명, 브랜드, 판매자 검색 후 엔터" style="width: 50%;">
						<button type="button" class="btn btn-primary search-btn"
							style="background-color: #edad53; border: 0px;"  id="gamjaRegistBtn">내물건등록</button>
					</div>
				</form>

				<!-- 상단 캐러셀 -->
				<div id="carouselControls" class="carousel slide"
					data-bs-ride="carousel" style="margin-bottom: 50px;">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="../resources/img/f11.png" class="d-block w-100"
								alt="1fuck">
						</div>
						<div class="carousel-item">
							<img src="../resources/img/f22.png" class="d-block w-100"
								alt="2fuck">
						</div>
						<div class="carousel-item">
							<img src="../resources/img/f33.png" class="d-block w-100"
								alt="3fuck">
						</div>
						<div class="carousel-item">
							<img src="../resources/img/gucci.png" class="d-block w-100"
								alt="4fuck">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

				<!-- 상품 5개 씩 : 1번줄 -->
	 			<div class="user2 gamjaAll">
					<!-- 게시글 반복문 테스트 gamjaList 배열로 들어옴 -->
					<c:forEach items="${gamjaList}" var="vo">
					
						<div class="gamjaList" style="background: #5777ba; width: 100%;">
							<a href="<c:url value='/gamja/gamjaContent/${vo.gno}${pc.makeURI(pc.paging.pageNum)}' />">
								<input type="hidden" name="gno" value="${vo.gno}">
								
								<p style="margin: 0px; font-weight: bold; font-size: 20px; color: white;">${vo.PName}</p>
								<hr style="margin: 0px; color: white; border: 2px solid;">
								<p style="margin: 0px; color: white;">판매자 : ${vo.userId} 님</p>
								<div class="user2">
									<p style="margin: 0px; color: white;">${vo.PPrice}원</p>
									<p style="margin: 0px; font-size: 12px; color: pink;"><fmt:formatDate value="${vo.regDate}" pattern="MM월dd일" /></p>
								</div></a>
						</div>
		
					</c:forEach>
				</div>
				<br>
			
				<!-- 페이지 네이션 -->
				<form action="#" name="pageForm" class="pageForm">
					<div class="text-center">
						<nav>
							<ul class="pagination bUl" id="pagination">
							
								<c:if test="${pc.prev}">
									<li><a href="#" class="bPagination" data-pagenum="${pc.beginPage-1}">&laquo; 이전</a></li>
								</c:if>
								
								<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
									<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a href="#" class="bPagination" data-pagenum="${num}">${num}</a></li>
								</c:forEach>
								
								<c:if test="${pc.next}">
									<li><a href="#" class="bPagination" data-pagenum="${pc.endPage+1}">다음 &raquo;</a></li>
								</c:if>

							</ul>
						</nav>
					
					 <!-- 페이지 관련버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값 hiddentype 만들어 두기 -->
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="cpp" value="${pc.paging.cpp}">
                    <input type="hidden" name="condition" value="${pc.paging.condition}">
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
					
					</div>
				</form>


			</div>
		</div>
</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>

$(function () {
	//검색 엔터키 입력
	$('#keywordInput').keydown(function(e) {
		if(e.keyCode == 13){
			$('#searchFormObj').submit();
		}
	}); // end 엔터키 입력
	
	//페이지네이션 버튼을 데이터화 시키기
	$('#pagination').on('click', 'a', function(e) {
		e.preventDefault();
		//클릭하는 data-pagenum 값을 변수 저장
		const value = $(this).data('pagenum');
		//클릭 값으로 페이지네이션 폼의 양식을 변경
		document.pageForm.pageNum.value = value;
		document.pageForm.submit();
	}); //end pagination
	
	// # 내물건등록 버튼 클릭
	$('#gamjaRegistBtn').click(function () {
		const userId = '${login.userId}';
		if(userId === ''){
			alert('로그인 해야 이용 가능한 서비스입니다.');
		} else {
			location.href = "<c:url value='/gamja/gamjaRegist' />"
		}
		
	}); // end 내 물건등록버튼
	
});// end jQuery
	


</script>