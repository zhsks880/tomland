<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../include/header.jsp"%>

<section id="hero" class="d-flex align-items-center freeTable">

	<div class="container">
		<div class="row">
			<div class="usertitle">
				<p>비밀번호 찾기</p>
				<hr>
			</div>
			<!-- 아이디 찾기 -->
			<div
				class="col-lg-8 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<p>회원가입시 사용한 ID 을 작성 후 아이디체크를 해주세요</p>
				<br>

				<!-- 아이디 -->
				<div class="userform">
					<label>아이디</label>&nbsp;&nbsp;&nbsp;&nbsp; <span id="msgId"
						style="color: tomato; font-size: 15px;"></span>
					<div class="user1">
						<input type="text" style="height: 100%; width: 90%;" name="userId"
							id="userId" class="form-control" placeholder="아이디를 입력하세요"
							maxlength="12">&nbsp;
						<button type="button"
							style="height: 100%; width: 15%; background-color: #5777ba; border: 0px;"
							class="btn btn-primary" id="idCheckBtn">아이디체크</button>
					</div>
				</div>


				<!-- 이메일 -->
				<div class="userform" id="userEmailForm">
					<div class="user1">
						<input type="text" style="height: 100%; width: 50%;"
							id="userEmail1" name="userEmail1" class="form-control"
							placeholder="이메일을 입력하세요">&nbsp; <select
							class="useremail2" style="width: 30%; border-radius: 10px;"
							id="userEmail2" name="userEmail2">
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
							style="margin-left: 60%; margin-bottom: 5px; margin-top: 10px; width: 40%;"
							id="userEmail3" name="userEmail3" placeholder="이메일 직접입력">
					</div>

					<!-- 이메일 인증 박스 -->
					<div class="mailcheckbox" id="mailcheckbox" style="margin-top: 10px;">
						<input type="text" class="form-control mail-check-input"
							placeholder="인증번호 6자리를 입력하세요" maxlength="6" disabled="disabled">
						<span id="mail-check-warn" style="color: tomato; font-size: 15px;"></span>
					</div>
					<br>
				</div>

				<!-- 비밀번호 업데이트 -->
				<br>
				<div class="updatePw" id="updatePw">
					<p>새로운 비밀번호를 입력해 주세요</p>
					&nbsp;&nbsp;&nbsp;&nbsp; <span id="msgPw"
						style="color: tomato; font-size: 15px;"></span>
					<div class="user1">

						<input type="password" style="height: 100%; width: 90%;"
							name="newUserPw" id="newUserPw" class="form-control"
							placeholder="비밀번호를 입력하세요" maxlength="14">
						<button type="button"
							style="height: 100%; width: 30%; background-color: #5777ba; border: 0px;"
							class="btn btn-primary" id="updatePwBtn">비밀번호수정하기</button>
					</div>


				</div>


			</div>






		</div>
		<!-- end row -->
	</div>

</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>


<script>
	
	// # msg 출력
/* 	const msg = '${msg}';
	if(msg === 'update'){
		alert('회원정보 수정이 완료 되었습니다.');
	}; // end msg 출력 */
		
	// # 비밀번호 정규식 검사
	let pw = document.getElementById("newUserPw");
	pw.onblur = function() {
		let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if (regex.test(document.getElementById("newUserPw").value)) {
			document.getElementById("msgPw").innerHTML = "사용가능합니다.";
		} else {
			document.getElementById("msgPw").innerHTML = "최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자를 입력하세요.";
		}
	} // end 비번 정규식

	
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

	//Start JQuery
	$(function() {

		$(".boxdirect").hide(); // 메일 직접입력 감추기
		$('#mailcheckbox').hide(); // 메일 체크박스 감추기
		$('#userEmailForm').hide(); // 메일 입력창 감추기
		$('#updatePw').hide(); // 비번 업데이트 창 감추기
		
		
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
					if (data === 'duplicated') {
						$('#userId').attr('readonly', true);
						$('#userId').attr('style', 'background: #c8c8c8;');
						$('#idCheckBtn').attr('disabled', true);
						$('#msgId').html('존재하는 아이디 입니다.');
						$('#userEmailForm').show();
					} else {
						$('#msgId').html('존재하지 않는 아이디 입니다.\r\n 아이디 찾기 or 회원가입 진행해주세요.');
						$('#userId').focus();
					}
				},
				error: function () {
					alert('관리자에게 문의하세요');
				}
			}); // end ajax
		}); // end idCheckBtn
		
		
		//# 이메일 직접입력 창
		$('#userEmail2').change(function() {
			let result = $('#userEmail2 option:selected').text();
			if (result == '직접입력') {
				$('.boxdirect').show();
			} else {
				$('.boxdirect').hide();
			}
		});

		let code = ''; // 메일 전송 인증번호 저장 변수
		
		// # 이메일 체크
		$('#mailCheckBtn').click(function() {
					let userEmail1 = $('#userEmail1').val();
					
					if (userEmail1 === '') {
						alert('이메일 입력은 필수 입니다.');
						return;
					}

					$.ajax({
							type : 'post',
							url : '<c:url value="/user/emailCheck" />',
							data : userEmail1,
							success : function(result) {
								if (result === 'ok') {
									//# 이메일 인증번호 전송
									openLoading();
									const email1 = $('#userEmail1').val();
									const email2 = $('#userEmail2').val();
									const email3 = $('#userEmail3').val();

									$('mailcheckbox').show();
									
									let result = $('#userEmail2 option:selected').text();
									if (result == '직접입력') {
										$.ajax({
												type : 'get',
												url : '<c:url value="/user/mailCheck?email=" />' + email1 + email3,
												success : function(data) {
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
												type : 'get',
												url : '<c:url value="/user/mailCheck?email=" />' + email1 + email2,
												success : function(data) {
													closeLoading();
													code = data;
													alert('인증번호가 전송되었습니다.');
													$('#mailcheckbox').show();
													$('.mail-check-input').attr('disabled',false);
													$('.mail-check-input').focus();
												}
											}); // end ajax
										}
									} else {
										alert('존재 하지 않는 이메일 입니다.\r회원가입 해주세요');
										return;
									}
								}
							}) // end ajax
				}); // end mailCheckBtn

		//# 이메일 인증번호 체크
		$('.mail-check-input').blur(
				function() {
					const inputCode = $(this).val(); //사용자가 입력한 인증번호 변수
					const $resultMsg = $('#mail-check-warn'); // span 태그 변수
					let userEmail1 = $('#userEmail1').val();
					const $findIdMsg = $('#findId-warn');

					if (inputCode === code) {
						$resultMsg.html('인증번호가 일치 합니다.');
						$('#mailCheckBtn').attr('disabled', true);
						$('#userEmail1').attr('readonly', true);
						$('#userEmail2').attr('readonly', true);
						$(this).attr('disabled', true);
						$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
						$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
						$('#updatePw').show();
					} else if (inputCode === '') {
						$resultMsg.html('인증번호를 입력해 주세요.');
					} else {
						$resultMsg.html('인증번호가 일치하지 않습니다. 확인해주세요');
						$resultMsg.focus();
					}
				}); // end mail-check-input
				
		
		// # 비밀번호 업데이트
		$('#updatePwBtn').click(function () {
			const userId = $('#userId').val();
			const userPw = $('#newUserPw').val();
			
			if($('#userId').val().trim() === ''){
				alert('아이디 입력은 필수 입니다.');
				$('#userId').focus();
				return;
			}
			if($('#userId').attr('readonly') !== 'readonly'){
				alert('아이디 체크는 필수 입니다.');
				$('#userId').focus();
				return;
			}
			if ($('#newUserPw').val().trim() === '') {
				alert('새로운 비밀번호 입력은 필수 입니다.');
				$('#userPw').focus();
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
			
			const userPwUpdate = {
				'userId' : userId,
				'userPw' : userPw
			};
			// ajax 시작
			$.ajax({
				type : 'post',
				url : '<c:url value="/user/userPwUpdate" />',
				data : JSON.stringify(userPwUpdate),
				dataType : 'text',
				contentType : 'application/json',
				success : function(result) {
					if(result == 'modifySuccess'){
						alert('비밀번호가 성공적으로 변경 되었습니다.');
						location.href = "<c:url value='/' />";
					}
				},
				error : function () {
					alert('관리자에게 문의하세요');
				}
				
			}) // end ajax
			
		}); // end idCheckBtn
		
		
	});// end jQuery
</script>



