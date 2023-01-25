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
				<p>회원탈퇴</p>
				<hr>
			</div>
			<!-- 아이디 찾기 -->
			<div class="col-lg-8 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<p>회원가입 시 입력한 아이디를 입력 후 확인해주세요</p>
				<br>
				<!-- 이메일 -->
				<div class="userform">
					<form action="<c:url value='/user/delete' />" method='post' id="deleteForm">
					<div class="user1">					
						<input type="text" style="height: 100%; width: 50%;" id="userIdChk" name="userIdChk" class="form-control"
							placeholder="사용중인 아이디를 입력해주세요">
				
						<button type="button" style="height: 100%; width: 15%; background-color: #5777ba; border: 0px;"
							class="btn btn-primary" id="userDelBtn">회원탈퇴</button>
					</div>
					</form>
				</div>

			

			</div>

		</div>
		<!-- end row -->
	</div>

</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>


<script>
	
$(function () {
	
	$('#userDelBtn').click(function() {
		if(confirm('회원탈퇴를 하시겠습니까?') == true){
			$('#deleteForm').submit();
		} else {
			return false;
		}
	});// end userDelBtn
	
});// end JQuery	
	
	
</script>



