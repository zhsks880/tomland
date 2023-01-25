<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<section id="hero" class="d-flex align-items-center freeTable">

	<div class="container regi">
		<div class="row">
			<div
				class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
				<div class="titlebox">
					<p>게시판등록</p>
				</div>

				<!-- 등록 폼 -->
				<form action="<c:url value='/board/boardWrite' />" id="formObj" method="post">
					<table>
						<tbody>
							<tr>
								<td class="t-writer">작성자:</td>
								<td><input class="form-control" name="writer" value="${login.userId}" style="background: #f8f8f8;" readonly></td>
							</tr>
							<tr>
								<td class="t-title">제목:</td>
								<td><input type="text" class="form-control" name="title"
									aria-describedby="sizing-addon2"></td>
							</tr>
							<tr>
								<td class="t-content">내용:</td>
								<td><textarea class="form-control" rows="10" name="content"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<div class="writefoot">
						<button type="button" class="btn btn-info" id="listBtn">목록</button>
						<button type="button" class="btn btn-primary" id="registBtn">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>

	//글 등록 버튼
	$('#registBtn').click(function() {
		
		if(confirm('등록 하시겠습니까?') == true){
			$('#formObj').submit();
		} else {
			return false;
		}
		
	});// end registBtn
	
	//글 목록 버튼
	$('#listBtn').click(function() {
		location.href= '${pageContext.request.contextPath}/board/boardList';
	});// end listBtn
</script>