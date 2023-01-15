<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../include/header.jsp"%>

<section id="hero" class="d-flex align-items-center freeTable">

	<div class="container">
		<div class="row">
			<div class="usertitle">
				<p>회원정보</p>
				<hr>
			</div>
			<!-- 좌측 메뉴 -->
			<div
				class="col-lg-4 d-lg-flex flex-lg-column order-1 order-lg-2 regi"
				style="border-right: 1px solid rgb(206, 205, 205)">
				<div class="fileProfile">
					<p><strong>프로필 사진</strong></p>
					<img id="proFileImg" style="width: 150px; height: 150px;"
					src="${pageContext.request.contextPath}/user/display?fileLoca=${data.userFileLoca}&fileName=${data.userFileName}">
				</div>
				<hr>
				<div><strong>▷ 가입일 :</strong> <fmt:formatDate value="${userInfo[0].userRegDate}" pattern="YYYY년 MM월 dd일"/> </div>
				<div><strong>▷ 게시글 수 :</strong> ${boardCnt}개</div>
				<div><strong>▷ 댓글 수 :</strong> ${replyCnt}개</div>
				<div><strong>▷ 이미지게시글 수 :</strong> ${imgCnt}개</div>
				<div><strong>▷ 판매상품판매 수 :</strong> ${gamjaCnt}개</div>

				<!--차트가 그려질 부분-->
				<div style="width: 100%; height: 30%;">
					<canvas id="myChart"></canvas>
				</div>


			</div>
			<!-- end 좌측 메뉴 -->

			<!-- 우측 메뉴 -->
			<div
				class="col-lg-8 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
					<a class="nav-link active" data-bs-target="#id1"
						data-toggle="tab" href="#id1-tab" id="id1-tab">내정보수정</a></li>
					<li class="nav-item">
					<a class="nav-link" data-toggle="tab" data-bs-target="#id2"
						href="#id2-tab" id="id2-tab">내글목록</a></li>
					<li class="nav-item">
					<a class="nav-link" data-toggle="tab" data-bs-target="#id3"
						href="#id3-tab" id="id3-tab">장바구니</a></li>
				</ul>

				<!-- 탭 안쪽 -->
				<div class="tab-content">
					<div class="tab-pane fade show active" id="id1" style="text-align: left; margin: 5px; width: 100%;">
						<form action="<c:url value='/user/update' />" id="updateForm" method="post" enctype="multipart/form-data">
							<!-- 아이디 -->
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; flex-direction: row;">아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgId"></span>
								<div class="user1">
									<input type="text" style="height: 100%; width: 100%; background: #e0e0e0;"
										name="userId" class="form-control" value="${userInfo[0].userId}"
										readonly>
								</div>
							</div>

							<!-- 비밀번호 -->
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; text-align: left;">비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPw" style="color: tomato; font-size: 15px;"></span>
								<div class="user1">
									<input type="password" style="height: 100%; width: 100%;"
										name="userPw" id="userPw" class="form-control" placeholder="변경 할 비밀번호를 입력하세요"
										maxlength="14">
								</div>
							</div>
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; text-align: left;">비밀번호 확인</label>&nbsp;&nbsp;&nbsp;&nbsp;<span
									id="msgPwchk" style="color: tomato; font-size: 15px;"></span>
								<div class="user1">
									<input type="password" style="height: 100%; width: 100%;"
										id="pwConfirm" class="form-control" placeholder="변경 할 비밀번호를 확인해주세요"
										maxlength="14">
								</div>
							</div>

							<!-- 이름 -->
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; text-align: left;">이 름</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPwchk"></span>
								<div class="user1">
									<input type="text" style="height: 100%; width: 100%; background: #e0e0e0;"
										name="userName"  id="userName" class="form-control" value="${userInfo[0].userName}"
										readonly>
								</div>
							</div>

							<!-- 휴대폰번호 -->
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; text-align: left;">휴대폰번호</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPwchk"></span>
								<div class="user1">
									<select class="phone1"
										style="width: 10%; border-radius: 10px; text-align: center;"
										id="userphone1" name="userphone1">
										<option>010</option>
										<option>011</option>
										<option>017</option>
									</select>&nbsp; 
									<input type="text" style="height: 100%; width: 50%;" id="userPhone2"
										name="userPhone2" class="form-control" value="${userInfo[0].userPhone2}"
										maxlength="4">&nbsp; 
									<input type="text"
										style="height: 100%; width: 50%;" id="userPhone3" name="userPhone3"
										class="form-control" placeholder="뒤4자리" value="${userInfo[0].userPhone3} "maxlength="4">
								</div>
							</div>

							<!-- 이메일 -->
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; text-align: left;">이메일</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPwchk"></span>
								<div class="user1">
									<input type="text" style="height: 100%; width: 50%;" id="userEmail1" name="userEmail1"
										value="${userInfo[0].userEmail1}" class="form-control">&nbsp;
									<select class="useremail2"
										style="width: 30%; border-radius: 10px;" id="userEmail2"
										name="userEmail2">
										<c:if test="${login == null}">
										<option value="">선택</option>
										</c:if>
										
										<c:if test="${login != null}">
										<option value="">${userInfo[0].userEmail2}</option>
										</c:if>
										
										<option>@naver.com</option>
										<option>@gmail.com</option>
										<option>@hanmail.net</option>
										<option>@nate.com</option>
										<option>직접입력</option>
									</select>&nbsp;
									<button type="button"
										style="height: 100%; width: 15%; background-color: #5777ba; border: 0px;"
										class="btn btn-primary" id="mailCheckBtn">이메일인증</button>
								</div>
								<div class="user1">
									<!-- 이메일 직접 입력 -->
									<input type="text" class="form-control boxdirect"
										style="margin-left: 60%; margin-bottom: 5px; margin-top: 5px; width: 40%;" id="userEmail3"
										name="userEmail3" placeholder="이메일 직접입력">
									<!-- 이메일 인증 박스 -->
									<div class="mailcheckbox" id="mailcheckbox">
										<input type="text" class="form-control mail-check-input"
											placeholder="인증번호 6자리를 입력하세요" maxlength="6"
											disabled="disabled"> <span id="mail-check-warn" style="color: tomato; font-size: 15px;"></span>
									</div>
								</div>
							</div>

							<!-- 주소 -->
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; text-align: left;">주 소</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPwchk"></span>
								<div class="user1" style="margin-bottom: 5px;">
									<input type="text" style="height: 100%; width: 30%; background: #e0e0e0;"
										name="userAddrZipnum" id=userAddrZipnum class="form-control"
										value="${userInfo[0].userAddrZipnum}" readonly>&nbsp;
									<button type="button"
										style="height: 100%; width: 15%; background-color: #5777ba; border: 0px;"
										class="btn btn-primary" id="idCheckBtn" onclick="searchAddress()">주소찾기</button>
								</div>
								
								<div class="user1">
								<input type="text" style="height: 100%; width: 50%;" id="userAddrBasic" name="userAddrBasic"
									class="form-control" value="${userInfo[0].userAddrBasic}" maxlength="30">&nbsp; 
									<input type="text"
									style="height: 100%; width: 50%;" id="userAddrDetail" name="userAddrDetail"
									class="form-control" value="${userInfo[0].userAddrDetail}" maxlength="30">&nbsp;
							</div>
								
							</div>

							<!-- 프로필 사진 -->
							<div class="userform" style="width: 100%;">
								<label style="font-size: 20px; font-weight: bold; text-align: left;">프로필사진</label>
								<div class="user1">
									<input type="file" name="file" id="file"
										onchange="readURL(this);">가로150 & 세로150 사이즈만 등록<br>.png,
									.jpg, .jpeg만 등록 가능
								</div>
								<div class="fileDiv">
							<img id="fileImg" style="width: 150px; height: 150px;" src="">
								</div>
							</div>

							<tr>
								<td style="width: 50%; text-align: center;"><input
									type="button" value="회원정보수정"
									class="btn form-control tooltipstered" id="modify-btn"
									style="background-color: #57ba67; margin-top: 0; margin-bottom: 5px; height: 40px; color: white; border: 0px solid #5777ba; opacity: 0.8">
								</td>
							</tr>
						</form>

					</div>
					<!-- end id1 -->

					<!-- id2 시작 -->
					<div class="tab-pane fade" id="id2">
						<!-- 검색 창 -->
						<form action="#">
							<div class="search-wrap">
								<select class="search-select">
									<option value="">제목</option>
									<option value="">내용</option>
									<option value="">작성자</option>
									<option value="">제목+내용</option>
								</select> <input type="text" ckass="form-control search-input"
									placeholder="검색어">
								<button typ="button" class="btn btn-primary search-btn">검색</button>
							</div>
						</form>

						<!--게시글 테이블-->
						<table class="table table-hover">
							<thead class="bg-thead">
								<tr>
									<th class="m_bno">No.</th>
									<th class="m_Title">제목</th>
									<th class="m_Regdate">작성일</th>
									<th class="m_like">조회수</th>
								</tr>
							</thead>
							
							<tbody>
							
							<c:if test="${fn:length(userInfo[1].userBoardList) >0}">
							<c:forEach var="vo" items="${userInfo.userBoardList}">
								<tr>
									<td class="m_bno">${vo.bno}</td>
									<td class="m_Title"><a href="<c:url value='/board/boardContent/${vo.bno}${pc.makeURI(pc.paging.pageNum)}' />">${vo.title}</a></td>
									<td class="m_Regdate">
										<fmt:formatDate value="${vo.regDate}" pattern="yy년 MM월 dd일"/>
									</td>
									<td class="m_like">${vo.viewCount}</td>
								</tr>
							</c:forEach>	
							</c:if>
							
							<c:if test="${fn:length(userInfo[1].userBoardList) <= 0}">
								<tr>
									<td class="m_bno"></td>
									<td class="m_Title"><a href="">작성한 글이 없습니다.</a></td>
									<td class="m_Regdate"></td>
									<td class="m_like"></td>
								</tr>
							</c:if>

								
							</tbody>
						</table>

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
							</div>
							
							 <!-- 페이지 관련버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값 hiddentype 만들어 두기 -->
		                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
		                    <input type="hidden" name="cpp" value="${pc.paging.cpp}">
		                    <input type="hidden" name="condition" value="${pc.paging.condition}">
		                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
							
						</form>
						
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
			<!-- end 우측메뉴 -->
		</div>
		<!-- end row -->
	</div>


</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<!-- 다음 지도 api 등록 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	
	// # msg 출력
	const msg = '${msg}';
	if(msg === 'update'){
		alert('회원정보 수정이 완료 되었습니다.');
	}; // end msg 출력
	
	
	//# 이미지 미리보기 기능
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.readAsDataURL(input.files[0]);

			$(".fileDiv").css("display", "block");

			reader.onload = function(event) {
				$('#fileImg').attr("src", event.target.result);
				console.log(event.target)
			}
		}
	}; // end redURL

	//# 주소 찾기 버튼(카카오)
	function searchAddress() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('userAddrZipnum').value = data.zonecode;
						document.getElementById("userAddrBasic").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("userAddrDetail").focus();
					}
				}).open();
	} // end 카카오주소찾기

	//# 정규식 검사
	let pw = document.getElementById("userPw");
	pw.onblur = function() {
		let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if (regex.test(document.getElementById("userPw").value)) {
			document.getElementById("msgPw").innerHTML = "사용가능합니다.";
		} else {
			document.getElementById("msgPw").innerHTML = "최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자를 입력하세요.";
		}
	} // end 비번 정규식

	let pwConfirm = document.getElementById("pwConfirm");
	pwConfirm.onblur = function() {
		let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if (document.getElementById("pwConfirm").value == document
				.getElementById("userPw").value) {
			document.getElementById("msgPwchk").innerHTML = "비밀번호가 일치 합니다.";
		} else {
			document.getElementById("msgPwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	} // end 비번 확인 정규식

	// # 로딩창 만들기
	function openLoading() {
		const maskWidth = window.document.body.clientWidth;
		const maskHeight = window.document.body.clientHeight;

		const $mask = '<div id="mask" style="position: fixed; left: 0; top: 0; z-index: 9999; background: #000000; display: none;"></div>';

		let $loadingImg = '';
		$loadingImg += '<div id="loadingImg" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; z-index: 99999;">';
		$loadingImg += `<img src="<c:url value='/img/loading.gif' />" style="position: relative; display: block; margin: 0 auto;" />`
		$loadingImg += '</div>';

		$('body').append($mask).append($loadingImg);

		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight,
			'opacity' : '0.2'
		});

		$('#mask').show();
		$('#loadingImg').show();
	} // end openLoading
	// # 로딩창 숨겨주기
	function closeLoading() {
		$('#mask, #loadingImg').hide();
	}

	//# JQuery Start
	$(function() {

		//# 회원정보 수정 버튼
		$('#modify-btn').click(function(){
			confirm('정보를 수정 하시겠습니까??');
			$('#updateForm').submit();
		});
		// end 회원정보 수정
		
		
		// # 탭 메뉴 이동
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

		$(".boxdirect").hide(); // 메일 직접입력 감추기
		//# 이메일 직접입력 창
		$('#userEmail2').change(function() {
			let result = $('#userEmail2 option:selected').text();
			if (result == '직접입력') {
				$('.boxdirect').show();
			} else {
				$('.boxdirect').hide();
			}
		});

		$('#mailcheckbox').hide(); // 메일 체크박스 감추기
		let code = ''; // 메일 전송 인증번호 저장 변수
		//# 이메일 인증번호 전송
		$('#mailCheckBtn').click(function () {
			openLoading();
			const email1 = $('#userEmail1').val();
			const email2 = $('#userEmail2').val();
			const email3 = $('#userEmail3').val();
			
			$('mailcheckbox').show();
			let result = $('#userEmail2 option:selected').text();
			if(result == '직접입력'){
				$.ajax({
					type: 'get',
					url: '<c:url value="/user/mailCheck?email=" />' + email1 + email3, 
					success: function (data) {
						closeLoading();
						code = data;
						alert('인증번호가 전송되었습니다.');
						$('#mailcheckbox').show();
						$('.mail-check-input').attr('disabled', false);
						$('.mail-check-input').focus();
					}
				}); // end ajax
			} else {
				$.ajax({
					type: 'get',
					url: '<c:url value="/user/mailCheck?email=" />' + email1 + email2,
					success: function (data) {
						closeLoading();
						code = data;
						alert('인증번호가 전송되었습니다.');
						$('#mailcheckbox').show();
						$('.mail-check-input').attr('disabled', false);
						$('.mail-check-input').focus();
					}
				}); // end ajax
			}
			
		}); // end 이메일 인증번호
	
		 // # 차트 스크립트 : getContext 모양 / Chart 함수안에 데이터
	    var context = document
	      .getElementById('myChart')
	      .getContext('2d');
		let boardCnt = '${boardCnt}';
		let replyCnt = '${replyCnt}';
		let imgCnt = '${imgCnt}';
		let gamjaCnt = '${gamjaCnt}';

	    var myChart = new Chart(context, {
	      type: 'bar', // 차트의 형태
	      data: { // 차트에 들어갈 데이터
	        labels: [
	          //x 축
	          '게시글', '댓글', '이미지', '상품판매'
	        ],
	        datasets: [{ //데이터
	            label: '내관리', //차트 제목
	            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	            data: [
	            	boardCnt, replyCnt, imgCnt, gamjaCnt //x축 label에 대응되는 데이터 값
	            ],
	            backgroundColor: [
	              //색상
	              'rgba(255, 99, 132, 0.2)',
	              'rgba(54, 162, 235, 0.2)',
	              'rgba(153, 102, 255, 0.2)',
	              'rgba(75, 192, 192, 0.2)',
	            ],
	            borderColor: [
	              //경계선 색상
	              'rgba(255, 99, 132, 1)',
	              'rgba(54, 162, 235, 1)',
	              'rgba(153, 102, 255, 1)',
	              'rgba(75, 192, 192, 1)',
	            ],
	            borderWidth: 1 //경계선 굵기
	          }
	        ]
	      },
	      options: {
	        scales: {
	          yAxes: [{
	            ticks: {
	              beginAtZero: true
	            }
	          }]
	        }
	      }
	    }); // end 차트스크립트
	    
		//# 이메일 인증번호 체크
		$('.mail-check-input').blur(
				function() {
					const inputCode = $(this).val(); //사용자가 입력한 인증번호 변수
					const $resultMsg = $('#mail-check-warn'); // span 태그 변수

					if (inputCode === code) {
						$resultMsg.html('인증번호가 일치 합니다.');
						$('#mailCheckBtn').attr('disabled', true);
						$('#userEmail1').attr('readonly', true);
						$('#userEmail2').attr('readonly', true);
						$(this).attr('disabled', true);
						$('#userEmail2').attr('onFocus',
								'this.initialSelect = this.selectedIndex');
						$('#userEmail2').attr('onChange',
								'this.selectedIndex = this.initialSelect');
					} else if (inputCode === '') {
						$resultMsg.html('인증번호를 입력해 주세요.');
					} else {
						$resultMsg.html('인증번호가 일치하지 않습니다. 확인해주세요');
						$resultMsg.focus();
					}
				}); // end mail-check-input

	});// end jQuery
</script>




