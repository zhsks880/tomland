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

				<div class="title">
					<p style="font-weight: bold; font-size: 25px; text-align: left;">내물품
						등록</p>
					<hr>
				</div>
			</div>
			<!-- end col-lg-10 -->

			<!-- 왼쪽 : 등록 이미지 미리보기-->
			<div
				class="col-lg-5 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<div class="leftRegi" style="text-align: left;">
					<a href="">
						<p>등록 예시 화면</p>
					</a>

					<!-- 이미지 미리보기 출력 -->
					<div class="mainPic" id="mainPic">
						<p>※대표이미지</p>
						<img id="fileImg" src="">
					</div>
					<div class="contentPic1" id="contentPic1">
						<p>※상세이미지1</p>
						<img id="fileImg1" src="">
					</div>
					<div class="contentPic2" id="contentPic2">
						<p>※상세이미지2</p>
						<img id="fileImg2" src="">
					</div>
					<div class="contentPic3" id="contentPic3">
						<p>※상세이미지3</p>
						<img id="fileImg3" src="">
					</div>
					<div class="contentPic4" id="contentPic4">
						<p>※상세이미지4</p>
						<img id="fileImg4" src="">
					</div>
				</div>
			</div>
			<!-- end 왼쪽 div -->


			<!-- 오른 쪽 -->
			<div
				class="col-lg-5 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<div class="rightRegi" style="text-align: left;">
					<form action="<c:url value='/gamja/gamjaRegist' />" method="post"
						enctype="multipart/form-data" id="gamjaForm">
						<span>●상품명</span><input type="text" id="productName"
							name="pName" maxlength="25" class="form-control"
							placeholder="상품명을 입력"> 
							<span>●가격</span><span style="font-size: 13px; color:tomato;">&ensp;숫자만 입력하세요</span>
							<input type="text"
							id="productPrice" name="pPrice" maxlength="15"
							class="form-control" placeholder="가격입력" style="width: 50%;">
							<span>●상품상태</span>
						<select class="form" id="productCondition" name="pCondition">
							<option value="">선택</option>
							<option>신상품(미개봉)</option>
							<option>중고</option>
						</select> <br> 
						<span>●제조사</span><input type="text" id="productFrom"
							name="pFrom" maxlength="15" class="form-control"
							placeholder="제조회사 입력"> 
							<span>●브랜드</span><input
							type="text" id="productBrand" name="pBrand" maxlength="15"
							class="form-control" placeholder="브랜드명 입력"> 
							<span>●모델명</span><input
							type="text" id="productModel" name="pModel" maxlength="15"
							class="form-control" placeholder="브랜드명 입력"> 
							<span>●교환여부</span>
						<select class="form" id="productReturn" name="pReturn">
							<option value="">선택</option>
							<option>가능</option>
							<option>불가능</option>
						</select> <br> 
						<span>●거래방법</span> <select class="form"
							id="productTrade" name="pTrade">
							<option value="">선택</option>
							<option>직거래</option>
							<option>택배거래</option>
						</select> <br> 
						<span>●거래지역</span> <select class="form"
							id="productRegion" name="pRegion">
							<option value="">선택</option>
							<option>전국</option>
							<option>서울</option>
							<option>경기도</option>
							<option>지방</option>
							<option>상품상세설명기재</option>
						</select> <br> 
						
						<div>
							●대표이미지 : <input type="file" name="file" onchange="readURL(this);"><br>
						</div>
						<span>●상품상세설명</span>
						<textarea class="form-control" id="productDesc" name="pDesc"
							rows="10" name="content" style="margin-bottom: 10px;">
              			</textarea>
              			<input type="hidden" name="userNo" value="${login.userNo}">
              			<input type="hidden" name="userId" value="${login.userId}">
						
						<!-- 이미지 업로드 창 -->
						<div>
							●상세이미지1 : <input type="file" name="file" onchange="readURL1(this);"><br> 
							●상세이미지2 : <input type="file" name="file" onchange="readURL2(this);"><br>
							●상세이미지3 : <input type="file" name="file" onchange="readURL3(this);"><br> 
							●상세이미지4 : <input type="file" name="file" onchange="readURL4(this);"><br>
						</div>

						<button type="button" class="btn btn-primary" id="regiBtn" style="background: #edad53; color: black; border: 0px;">등록</button>
						<button type="button" class="btn btn-primary" style="background: tomato; color: black; border: 0px;">취소</button>

					</form>
				</div>
			</div>
			<!-- end 오른쪽 div -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container-->
</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>
	// # 자바 스크립트 파일 미리보기 기능
	const mainPic = document.getElementById('mainPic');
	const contentPic1 = document.getElementById('contentPic1');
	const contentPic2 = document.getElementById('contentPic2');
	const contentPic3 = document.getElementById('contentPic3');
	const contentPic4 = document.getElementById('contentPic4');
	mainPic.style.display = 'none';
	contentPic1.style.display = 'none';
	contentPic2.style.display = 'none';
	contentPic3.style.display = 'none';
	contentPic4.style.display = 'none';
	
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    let reader = new FileReader();
	    reader.readAsDataURL(input.files[0]);
	    $(".mainPic").css("display", "block");
	    reader.onload = function (event) {
	      $('#fileImg').attr("src", event.target.result);
	    }
	  }
	}; // end redURL
	function readURL1(input) {
	  if (input.files && input.files[0]) {
	    let reader = new FileReader();
	    reader.readAsDataURL(input.files[0]);
	    $(".contentPic1").css("display", "block");
	    reader.onload = function (event) {
	      $('#fileImg1').attr("src", event.target.result);
	    }
	  }
	}; // end redURL
	function readURL2(input) {
	  if (input.files && input.files[0]) {
	    let reader = new FileReader();
	    reader.readAsDataURL(input.files[0]);
	    $(".contentPic2").css("display", "block");
	    reader.onload = function (event) {
	      $('#fileImg2').attr("src", event.target.result);
	    }
	  }
	}; // end redURL
	function readURL3(input) {
	  if (input.files && input.files[0]) {
	    let reader = new FileReader();
	    reader.readAsDataURL(input.files[0]);
	    $(".contentPic3").css("display", "block");
	    reader.onload = function (event) {
	      $('#fileImg3').attr("src", event.target.result);
	    }
	  }
	}; // end redURL
	function readURL4(input) {
	  if (input.files && input.files[0]) {
	    let reader = new FileReader();
	    reader.readAsDataURL(input.files[0]);
	    $(".contentPic4").css("display", "block");
	    reader.onload = function (event) {
	      $('#fileImg4').attr("src", event.target.result);
	    }
	  }
	}; // end redURL
	

	//start JQUery
	$(function() {
		$('#regiBtn').click(function() {
			if(confirm('등록 하시겠습니까?') == true){
				$('#gamjaForm').submit();
			} else {
				return false;
			}
		});
	
	// # 가격 입력 숫자 및 콤마만
		//NullCheck
	function isEmpty(value) {
		if(value.length == 0 || value == null){
			return true;
		} else {
			return false;
		}
	}
		// Number check
	function isNumeric(value) {
		let regExp = /^[0-9]+$/g;
		return regExp.test(value);
	}
		//숫자 세자리 마다 콤마 추가
	function currencyFormatter(amount) {
		return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
	}
	$('#productPrice').on('focus', function() {
		let val = $('#productPrice').val();
		if(!isEmpty(val)){
			val = val.replace(/,/g,'');
			$('#productPrice').val(val);
		}
	});
	
	$('#productPrice').on('blur', function() {
		let val = $('#productPrice').val();
		if(!isEmpty(val) && isNumeric(val)){
			val = currencyFormatter(val);
			$('#productPrice').val(val);
		}
	}); // end 가격 입력 숫자 및 콤마

	}); // end JQuery

	


</script>