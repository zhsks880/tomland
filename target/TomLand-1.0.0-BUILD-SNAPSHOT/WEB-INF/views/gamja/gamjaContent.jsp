<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<section id="hero" class="d-flex align-items-center freeTable">
	<div class="container">
		<div class="row">
			<div
				class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">

				<!-- 상단 검색 창 부분 -->
				<form action="<c:url value='/gamja/gamjaList' />" id="searchFormObj"
					style="margin-bottom: 30px;">
					<div class="user2">
						<a href="<c:url value='/gamja/gamjaList' />"><img
							src="${pageContext.request.contextPath}/resources/img/potato.png"
							style="width: 180px; height: 50px;"></a> <input type="text"
							class="form-control search" name="keyword" id="keywordInput"
							placeholder="상품명, 등록인 검색 후 엔터" style="width: 50%;">
						<button type="button" class="btn btn-primary search-btn"
							style="background-color: #edad53; border: 0px;" id="gamjaRegistBtn">내물건등록</button>
					</div>
				</form>
			</div>

		</div>
		
		<div class="row" style="margin-bottom: 50px;">
			<div class="user2"
				style="border: 1px solid rgb(165, 162, 162); padding: 30px;">
				<!-- 좌측 화면 : 썸네일 형식 -->
				<div
					class="col-lg-5 d-lg-flex flex-lg-column order-1 order-lg-2 regi"
					style="border-right: 1px solid gray;">
					<img
						src="${pageContext.request.contextPath}/gamja/display?fileLoca=${article[0].fileLoca}&fileName=${article[0].fileName}"
						width="90%" height="80%" name="file0">
				</div>

				<!-- 우측 화면 -->
				<div
					class="col-lg-5 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
					<p style="margin-bottom: 20px; font-weight: bold; font-size: 35px;">${article[0].PName}
					</p>
					<div class="user3">
						<p style="font-size: 30px; font-weight: bold;">${article[0].PPrice}원</p>
					</div>
					<div style="text-align: left;">
						<p>무이자할부 | 카드 자세히보기</p>
						<p>이벤트 | 무료배송! 하단 상세페이지 참조</p>
						<p>택배배송 | 2,500원(주문시 결제) 개인택배사 이용</p>
						<p>30,000원 이상 구매 시 무료 / 제주 추가 3,000원, 제주 외 도서지역 추가 5,000원</p>
					</div>
					<hr>

					<!-- # 수량 칸인데 사용할 이유가 없음 
            <div class="user3">
              <p style="line-height: auto; margin: 0px; padding: 6px 12px;">수량: </p>
              <button type="button" class="btn btn-warning">-</button>
              <button type="button" class="btn btn">1</button>
              <button type="button" class="btn btn-warning">+</button>
            </div>
            <hr> -->

					<div class="user2">
						<p>총 상품 금액</p>
						<!-- <p>총 수량 <span style="font-weight: bold;">1</span>개 |  -->
						<span style="font-weight: bold;">${article[0].PPrice}원</span>
					</div>
					<div class="user2">
						<c:choose>
							<c:when test="${login.userId == article[0].userId}">
							<!-- 	<button type="button" class="btn btn-info" id="modBtn" style="color: white;">수정하기</button> -->
								<button type="button" class="btn btn-danger" id="delBtn">삭제하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-danger" id="basketBtn">장바구니</button>
							<!-- 	<button type="button" class="btn btn-warning" id="orderBtn">주문하기</button> -->
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>


		<!-- 상품 상세 설명& 물품QnA & 구매후기 시작 -->
		<div class="row">
			<div
				class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<ul class="nav nav-pills nav-justified" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" data-bs-target="#id1" href="#id1-tab"
						id="id1-tab">상세정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						data-bs-target="#id2" href="#id2-tab" id="id2-tab">리뷰()</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						data-bs-target="#id3" href="#id3-tab" id="id3-tab">Q&A 20</a></li>
				</ul>

				<!-- 탭 안쪽 -->
				<!-- id1 시작 -->
				<div class="tab-content">
					<div class="tab-pane fade show active" id="id1">
						<br>
						<!-- 직거래 유도 주의 -->
						<img
							src="${pageContext.request.contextPath}/resources/img/jik.PNG">
						<!-- 상품상세정보 -->
						<div class="marketProduct" style="margin-top: 15px;">
							<p style="font-weight: bold; font-size: 25px; text-align: left;">상품정보</p>
							<table>
								<tbody>
									<tr>
										<input type="hidden" value="${article[0].userNo}">
										<th>상품번호</th>
										<td name="gno" class="gno">${article[0].gno}</td>
										<th>상품상태</th>
										<td name="pCondition">${article[0].PCondition}</td>
									</tr>
									<tr>
										<th>제조사</th>
										<td name="pFrom">${article[0].PFrom}</td>
										<th>브랜드</th>
										<td name="pBrand">${article[0].PBrand}</td>
									</tr>
									<tr>
										<th>모델명</th>
										<td name="pModel">${article[0].PModel}</td>
										<th>교환여부</th>
										<td name="pReturn">${article[0].PReturn}</td>
									</tr>
									<tr>
										<th>거래방법</th>
										<td name="pTrade">${article[0].PTrade}</td>
										<th>거래지역</th>
										<td name="pRegion">${article[0].PRegion}</td>
									</tr>
								</tbody>
							</table>

							<br>
							<table>
								<tbody>
									<tr>
										<th>상품상세설명</th>
										<td style="border-right: 0px; text-align: left; white-space: pre-line;" name="pDesc">${article[0].PDesc}</td>
									</tr>
								</tbody>
							</table>

						</div>
						<hr>
						<!-- 상품 이미지 -->
						<div class="marketPic">
							<p style="font-weight: bold; font-size: 25px; text-align: left;">상품상세
								이미지</p>
							<hr>
							<img src="${pageContext.request.contextPath}/gamja/display?fileLoca=${article[1].fileLoca}&fileName=${article[1].fileName}"
								width="45%" name="file1"> 
							<img src="${pageContext.request.contextPath}/gamja/display?fileLoca=${article[2].fileLoca}&fileName=${article[2].fileName}"
								width="45%" name="file2"> 
							<img src="${pageContext.request.contextPath}/gamja/display?fileLoca=${article[3].fileLoca}&fileName=${article[3].fileName}"
								width="45%" name="file3"> 
							<img src="${pageContext.request.contextPath}/gamja/display?fileLoca=${article[4].fileLoca}&fileName=${article[4].fileName}"
								width="45%" name="file4">
						</div>

					</div>
					<!-- end id1 -->

					<!-- id2 시작 : 리뷰 -->
					<div class="tab-pane fade" id="id2" style="margin-top: 15px;">
						<!-- 리뷰등록 창 -->
						<h4 style="text-align: left;">상품 리뷰 작성</h4>

						<div class="user1">
							<div
								class="col-lg-6 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
								<div class="fileDiv">
									<img id="fileImg"
										src="${pageContext.request.contextPath}/resources/img/heart.png">
								</div>
							</div>
							<div>
								<c:if test="${login == null}">
									<img
										src="${pageContext.request.contextPath}/resources/img/profile.png"
										alt="프로필사진" style="width: 50px; height: 50px;">
								</c:if>
								<c:if test="${login != null}">
									<img
										src="${pageContext.request.contextPath}/user/display?fileLoca=${data.userFileLoca}&fileName=${data.userFileName}"
										alt="프로필사진" style="width: 50px; height: 50px;">
								</c:if>
							</div>
							<div style="width: 100%;">
								<textarea name="content" id="content" rows="5"
									style="width: 100%;" class="form-control"
									placeholder="상품 리뷰를 작성해주세요"></textarea>
								<div class="reply-group">
									<div class="filebox user2" style="margin-top: 5px;">
										<label for="file">이미지업로드</label> <input type="file"
											name="file" id="file" onchange="readURL(this);">
										<button type="button" class="right btn" id="uploadBtn"
											style="background-color: #5777ba; color: white;">리뷰등록</button>
									</div>
								</div>
							</div>
						</div>
						<!--end 등록 폼 -->
						<br>
						<button type="button" class="btn-group btn-group-lg" id="showBtn"
							style="background-color: #5777ba; color: white;">리뷰보기</button>
						<!-- 보여주기 폼 -->
						<div
							class="col-lg-8 d-lg-flex flex-lg-column order-1 order-lg-2 regi"
							id="contentDiv">
							<!-- getJSON 시작 -->
						</div>

					</div>
					<!-- end id2 -->


					<!-- id3 시작 -->
					<div class="tab-pane fade" id="id3">
						<table class="table table-hover">
							<thead class="bg-thead">
								<tr>
									<th class="p_bno"></th>
									<th class="p_Title">장바구니품목</th>
									<th class="p_Regdate">상품정보</th>
									<th class="p_Price">가격</th>
									<th class="p_like">수량</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="p_bno"><input type="checkbox"></td>
									<td class="p_Title"><a href=""><img src="#"
											style="width: 150px; height: 150px;"></a></td>
									<td class="p_Regdate">아이폰케이스 나노슬림</td>
									<td class="p_Price">40,000원</td>
									<td class="p_like">1개</td>
								</tr>
							</tbody>
						</table>
						<div class="pocket" style="text-align: right; margin-left: 10px;">
							<span>상품금액: 30,000원 |</span> <span>총 금액: <strong>50,000원</strong></span>
						</div>
						<button type="button" class="btn btn-danger search-btn">삭제</button>
						<button type="button" class="btn btn-primary search-btn">주문</button>
					</div>
					<!-- end id3 -->

				</div>
				<!-- end tab-content -->
			</div>
			<!-- end 상품 상세 설명& 물품QnA & 구매후기 시작 -->
		</div>
		<!-- end row -->


	</div>
	<!-- end containser -->




</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>

//# readURL함수 : 이미지 미리보기 기능
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.readAsDataURL(input.files[0]);

		$(".fileDiv").css("display", "block");

		reader.onload = function(event) {
			$('#fileImg').attr("src", event.target.result);
		}
	}
}; // end redURL


// # timeStamp :날짜 처리 함수 : 함수를 만들어 두고 위에서 불러서 작성일 및 시간 처리
function timeStamp(millis) {
	const date = new Date();	//현재 날짜
	//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
	const gap = date.getTime() - millis;
	
	let time;
	if(gap < 60 * 60 * 24* 1000){
		if(gap < 60 * 60 * 1000){
			time = '방금 전';	
		} else {
			time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
		}
	} else {
		const regDate = new Date(millis);
		const year = regDate.getFullYear();
		const month = regDate.getMonth() + 1;
		const day = regDate.getDate();
		
		time = year + '년' + month + '월' + day + '일';
	}
	return time;
}; // end timeStamp

// # 페이지 진입 시 초기화 함수
let str = '';
let page1 = 1;
let isFinish = false;
let gno = '${article[0].gno}';
// # getList 함수
function getList(page, reset) {

	if(reset === true){
		str = '';
	}
	
	$.getJSON(
		'<c:url value="/review/getList?pageNum=' + page1 + '" />',
		function(list) {
			
			if(list.length === 0) isFinish = true;
			
			for(let i=0; i<list.length; i++){
				str +=
					`<div class="title-inner user1">
		              <div class="profile">
		                <img src="${pageContext.request.contextPath}/review/display1?profileFileLoca=` + list[i].profileFileLoca + `&profileFIleName=` + list[i].profileFileName +`" style="width: 50px; height: 50px;">
		              </div>
		              <div class="title">
		                <p style="text-align: left; color: #5777ba; margin-bottom: 0px;">` + list[i].writer + `</p>
		                <small style="color: tomato;">` + timeStamp(list[i].regDate) + `</small>
		              </div>
		            </div>
		            <!-- 내용 영역 -->
		            <div class="content-inner">
		              <p>` + (list[i].content === null ? '' : list[i].content) + `</p>
		            </div>
		            <!-- 이미지 영역 -->
		            <div class="image-inner">
		              <a href="` + list[i].bno + `">
		                <img src="${pageContext.request.contextPath}/review/display?fileLoca=` + list[i].fileLoca + `&fileName=` + list[i].fileName + `">
		              </a>
		            </div>`;

			} // end for
			$('#contentDiv').html(str);
		} // end list
	
	) // end JSON
	
};// end getList



//Start JQuery
$(function () {
	
	//# 탭 메뉴 이동
	$('#id1-tab').click(function(e) {
		e.preventDefault();
		
		$('#id1-tab').addClass("active");
		$('#id2-tab').removeClass("active");
		$('#id3-tab').removeClass("active");
		
		$('#id1').addClass("show active");
		$('#id2').removeClass("show active");
		$('#id3').removeClass("show active");
	});

	$('#id2-tab').click(function(e) {
		e.preventDefault();
		
		$('#id2-tab').addClass("active");
		$('#id1-tab').removeClass("active");
		$('#id3-tab').removeClass("active");
		
		$('#id2').addClass("show active");
		$('#id1').removeClass("show active");
		$('#id3').removeClass("show active");
	});

	$('#id3-tab').click(function(e) {
		e.preventDefault();
		
		$('#id3-tab').addClass("active");
		$('#id1-tab').removeClass("active");
		$('#id2-tab').removeClass("active");
		
		$('#id3').addClass("show active");
		$('#id1').removeClass("show active");
		$('#id2').removeClass("show active");
	});
	
	// # 리뷰 등록 버튼
	$('#uploadBtn').click(function () {
		
		if(confirm('리뷰를 등록 하시겠습니까?') == true){
			regist();
		} else {
			return false;
		}
	});// end uploadBtn
	
	// # 리뷰 보기 버튼
	$('#showBtn').click(function(){
		getList();
	}); // end showBtn
	
	
	//# regist : 등록 담당 함수
	function regist() {
		//userid 변수 값 저장
		const userId = '${login.userId}';
		//이미지 파일만 받기 위해 준비
		let file = $('#file').val();
		file = file.slice(file.indexOf('.') + 1).toLowerCase();
		
		if(file != 'jpg' && file !== 'jpeg' && file !== 'jfif' && file !== 'gif' && file !== 'bmp' && file !== 'png' && file !== 'tif' && file !== 'bpg'){
			alert('이미지 파일만 등록 가능합니다');
			$('#file').val('');
			$('.fileDiv').css('display', 'none');
			return;
		} else if(userId === ''){
			alert('로그인이 필요한 서비스 입니다.');
			$('.fileDiv').css('display', 'none');
			return;
		}
		//FormData 로 만들어서 ajax로 컨트롤러로 보내기
		const formData = new FormData();
		const data = $('#file');
		
		formData.append('file', data[0].files[0]);
		const content = $('#content').val();
		formData.append('content', content);
		
		$.ajax({
			type : 'post',
			url : '<c:url value="/review/insert" />',
			data : formData,
			contentType : false,	//false로 해야 multipart로 날아감
			processData : false,
			success : function (result) {
				if(result === 'regSuccess'){
					alert('리뷰작성이 완료 되었습니다.');
					$('#file').val('');
					$('#content').val('');
					$('.fileDiv').css('display', 'none');
				/* 	getListLike(true).done(getList); */
				}
			},
			error : function() {
				alert('관리자에게 문의 하세요');
			}
		}); // end ajax
	}; //end 등록하기
	
	
	// # timeStamp :날짜 처리 함수 : 함수를 만들어 두고 위에서 불러서 작성일 및 시간 처리
	function timeStamp(millis) {
		const date = new Date();	//현재 날짜
		//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
		const gap = date.getTime() - millis;
		
		let time;
		if(gap < 60 * 60 * 24* 1000){
			if(gap < 60 * 60 * 1000){
				time = '방금 전';	
			} else {
				time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
			}
		} else {
			const regDate = new Date(millis);
			const year = regDate.getFullYear();
			const month = regDate.getMonth() + 1;
			const day = regDate.getDate();
			
			time = year + '년' + month + '월' + day + '일';
		}
		return time;
	}; // end timeStamp
	
	//검색 엔터키 입력
	$('#keywordInput').keydown(function(e) {
		if(e.keyCode == 13){
			$('#searchFormObj').submit();
		}
	}); // end 엔터키 입력
	
	
	//# 게시글 삭제
	$('#delBtn').click(function() {
		
		if(confirm('삭제 하시겠습니까?') == true){
			let gno = '${article[0].gno}';
			
			$.ajax({
				type : 'post',
				url : '<c:url value="/gamja/delete" />',
				data : gno,
				dateType : 'text',
				contentType : 'application/json',
				success : function(result) {
					if(result === 'delSuccess'){
						alert('정상 삭제 되었습니다.');
						location.href="<c:url value='/gamja/gamjaList' />";
					} else {
						alert('삭제 실패');
					}	
				},
				error : function() {
					alert('관리자에게 문의');
				}
			});//end ajax
		} else {
			return false;
		}
	});// end 게시글 삭제
	
	
	// # 게시글 수정
	$('#modBtn').click(function() {
		
		if(confirm('수정하러 가시겠습니까?') == true){
			let gno = '${article[0].gno}';
			location.href = "<c:url value='/gamja/gamjaModify/' />" + gno
		} else {
			return false;
		}		
	});// end 게시글 수정
	
	// # 장바구니 버튼 클릭
	$('#basketBtn').click(function() {
		const userId = '${login.userId}';
		if(userId === ''){
			alert('로그인 해야 이용 가능한 서비스입니다.');
		} else {
			const form = {
					userNo : '${login.userNo}',
					gno : '${article[0].gno}',
					bookCount : '1'
			}
			
			$.ajax({
				url : '<c:url value="/cart/add" />',
				type : 'post',
				data : form,
				success : function(result) {
					if(result == '0'){
						alert('장바구니에 추가하지 못했습니다.관리자 문의');
					} else if (result == '1'){
						alert('장바구니에 추가되었습니다.');
					} else if (result == '2'){
						alert('장바구니에 이미 추가되어 있습니다.');
					} else if (result == '5'){
						alert('로그인해야 가능한 서비스입니다.');
					}
				}
				
			})// end ajax
		}
		
		
	}); // end 장바구니 버튼 클릭
	
	// # 내물건등록 버튼 클릭
	$('#gamjaRegistBtn').click(function () {
		const userId = '${login.userId}';
		if(userId === ''){
			alert('로그인 해야 이용 가능한 서비스입니다.');
		} else {
			location.href = "<c:url value='/gamja/gamjaRegist' />"
		}
		
	}); // end 내 물건등록버튼
	
}); //end JQuery

	

</script>