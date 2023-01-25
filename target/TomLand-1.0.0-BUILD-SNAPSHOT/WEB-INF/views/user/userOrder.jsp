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
				<p>주문하기</p>
				<hr>
			</div>
			<!-- 좌측 메뉴 -->
			<div
				class="col-lg-6 d-lg-flex flex-lg-column order-1 order-lg-2 regi"
				style="border-right: 1px solid rgb(206, 205, 205)">
				<!-- 탭 안쪽 -->
				<div class="tab-content">
					<form action="#" id="joinForm" method="post">
						<!-- 아이디 -->
						<div class="userform">
							<label>주문자 정보</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgId"
								style="color: tomato;">주문자 정보를 꼭 확인하세요</span>
							<div class="user1">
								<input type="text" class="form-control" value="ID:"
									style="width: 20%; height: 100%; text-align: center; border: 0px; background-color: white;"
									disabled> 
								<input type="text"
									style="height: 100%; width: 80%;" name="userId" id="userId"
									class="form-control" maxlength="12"
									value="${userInfo[0].userId}">
							</div>
						</div>

						<!-- 이름 -->
						<div class="userform">
							<div class="user1">
								<input type="text" class="form-control" value="성명:"
									style="width: 20%; height: 100%; text-align: center; border: 0px; background-color: white;"
									disabled> <input type="text"
									style="height: 100%; width: 80%;" name="userName" id="userName"
									class="form-control" placeholder="이름이 들어가요" maxlength="12"
									value="${userInfo[0].userName}" readonly>
							</div>
						</div>

						<!-- 휴대폰번호 -->
						<div class="userform">
							<div class="user1">
								<input type="text" class="form-control" value="연락처:"
									style="width: 20%; height: 100%; text-align: center; border: 0px; background-color: white;"
									disabled> <select class="phone1"
									style="width: 10%; border-radius: 10px; text-align: center;"
									id="userPhone1" name="userPhone1">
									<c:if test="${login == null}">
										<option value="" selected="selected">선택</option>
									</c:if>

									<c:if test="${login != null}">
										<option value="${userInfo[0].userPhone1}" selected="selected">${userInfo[0].userPhone1}</option>
									</c:if>
									<option>010</option>
									<option>011</option>
									<option>017</option>
								</select>&nbsp; 
								<input type="text" style="height: 100%; width: 35%;"
									class="form-control" maxlength="4" id="userPhone2"
									name="userPhone2" class="form-control"
									value="${userInfo[0].userPhone2}">&nbsp; 
									<input
									type="text" style="height: 100%; width: 35%;"
									class="form-control" id="userPhone3" name="userPhone3"
									class="form-control" placeholder="뒤4자리"
									value="${userInfo[0].userPhone3}" maxlength="4">
							</div>
						</div>

						<!-- 이메일 -->
						<div class="userform">
							<div class="user1">
								<input type="text" class="form-control" value="E-mail:"
									style="width: 20%; height: 100%; text-align: center; border: 0px; background-color: white;"
									disabled> 
									<input type="text"
									style="height: 100%; width: 50%;" id="userEmail1"
									name="userEmail1" class="form-control"
									value="${userInfo[0].userEmail1}">&nbsp; <select
									class="userEmail2" style="width: 35%; border-radius: 10px;"
									id="userEmail2" name="userEmail2">
									<c:if test="${login == null}">
										<option value="">선택</option>
									</c:if>

									<c:if test="${login != null}">
										<option value="${userInfo[0].userEmail2}">${userInfo[0].userEmail2}</option>
									</c:if>

									<option>@naver.com</option>
									<option>@gmail.com</option>
									<option>@hanmail.net</option>
									<option>@nate.com</option>
									<option>직접입력</option>
								</select>&nbsp;
							</div>

							<!-- 이메일 직접 입력 -->
							<div class="user1">
								<input type="text" class="form-control"
									style="margin-left: 60%; width: 40%;" id="boxdirect"
									name="boxdirect" placeholder="이메일 직접입력">
							</div>
						</div>

						<!-- 주소 -->
						<div class="userform">
							<label>주 소</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgPwchk"></span>
							<div class="user1" style="margin-bottom: 5px;">
								<input type="text" style="height: 100%; width: 30%;"
									name="userAddrZipnum" id="userAddrZipnum"
									value="${userInfo[0].userAddrZipnum}" class="form-control"
									readonly>&nbsp;
								<button type="button"
									style="height: 100%; width: 15%; background-color: #5777ba; border: 0px;"
									class="btn btn-primary" id="idCheckBtn"
									onclick="searchAddress()">주소찾기</button>
							</div>

							<div class="user1">
								<input type="text" style="height: 100%; width: 50%;"
									id="userAddrBasic" name="userAddrBasic" class="form-control"
									value="${userInfo[0].userAddrBasic}" maxlength="30">&nbsp;
								<input type="text" style="height: 100%; width: 50%;"
									id="userAddrDetail" name="userAddrDetail" class="form-control"
									value="${userInfo[0].userAddrDetail}" maxlength="30">&nbsp;
							</div>
						</div>

						<input type="button" value="회원정보로 주문하기"
							class="btn form-control tooltipstered" id="userOrderBtn"
							style="background-color: #57ba67; margin-top: 0; margin-bottom: 5px; height: 40px; color: white; border: 0px solid #5777ba; opacity: 0.8">
						<input type="button" value="신규배송지 입력하기"
							class="btn form-control tooltipstered" id="otherOrderBtn"
							style="background-color: #5777ba; margin-top: 0; margin-bottom: 5px; height: 40px; color: white; border: 0px solid #5777ba; opacity: 0.8">

					</form>

				</div>
				<!-- end tab-content -->
			</div>
			<!-- end 좌측 메뉴 -->



			<!-- 우측 메뉴 -->
			<div
				class="col-lg-6 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<div class="content">
					<form class="orderForm" id="orderForm">
						<label>상품 정보</label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="msgId"
							style="color: tomato;">상품 정보를 꼭 확인하세요</span>

						<table class="table table-hover">

							<thead class="bg-thead">
								<tr>
									<th>
										<!-- <input type="checkbox" class="prodAllCheck" checked> -->
									</th>
									<th class="prodGno">상품번호</th>
									<th class="prodName">상품정보</th>
									<th class="prodPrice">가격</th>
									<th class="prodUserid">판매자</th>
								</tr>
							</thead>

							<tbody>


									<c:if test="${order != null}">
										<tr>
											<td class="prodCheck">
											<input type="checkbox" class="individual_checkbox" name="checkBox" checked> 
											<%-- <input type="hidden" class="individual_bookCount" value="${order.bookCount}"> --%>
											<%-- <input type="hidden" class="individual_cartNo" value="${cart.cartNo}"> --%>
											<input type="hidden" class="individual_pPrice" value="${order.PPrice}">
											<input type="hidden" class="individual_gno" value="${order.gno}">
											<input type="hidden" class="individual_pName" value="${order.PName}">
											</td>

											<td class="prodGno">${order.gno}</td>

											<td class="prodName"><a href="<c:url value='/gamja/gamjaContent/${order.gno}' />">${order.PName}</a></td>

											<td class="prodPrice" name="prodPrice">${order.PPrice}원</td>

											<td class="prodUserid" name="prodUserid">${order.userId}님</td>
										</tr>
									</c:if>
		
								<c:if test="${order == null}">
								<tr>
										<td class="prodCheck"><input type="checkbox"
											name="checkbox"></td>

										<td class="prodGno"></td>

										<td class="prodName">주문가능한 상품이 없습니다</td>

										<td class="prodPrice"></td>

										<td class="prodUserid"></td>
									</tr>
								</c:if>

							</tbody>
						</table>
					</form>

					<div class="pocket" style="text-align: right; margin-left: 10px;">
						<span>상품금액:</span> <span class="totalprice"></span><span>원
							| </span> <span>총 금액: </span> <span class="finalTotalPrice"><strong></strong></span><span>원</span>
					</div>
					<button type="button" class="btn btn-warning" id="naverPayBtn">주문하기</button>
				</div>

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

<!-- 네이버 페이 api -->
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<script>
	
	// # msg 출력
/* 	const msg = '${msg}';
	if(msg === 'update'){
		alert('회원정보 수정이 완료 되었습니다.');
	}; // end msg 출력 */
		
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
						document.getElementById("userAddrZipnum").value = data.zonecode;
						document.getElementById("userAddrBasic").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("userAddrDetail").focus();
					}
				}).open();
	} // end 카카오주소찾기
	
	//Start JQuery
	$(function() {

		$("#boxdirect").hide(); // 메일 직접입력 감추기
		//# 이메일 직접입력 창
		$('#userEmail2').change(function() {
			let result = $('#userEmail2 option:selected').text();
			if (result == '직접입력') {
				$('.boxdirect').show();
			} else {
				$('.boxdirect').hide();
			}
		});
	
	// # 장바구니 금액 처리
	function setTotalInfo() {
		
		let totalPrice = 0;
		let finalTotalPrice = 0;
		
		$('.prodCheck').each(function(index, element) {
			if($(element).find('.individual_checkbox').is(':checked') === true){
				//총 가격
				totalPrice += parseFloat($(element).find('.individual_pPrice').val().replace(/,/g,''));
			}
		});
		finalTotalPrice += totalPrice;
		//총 가격
		$('.totalprice').text(totalPrice.toLocaleString());
		
		//최종 가격
		$('.finalTotalPrice').text(totalPrice.toLocaleString());
	};// end 장바구니 총금액
	
	setTotalInfo();
	
	// # 체크 박스에 따른 가격 변화
	$('.individual_checkbox').on('change', function() {
		setTotalInfo($('.prodCheck'));
	});// end individual_checkbox

	
	// # 회원정보로 주문하기
	$('#userOrderBtn').click(function() {
		
		$("#userId").attr("readonly", true);
		$("#userId").css("background", "#e0e0e0");
		$("#userName").attr("readonly", true);
		$("#userName").css("background", "#e0e0e0");
		$("#userPhone1").attr("readonly", true);
		$("#userPhone1").css("background", "#e0e0e0");
		$('#userPhone1').attr('onFocus',
		'this.initialSelect = this.selectedIndex');
		$('#userPhone1').attr('onChange',
		'this.selectedIndex = this.initialSelect');
		$("#userPhone2").attr("readonly", true);
		$("#userPhone2").css("background", "#e0e0e0");
		$("#userPhone3").attr("readonly", true);
		$("#userPhone3").css("background", "#e0e0e0");
		$("#userEmail1").attr("readonly", true);
		$("#userEmail1").css("background", "#e0e0e0");
		$("#userEmail2").attr("readonly", true);
		$("#userEmail2").css("background", "#e0e0e0");
		$('#userEmail2').attr('onFocus',
		'this.initialSelect = this.selectedIndex');
		$('#userEmail2').attr('onChange',
		'this.selectedIndex = this.initialSelect');
		$("#userAddrZipnum").attr("readonly", true);
		$("#userAddrZipnum").css("background", "#e0e0e0");
		$("#userAddrBasic").attr("readonly", true);
		$("#userAddrBasic").css("background", "#e0e0e0");
		$("#userAddrDetail").attr("readonly", true);
		$("#userAddrDetail").css("background", "#e0e0e0");
		$("#otherOrderBtn").attr('disabled', true);
		$('#idCheckBtn').attr('disabled', true);
		
	});// end userOrderBtn
	
	// # 신규배송지 입력하기
	$('#otherOrderBtn').click(function () {
		
		$("#userId").val('');
		$("#userName").val('');
		$("#userName").attr('readonly', false);
		$("#userPhone1").val('');
		$("#userPhone2").val('');
		$("#userPhone3").val('');
		$("#userEmail1").val('');
		$("#userEmail2").val('');
		$("#userAddrZipnum").val('');
		$("#userAddrZipnum").attr("readonly", true);
		$("#userAddrZipnum").css("background", "#e0e0e0");
		$("#userAddrBasic").val('');
		$("#userAddrDetail").val('');
		$("#userOrderBtn").attr('disabled', true);
		
	});// end otherOrderBtn
	
	});// end jQuery
	
	// # 새로고침 함수
	function refresh(){
		location.reload();
	}; // end 새로고침
	
	// # 네이버 페이 호출
	 var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });
	
    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");
    
    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "test1234",
          "merchantPayKey": "merchantPayKey",
          "productName": "TomLand",
          "totalPayAmount": "1000",
          "taxScopeAmount": "1000",
          "taxExScopeAmount": "0",
          "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
        });
    });
	
	
	
</script>



