<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<!-- ======= Home Section ======= -->
<section id="hero" class="d-flex align-items-center freeTable">

	<div class="container">
		<div class="row">
			<div class="col-lg-8 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<div class="usertitle">
					<p>회원가입</p>
				</div>

				<!-- 회원가입 폼 -->
				<form action="<c:url value='/user/join'/>" id="joinForm" method="post" enctype="multipart/form-data">
					<!-- 아이디 -->
					<div class="userform">
						<label>아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgId"
							style="color: tomato; font-size: 15px;"></span>
						<div class="user1">
							<input type="text" style="height: 100%; width: 90%;" name="userId" id="userId"
								class="form-control" placeholder="아이디를 입력하세요" maxlength="12">&nbsp;
							<button type="button"
								style="height: 100%; width: 15%; background-color: #5777ba; border: 0px;"
								class="btn btn-primary" id="idCheckBtn">중복체크</button>
						</div>
					</div>

					<!-- 비밀번호 -->
					<div class="userform">
						<label>비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPw"
							style="color: tomato; font-size: 15px;"></span>
						<div class="user1">
							<input type="password" style="height: 100%; width: 100%;" name="userPw" id="userPw"
								class="form-control" placeholder="비밀번호를 입력하세요" maxlength="14">
						</div>
					</div>
					<div class="userform">
						<label>비밀번호 확인</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPwchk"
							style="color: tomato; font-size: 15px;"></span>
						<div class="user1">
							<input type="password" style="height: 100%; width: 100%;" id="pwConfirm"
								class="form-control" placeholder="비밀번호를 확인해주세요" maxlength="14">
						</div>
					</div>

					<!-- 이름 -->
					<div class="userform">
						<label>이 름</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgName"
							style="color: tomato; font-size: 15px;"></span>
						<div class="user1">
							<input type="text" style="height: 100%; width: 100%;" name="userName" id="userName"
								class="form-control" placeholder="이름을 입력하세요" maxlength="6">
						</div>
					</div>

					<!-- 휴대폰번호 -->
					<div class="userform">
						<label>휴대폰번호</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="#"></span>
						<div class="user1">
							<select class="phone1" style="width: 10%; border-radius: 10px; text-align: center;"
								id="userPhone1" name="userPhone1">
								<option>010</option>
								<option>011</option>
								<option>017</option>
							</select>&nbsp; <input type="text" style="height: 100%; width: 50%;" id="userPhone2"
								name="userPhone2" class="form-control" placeholder="앞4자리" maxlength="4">&nbsp; 
								<input
								type="text" style="height: 100%; width: 50%;" id="userPhone3" name="userPhone3"
								class="form-control" placeholder="뒤4자리" maxlength="4">
						</div>
					</div>

					<!-- 이메일 -->
					<div class="userform">
						<label>이메일</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="#"></span>
						<div class="user1">
							<input type="text" style="height: 100%; width: 60%;" id="userEmail1" name="userEmail1"
								class="form-control" placeholder="이메일을 입력하세요">&nbsp;
							<select class="useremail2" style="width: 30%; border-radius: 10px;" id="userEmail2"
								name="userEmail2">
								<option value="" selected="selected">선택</option>
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
						<div>
							<!-- 이메일 직접 입력 -->
							<input type="text" class="form-control boxdirect"
								style="margin-left: 60%; margin-bottom: 5px; margin-top: 5px; width: 40%;"
								id="userEmail3" name="userEmail3" placeholder="이메일 직접입력">
						</div>
						<!-- 이메일 인증 박스 -->
						<div class="mailcheckbox" id="mailcheckbox">
							<input type="text" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력하세요"
								maxlength="6" disabled="disabled">
							<span id="mail-check-warn" style="color: tomato; font-size: 15px;"></span>
						</div>
					</div>

					<!-- 주소 -->
					<div class="userform">
						<label>주 소</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="#"></span>
						<div class="user1" style="margin-bottom: 5px;">
							<input type="text" style="height: 100%; width: 30%; background: #c8c8c8;" name="userAddrZipnum"
								id="userAddrZipnum" class="form-control" placeholder="우편번호" readonly>&nbsp;
							<button type="button"
								style="height: 100%; width: 15%; background-color: #5777ba; border: 0px;"
								class="btn btn-primary" id="idCheckBtn" onclick="searchAddress()">주소찾기</button>
						</div>

						<div class="user1">
							<input type="text" style="height: 100%; width: 50%;" id="userAddrBasic" name="userAddrBasic"
								class="form-control" placeholder="기본 주소" maxlength="30">&nbsp; <input type="text"
								style="height: 100%; width: 50%;" id="userAddrDetail" name="userAddrDetail"
								class="form-control" placeholder="상세 주소" maxlength="30">&nbsp;
						</div>
						
					</div>

					<!-- 프로필 사진 -->
					<div class="userform">
						<label>프로필사진</label>
						<div class="user1">
							<input type="file" name="file" id="file" onchange="readURL(this);">가로150 & 세로150 사이즈만
							등록<br>.png,
							.jpg, .jpeg만 등록 가능
						</div>
						<div class="fileDiv">
							<img id="fileImg" style="width: 150px; height: 150px;" src="">
						</div>
					</div>

					<tr>
						<td style="width: 50%; text-align: center;"><input type="button" value="회원가입"
								class="btn form-control tooltipstered" id="joinBtn"
								style="background-color: #57ba67; margin-top: 0; margin-top: 10px; height: 40px; color: white; border: 0px solid #5777ba; opacity: 0.8">
						</td>
					</tr>
				</form>
			</div>
		</div>
	</div>

</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<!-- 다음 지도 api 등록 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	//# 이미지 미리보기 기능
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.readAsDataURL(input.files[0]);

			$(".fileDiv").css("display", "block");

			reader.onload = function (event) {
				$('#fileImg').attr("src", event.target.result);
				console.log(event.target)
			}
		}
	}; // end redURL

	// # 주소 찾기 버튼(카카오)
	function searchAddress() {
		new daum.Postcode({
			oncomplete: function (data) {

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

	// # 정규식 검사
	let id = document.getElementById("userId");
	id.onblur = function () {
		let regex = /^[A-Za-z0-9+]{4,12}$/;
		if (regex.test(document.getElementById("userId").value)) {
			document.getElementById("msgId").innerHTML = "아이디 중복체크는 필수 입니다.";
		} else {
			document.getElementById("msgId").innerHTML = "영어 대/소문자+숫자 최소 4~12글자까지 가능합니다.";
		}
	} // end 아이디 정규식

	let pw = document.getElementById("userPw");
	pw.onblur = function () {
		let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if (regex.test(document.getElementById("userPw").value)) {
			document.getElementById("msgPw").innerHTML = "사용가능합니다.";
		} else {
			document.getElementById("msgPw").innerHTML = "최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자를 입력하세요.";
		}
	} // end 비번 정규식

	let pwConfirm = document.getElementById("pwConfirm");
	pwConfirm.onblur = function () {
		let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if (document.getElementById("pwConfirm").value == document.getElementById("userPw").value) {
			document.getElementById("msgPwchk").innerHTML = "비밀번호가 일치 합니다.";
		} else {
			document.getElementById("msgPwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	} // end 비번 확인 정규식

	let userName = document.getElementById("userName");
	userName.onblur = function () {
		let regex = /^[가-힣]{2,4}$/;
		if (regex.test(document.getElementById("userName").value)) {
			document.getElementById("msgName").innerHTML = "사용 가능 합니다.";
		} else {
			document.getElementById("msgName").innerHTML = "한글 최소 2~4글자 까지 가능합니다.";
		}
	} // end 이름 확인 정규식

	// # 로딩창 만들기
	function openLoading() {
		const maskWidth = window.document.body.clientWidth;
		const maskHeight = window.document.body.clientHeight;

		const $mask =
			'<div id="mask" style="position: fixed; left: 0; top: 0; z-index: 9999; background: #000000; display: none;"></div>';

		let $loadingImg = '';
		$loadingImg +=
			'<div id="loadingImg" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; z-index: 99999;">';
		$loadingImg +=
			`<img src="<c:url value='/img/loading.gif' />" style="position: relative; display: block; margin: 0 auto;" />`
		$loadingImg += '</div>';

		$('body').append($mask).append($loadingImg);

		$('#mask').css({
			'width': maskWidth,
			'height': maskHeight,
			'opacity': '0.2'
		});

		$('#mask').show();
		$('#loadingImg').show();
	} // end openLoading
	// # 로딩창 숨겨주기
	function closeLoading() {
		$('#mask, #loadingImg').hide();
	}


	// JQuery Start
	$(function () {

		//# 회원가입 버튼
		$('#joinBtn').click(function () {
			if($('#userId').val().trim() === ''){
				alert('아이디 입력은 필수 입니다.');
				$('#userId').focus();
				return;
			}
			if($('#userId').attr('readonly') !== 'readonly'){
				alert('아이디 중복확인은 필수 입니다.');
				$('#userId').focus();
				return;
			}
			if ($('#userPw').val().trim() === '') {
				alert('비밀번호 입력은 필수 입니다.');
				$('#userPw').focus();
				return;
			}
			if ($('#userPw').val() !== $('#pwConfirm').val()) {
				alert('비밀번호가 일치하지 않습니다. 확인해주세요.');
				$('#pwConfirm').focus();
				return;
			}
			if ($('#userName').val().trim() === '') {
				alert('이름은 필수 입력입니다.');
				$('#userName').focus();
				return;
			}
			if ($('#userEmail1').val().trim() === '') {
				alert('이메일은 필수 입력입니다.');
				$('#userEmail1').focus();
				return;
			}
			if ($('#userEmail1').attr('readonly') !== 'readonly'){
				alert('이메일 인증은 필수입니다.');
				$('#userEmail1').focus();
				return;
			}
			if ($('#fileImg').attr('src') === ''){
				alert('프로필 사진 등록은 필수 입니다.');
				return;
			}
			if(confirm('회원 가입 하시겠습니까?') == true){
				$('#joinForm').submit();
			} else {
				return false;
			}			
		}); // end 회원가입 버튼

		//# 아이디 중복 체크
		$('#idCheckBtn').click(function () {

			const userId = $('#userId').val();

			if (userId === '') {
				alert('아이디는 필수입력 입니다.');
				return;
			}

			$.ajax({
				type: 'post',
				url: '<c:url value="/user/idCheck" />',
				data: userId,
				contentType: 'application/json',
				success: function (data) {
					if (data === 'ok') {
						$('#userId').attr('readonly', true);
						$('#userId').attr('style', 'background: #c8c8c8;');
						$('#idCheckBtn').attr('disabled', true);
						$('#msgId').html('사용가능한 아이디 입니다.');
					} else {
						$('#msgId').html('중복된 아이디 입니다.');
						$('#userId').focus();
					}
				},
				error: function () {
					alert('관리자에게 문의하세요');
				}
			}); // end ajax
		}); // end idCheckBtn

		$(".boxdirect").hide(); // 메일 직접입력 감추기
		//# 이메일 직접입력 창
		$('#userEmail2').change(function () {
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

		//# 이메일 인증번호 체크
		$('.mail-check-input').blur(function () {
			const inputCode = $(this).val(); //사용자가 입력한 인증번호 변수
			const $resultMsg = $('#mail-check-warn'); // span 태그 변수

			if (inputCode === code) {
				$resultMsg.html('인증번호가 일치 합니다.');
				$('#mailCheckBtn').attr('disabled', true);
				$('#userEmail1').attr('readonly', true);
				$('#userEmail2').attr('readonly', true);
				$(this).attr('disabled', true);
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
				$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
			} else if (inputCode === '') {
				$resultMsg.html('인증번호를 입력해 주세요.');
			} else {
				$resultMsg.html('인증번호가 일치하지 않습니다. 확인해주세요');
				$resultMsg.focus();
			}
		}); // end mail-check-input




	}); // end jQuery
</script>