<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>

<section id="hero" class="d-flex align-items-center freeTable">

	<div class="container">
		<div class="row">
			<div class="col-lg-12 d-lg-flex flex-lg-column order-1 order-lg-2">
				<div class="titlebox">
					<p>자유게시판</p>
				</div>

				<!-- 검색 창 -->
				<form action="<c:url value='/board/boardList' />">
					<div class="search-wrap">
						<select class="search-select" id="condition" name="condition">
							<option value="title" ${param.condition == 'title' ? 'selected' : ''}>제목</option>
							<option value="content" ${param.condition == 'content' ? 'selected' : ''}>내용</option>
							<option value="writer" ${param.condition == 'writer' ? 'selected' : ''}>작성자</option>
							<option value="titleContent" ${param.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
						</select> 
						<input type="text" name="keyword" id="keywordInput" placeholder="검색어">
						<button type="submit" class="btn btn-primary search-btn" id="searchBtn" style="background-color: #5777ba;">검색</button>
					</div>
				</form>

				<!--게시글 테이블-->
				<table class="table table-hover">
					<thead class="bg-thead">
						<tr>
							<th class="b_rn">No.</th>
							<th class="b_Title">제목</th>
							<th class="b_Writer">작성자</th>
							<th class="b_Regdate">작성일</th>
							<th class="b_like">조회수</th>
						</tr>
					</thead>
					
					<!-- 게시글 반복문으로 표현 -->
					<tbody>
						<c:forEach var="vo" items="${boardList}">
						<tr>
							<td class="b_bno">${vo.rn}</td>
							<td class="b_Title"><a href="<c:url value='/board/boardContent/${vo.bno}${pc.makeURI(pc.paging.pageNum)}' />">${vo.title}</a>
								<!-- reply count 하고나서 열기 -->
								<c:if test="${vo.replyCount ne 0}">&ensp;
								<small style="color: tomato">[${vo.replyCount}]</small></c:if>
							</td>
							<td class="b_Writer">${vo.writer}</td>
							<td class="b_Regdate"><fmt:formatDate value="${vo.regDate}" pattern="yy년MM월dd일"/> </td>
							<td class="b_like">${vo.viewCount}</td>
						</tr>
					</c:forEach>	
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
				<button type="button" class="btn btn-primary search-btn" style="width: 8%; background-color: #5777ba;" id="reg-btn">글쓰기</button>
			</div>
		</div>
	</div>

</section>
<!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>

	//글쓰기 버튼 클릭
	$('#reg-btn').click(function() {
		
		const userId = '${login.userId}';
		if(userId === ''){
			alert('로그인 해야 이용 가능한 서비스입니다.');
		} else {
			location.href = '${pageContext.request.contextPath}/board/boardWrite';
		}
	});
	
	//메세지 출력
	const msg = '${msg}';
	if(msg === 'delete'){
		alert('삭제가 완료 되었습니다.');
	}
	
	
	// JQUery start
	$(function () {
		
		//페이지네이션 버튼을 데이터화 시키기
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			//클릭하는 data-pagenum 값을 변수 저장
			const value = $(this).data('pagenum');
			//클릭 값으로 페이지네이션 폼의 양식을 변경
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		}); //end pagination
		
		
		
	});//end jQuery
	


</script>