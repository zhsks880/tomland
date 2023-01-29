<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>

  <section id="hero" class="d-flex align-items-center freeTable">

    <div class="container">
      <div class="row">
        <div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
          <div class="titlebox">
            <p>게시글 수정</p>
          </div>

          <!-- 보기 폼 -->
          <form id="formObj" method="post" action="<c:url value='/board/boardModify' />">
          
			<input type="hidden" value="${article.bno}" name="bno">
            
            <div class="conform">
              <input value="작성자: " style="border: 0px; width: 10%; background-color: white;" disabled>
              <input type="text" style="width: 45%; background: #f8f8f8;" class="form-control" value="${article.writer}" name="writer" readonly>
              <!-- update 유무에 따른 수정일과 등록일 표시 -->
              <c:if test="${article.updateDate == null}">
              <input value="등록일: " style="border: 0px; width: 10%; margin-left: 10%; background-color: white; margin-left: 10%;" disabled>
              <input type="text" style="width: 25%; background: #f8f8f8;" class="form-control" value="<fmt:formatDate value="${article.regDate}" pattern="yy년MM월dd일"/>" readonly>
              </c:if>
              
              <c:if test="${article.updateDate != null}">
              <input value="수정일: " style="border: 0px; width: 10%; margin-left: 10%; background-color: white; margin-left: 10%;" disabled>
              <input type="text" style="width: 25%; background: #f8f8f8;" class="form-control" value="<fmt:formatDate value="${article.updateDate}" pattern="yy년MM월dd일"/>" readonly>
              </c:if>
            </div>

            <div class="conform" style="margin-top: 30px;">
              <input value="제목: " style="border: 0px; width: 10%; background-color: white;" disabled>
              <input type="text" style="width: 90%;" class="form-control" name="title" value="${article.title}">
            </div>

            <div class="conform" style="margin-top: 30px;">
              <input value="내용: " style="border: 0px; width: 10%; background-color: white;" disabled>
              <textarea type="text" style="width: 90%; white-space: pre-line;" class="form-control" rows="10" name="content" id="textInput">${article.content}</textarea>
            </div>
            <div style="color: tomato; font-size: 13px;" id="textareaCnt">글자수제한(0 / 900)</div>
            <br>
            <div class="writefoot">
              <button type="button" id="modBtn" class="btn btn-primary">수정</button>
              <button type="button" id="listBtn" class="btn btn-info">목록</button>
            </div>
          </form>

        </div>
      </div>
    </div>

  </section><!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>
	
	//수정버튼 클릭
	$('#modBtn').click(function() {
		
		if(confirm('수정 하시겠습니까?') == true){
			$('#formObj').submit();
		} else {
			return false;
		}
	}); // end modBtn
	
	//목록 버튼 클릭
	$('#listBtn').click(function() {
		window.history.back();
	});// end listBtn
	
	//Start JQuery
	$(function () {
		//textarea 글자수 제한
		$('#textInput').on('keyup', function () {
			$('#textareaCnt').html("글자수제한("+$(this).val().length+" / 900)");
			if($(this).val().length > 900){
				$(this).val($(this).val().substring(0, 900));
				$('#textareaCnt').html("글자수제한(900 / 900)");
			}
		});
		
		
	}); //end jQuery

</script>