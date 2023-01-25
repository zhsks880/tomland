<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../include/header.jsp"%>

   <section id="hero" class="d-flex align-items-center freeTable">

    <div class="container">
      <div class="row">
        <div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
          <div class="titlebox">
            <p>게시글 보기</p>
          </div>

          <!-- 보기 폼 -->
          <form id="formObj" method="post" action="<c:url value='/board/boardDelete' />">
			
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
              <input type="text" style="width: 90%; background: #f8f8f8;" class="form-control" value="${article.title}" name="title" readonly>
            </div>

            <div class="conform" style="margin-top: 30px;">
              <input value="내용: " style="border: 0px; width: 10%; background-color: white;" disabled>
              <textarea type="text" style="width: 90%; background: #f8f8f8; white-space: pre-line;" class="form-control" rows="10" name="content" readonly>${article.content}</textarea>
            </div>
            
            <br>
            <div class="writefoot">
            
            <c:if test="${login.userId == article.writer}">
              <button type="button" class="btn btn-primary" id="modBtn">수정</button>
              <button type="button" class="btn btn-danger" id="delBtn">삭제</button>
            </c:if>
              <button type="button" class="btn btn-info" id="listBtn">목록</button>
            </div>
            
          </form>

          <hr>
          
          <!-- 댓글 작성 영역 시작 : 로그인 하면 영역 있게 하고 안하면 없게 하기 -->
          <c:if test="${login != null}">
          <div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
            <form>
            <div class="profileList" style="height: 70px;">
            
              <textarea class="form-control" rows="3" name="reply" id="reply" style="width: 100%;"></textarea>
              
              <button class="btn" style="background: #2b8030; color: white; width: 20%; margin-left: 5px;" id="replyRegist">댓글등록</button>
            </div>
           </form>
          </div>
          </c:if>
          
          <!-- 댓글 보여주기 영역 시작  : 로그인한 사람과 rno 등록자 가 같으면 버튼 생성하기 / 프사: rno 등록자, 아이디: rno 등록자 -->
          <div id="replyList">
          <!-- 여기서 부터 비동기 처리 시작 -->
          <!--  <div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
            <div class="profileList" style="height: 70px;">
              <img src="${pageContext.request.contextPath}/user/display?fileLoca=${data.userFileLoca}&fileName=${data.userFileName}">
              <input value="${login.userId}" style="border: 0px; width: 15%; font-size: 15px;" disabled>
              <textarea class="form-control" rows="3" name="reply" style="width: 100%;"></textarea>
              <%-- <c:if test="${login.userId == rno.replyId}"></c:if> --%>
              <button class="btn" style="background: #2b8030; color: white; width: 10%; margin-left: 5px;">수정</button>
              <button class="btn" style="background: tomato; color: white; width: 10%; margin-left: 5px;">삭제</button>
            </div>
          </div>
          -->
         </div> 
			<button type="button" class="form-control" id="moreList">더보기 ▼</button>
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<script>
	
	//수정버튼 클릭
	$('#modBtn').click(function() {
		$('#formObj').attr({
			'method' : 'get',
			'action' : '<c:url value="/board/boardModify" />'
		});
		
		if(confirm('수정하러 가시겠습니까?') == true){
			$('#formObj').submit();
		} else {
			return false;
		}
	});// end modBtn
	
	//삭제 버튼 클릭
	$('#delBtn').click(function() {
		
		if(confirm('삭제 하시겠습니까?') == true){
			$('#formObj').submit();
		} else {
			return false;
		}
	});// end delBtn
	
	//목록 버튼 클릭
	$('#listBtn').click(function() {
		location.href= '${pageContext.request.contextPath}/board/boardList?pageNum=${p.pageNum}&cpp=${p.cpp}&keyword=${p.keyword}&condition=${p.condition}';
	});// end listBtn
	
	//메세지 출력
	const msg = '${msg}'
	if(msg === 'modify'){
		alert('글이 수정되었습니다.');
	}
	
	// 댓글 등록 : replyRegist
	$('#replyRegist').click(function() {
		
		const bno = '${article.bno}';
		const reply = $('#reply').val();
		const replyId = '${login.userId}';
		const replyPw = '${login.userPw}';
		const replyUploadPath = '${login.userUploadPath}';
		const replyFileLoca = '${login.userFileLoca}';
		const replyFileName = '${login.userFileName}';
		const replyFileRealName = '${login.userFileRealName}';

		if(reply === ''){
			alert('내용을 입력해 주세요~');
			return;
		}
		
		//ajax 에 들어갈 변수
		const replyUser = {
				'bno' : bno,
				'reply' : reply,
				'replyId' : replyId,
				'replyPw' : replyPw,
				'replyUploadPath' : replyUploadPath,
				'replyFileLoca' : replyFileLoca,
				'replyFileName' : replyFileName,
				'replyFileRealName' : replyFileRealName
		};
		
		// ajax 시작
		$.ajax({
			type : 'post',
			url : '<c:url value="/reply/replyRegist" />',
			data : JSON.stringify(replyUser),
			dataType : 'text',
			contentType : 'application/json',
			success : function(data) {
				//댓글버튼 등록 후 성공 시 처리
				$('#reply').val('');
				
				getList(1, true);
			},
			error : function() {
				alert('관리자에게 문의자');
			}
			
		}); //end ajax
		
	}); // end replyRegist
	
	
	
	//Start JQuery
	$(function () {
		// 댓글 처리를 위한 함수 와 변수 초기화
		let page= 1;
		let strAdd = '';
		
		getList(1, true); // true면 새로고침
		
		// getList 함수 설정
		function getList(pageNum, reset) {
			
			const bno = '${article.bno}';
			
			$.getJSON(
					'<c:url value="/reply/getList/" />' + bno + '/' + pageNum,
					function(data) {
						
						let total = data.total;	//컨트롤러에서 온 총 댓글 수
						let replyList = data.list;	//컨트롤러에서 온 총 댓글 리스트
						
						// insert, update, delete 작업 후 댓글 내용 초기화
						if(reset){
							strAdd = '';
							page = 1;
						}
						
						//더보기 버튼 활성화
						if(total <= page * 2){
							$('#moreList').css('display', 'none');
						} else {
							$('#moreList').css('background', '#5777ba');
							$('#moreList').css('color', 'white');
							$('#moreList').css('display', 'block');
						}
						
						// 응답 데이터의 길이가 0과 같거나 작으면 함수 종료
						if(replyList.length <= 0) return;
						
						// strAdd 안에 html 코드로 넣기(꺽쇠) : 중간에 넣으까?
						//<c:if test="${login.userId == replyList[i].replyId}"></c:if>
						for(let i=0; i<replyList.length; i++){
							strAdd +=
							`<div class="col-lg-10 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
						            <div class="profileList" style="height: 70px;">
						              <img src="${pageContext.request.contextPath}/reply/display1/`+ replyList[i].replyId +`">
						              <input value="` + replyList[i].replyId + `" style="border: 0px; width: 15%; font-size: 15px;" class="replyUser" id="replyUser" readonly>
						              <textarea class="form-control" rows="3" id="replyArea" name="reply" style="width: 100%; background-color: #f8f8f8;" readonly>` + replyList[i].reply + `</textarea>
						              <button class="btn" id="replyMod" style="background: #2b8030; color: white; width: 10%; margin-left: 5px;">수정</button>
						              <button class="btn" id="replyDel" style="background: tomato; color: white; width: 10%; margin-left: 5px;">삭제</button>
						              <input type="hidden" class="replyRno" id="replyRno" value="`+ replyList[i].rno +`">
						            </div>
						          </div>`;
							
						} // for 문 종료
						
						$('#replyList').html(strAdd);
						
					} // function(data) 종료
				); // end getJSON
		}; // end getList
		
		
		// # 더보기 버튼 활성 화시 처리
		$('#moreList').click(function() {
			
			getList(++page, false);
			
		}); // end moreList
		
		// # 댓글 수정버튼, 삭제 : getJSON 에서 생성되는거라 부모를 지정해서 사용한다
		$('#replyList').on('click', '#replyMod', function(e) {
			
			let userId = '${login.userId}';
			let replyId = $(this).siblings(".replyUser").val();
			
				if(userId === replyId){
					$(this)[0].parentNode.querySelector('#replyArea').removeAttribute('readonly');
					$(this)[0].parentNode.querySelector('#replyArea').style.backgroundColor = 'white';
					$(this).innerHTML = '수정하기';
					$(this).addClass('replyMod');
				} else {
					alert('본인댓글만 수정 가능합니다.');
				}

		}); // end replyList
		
		// # 댓글 수정 해서 보내기
		$('#replyList').on('click', '.replyMod', function(e) {
			
			if(confirm('댓글을 수정하시겠습니까?') == true){
				const reply = $('#replyArea').val();
				const replyId = $('#replyUser').val();
				const rno = $('#replyRno').val();
				
				if(reply === ''){
					alert('내용을 입력해주세요.');
					return;
				};
				
				const replyMod = {
					'reply' : reply,
					'replyId' : replyId,
					'rno' : rno
				};
				
				$.ajax({
					type : 'post',
					url : '<c:url value="/reply/update" />',
					data : JSON.stringify(replyMod),
					dataType : 'text',
					contentType : 'application/json',
					success : function(result) {
						if(result === 'modSuccess'){
							alert('수정이 완료 되었습니다.');
							$('#replyArea').attr('readonly', true);
							$('#replyArea').css('background-color', '#f8f8f8');
							$('#replyMod').text('수정');
							$('#replyMod').removeClass('replyMod');
							getList(1, true);
						}
					},
						error : function() {
							alert('관리자에게 문의');
						}
				});// end ajax
			} else {
				return false;
			}
		});// end replyList
		
		// # 댓글 삭제
		$('#replyList').on('click', '#replyDel', function() {
			
			let userId = '${login.userId}';
			let replyId = $(this).siblings(".replyUser").val();
			
				if(userId === replyId){
					
					if(confirm('댓글을 삭제 하시겠습니까?') == true){
						const rno = $(this).siblings(".replyRno").val(); 
						const replyDelete = {
							'rno' : rno,
							'replyId' : replyId
						};
						
						$.ajax({
							type : 'post',
							url : '<c:url value="/reply/delete" />',
							data : JSON.stringify(replyDelete),
							dateType : 'text',
							contentType : 'application/json',
							success : function(result) {
								if(result === 'delSuccess'){
									alert('정상 삭제 되었습니다.');
									getList(1, true);
								} else {
									alert('삭제 실패');
								}
								
							},
							error : function () {
								alert('관리자에게 문의');
							}
						});// end ajax
					} else {
						return false;
					}
				} else {
					alert('본인댓글만 삭제 가능합니다.');
					return;
				}
		});// end replyDel

		
	});//end jQuery


</script>

