<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Welcome to Tom`s Land</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="apple-touch-icon">
  
  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
  
  <!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/resources/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
</script>

<!-- chart js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  
<!-- AOS -->  
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>


</head>

<body>

<section id="hero" class="d-flex align-items-center freeTable">

	<div class="container">
		<div class="row">
			<div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<form id="qnaAnswer" name="qnaAnswer" method="post">
				<p style="text-align: left;" name="qnaWriter" id="qnaWriter">문의자 : ${qnaAnswer[0].writer}<p>
				<p style="text-align: left;" name="qnaContent" id="qnaContent" style="white-space: pre-line;">문의내용 : ${qnaAnswer[0].content}</p>
				<p style="text-align: left;">답변</p>
				<textarea class="form-control" id="qnaReply" rows="5" name="qnaReply" style="white-space: pre-line;"></textarea>
				<div style="color: tomato; font-size: 13px;" id="textareaCnt" name="textareaCnt">글자수제한(0 / 500)</div>
				<input type="hidden" name="qnaReplyGno" id="qnaReplyGno" value="${qnaAnswer[0].gno}">
				<input type="hidden" name="qnaReplyBno" id="qnaReplyBno" value="${qnaAnswer[0].bno}">
				<input type="hidden" name="qnaSeller" id="qnaSeller" value="${login.userId}">
				<button type="button" class="btn btn-primary search-btn" style="width: 25%; background-color: #edad53; border: 0px;" id="answerBtn">문의답변하기</button>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- End Hero -->

</body>



<script>

$(function () {
	
	$('#answerBtn').click(function () {
		
		const qnaReply = $('#qnaReply').val();
		const qnaReplyGno = $('#qnaReplyGno').val();
		const qnaReplyBno = $('#qnaReplyBno').val();
		const qnaSeller = $('#qnaSeller').val();
		
		if(confirm('답변을 등록하겠습니까?') == true){
			
			if(qnaReply === ''){
				alert('답변내용을 입력해주세요.');
				return;
			}
			
			const replyVo = {
				'qnaReply' : qnaReply,
				'qnaReplyGno' : qnaReplyGno,
				'qnaReplyBno' : qnaReplyBno,
				'qnaSeller' : qnaSeller
			};
			
			$.ajax({
				type : 'post',
				url : '<c:url value='/gamjareply/qnaRegist' />',
				data : JSON.stringify(replyVo),
				dataType : 'text',
				contentType : 'application/json',
				success : function(data){
					if(data === 'answer'){
						alert('답변등록이 완료 되었습니다.');
					}
					opener.document.location.reload();
					self.close();
				},
				error : function(){
					alert('관리자에게 문의해주세요');
				}
				
				
			});// end ajax
			
		/* 	$('#qnaAnswer').submit();
			setTimeout(function () {
				window.close();
			}, 100); */
		} else {
			return false;
		}
	});//end answerBtn
	
	//textarea 글자수 제한
	$('#qnaReply').on('keyup', function () {
		$('#textareaCnt').html("글자수제한("+$(this).val().length+" / 300)");
		if($(this).val().length > 300){
			$(this).val($(this).val().substring(0, 300));
			$('#textareaCnt').html("글자수제한(300 / 300)");
		}
	}); // end textarea 글자수 제한
	
	
});// end jQuery
	


</script>