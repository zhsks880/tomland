<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>

  <section id="hero" class="d-flex align-items-center freeTable">

    <div class="container regi">
      <div class="row">
      
        <!-- 좌측 폼: userupload 사진 영역 -->
        <div class="col-lg-2 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
          <div class="fileDiv">
          	<img id="fileImg" src="${pageContext.request.contextPath}/resources/img/heart.png">
          </div>
        </div>

        <!-- 우측 메뉴 -->
        <div class="col-lg-6 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
          <h4 style="text-align: left;">오늘의 게시물 작성</h4>
          <div class="user1">
            <div>
            <c:if test="${login == null}">
            	<img src="${pageContext.request.contextPath}/resources/img/profile.png" alt="프로필사진" style="width: 50px; height: 50px;">
            </c:if>
            <c:if test="${login != null}">
            	<img src="${pageContext.request.contextPath}/user/display?fileLoca=${data.userFileLoca}&fileName=${data.userFileName}" alt="프로필사진" style="width: 50px; height: 50px;">
            </c:if>
            </div>
            <div style="width: 100%;">
              <textarea name="content" id="content" rows="2" style="width: 100%;" class="form-control" placeholder="오늘의생각을 적어주세요"></textarea>
              <div class="reply-group">
                <div class="filebox user2" style="margin-top: 5px;">
                  <label for="file">이미지업로드</label>
                  <input type="file" name="file" id="file" onchange="readURL(this);">
                  <button type="button" class="right btn" id="uploadBtn" style="background-color: #5777ba; color: white;">게시</button>
                </div>
              </div>
            </div>
          </div> <!--end 등록 폼 -->
          
          <!-- 보여주기 폼 -->
          <div id="contentDiv">
          	<!-- getJSON 시작 -->            
          </div>

        </div><!-- end 우측메뉴 -->

      </div>
    </div>

  </section><!-- End Hero -->

<%@ include file="../include/footer.jsp"%>

<!-- 모달 -->
	<div class="modal fade" id="snsModal" role="dialog">
			<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body row">
					<div class="modal-img col-sm-7 col-xs-5" >
						<img src="../resources/img/img_ready.png" id="snsImg" width="100%">
					</div>
					<div class="modal-con col-sm-5 col-xs-3">
						<div class="modal-inner">
						<div class="profile">
							<img src="../resources/img/profile.png" id="snsPro" width="15%">
						</div>
						<div class="title user2">
							<p id="snsWriter" style="color: #5777ba; margin-bottom: 1px;">테스트</p>
							<small id="snsRegdate" style="color: tomato;">21시간전</small>
						</div>
						<div class="content-inner">
							<p id="snsContent">삶이 우리를 끝없이 시험하기에 고어텍스는 한계를 테스트합니다</p>
						</div>
						
						<!-- reply 댓글 입력 -->
						<div class="link-inner" style="border-top: 1px solid">
						 <!-- <a href="##" id="delBtn"><i class="glyphicon glyphicon-share-alt"></i>공유하기</a> -->
						 <!-- <a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a> -->
							<form>
							<a href="#" id="comment"><i class="bi bi-chat-right-dots"></i>댓글달기</a>
							<input type="text" id="snsReply" name="snsReply">
							</form> 
						</div>
						
						<!-- reply 댓글 보여주기 : getJSON -->
						
						<div id="snsReplyList">
						<!-- getJSON 시작 -->
						</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<script>

/* // # msg 출력
const msg = '${msg}';
if(msg === 'success'){
	alert('등록이 완료 되었습니다.');
}; // end msg 출력 */

// # readURL함수 : 이미지 미리보기 기능
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.readAsDataURL(input.files[0]);

		$(".fileDiv").css("display", "block");

		reader.onload = function(event) {
			$('#fileImg').attr("src", event.target.result);
			console.log(event.target)
		}
	}
}; // end redURL


// start JQuery	
$(function() {
	
	let bno;
	
	// # 페이지 진입 시 초기화 함수
	let str = '';
	let page = 1;
	let isFinish = false;
	
	// #promise 방식 : .done or .fail
	getListLike(true).done(getList)
	.fail(function(error) {
		console.log(error);
	});
	
	// # getListLike 함수: 게시판 진입 시 각 회원의 좋아요 게시물 목록 (isReset의 출처)
	function getListLike(isReset) {
		let deferred = $.Deferred();
		const userId = '${login.userId}';
		
		if(userId !== ''){
			$.ajax({
				type : 'post',
				url : '<c:url value="/sns/listLike" />',
				data : userId,
				contentType : 'application/json',
				success : function(result) {
					if(isReset) deferred.resolve(result, page, true);
					else deferred.resolve(result, page, false);
				},
				error : function() {
					console.log('getListLike 에러남')	;
					deferred.rejected();
				}
			});// end ajax
		} else {
			if(isReset) deferred.resolve(null, page, true);
			else deferred.resolve(null, page, false);
		}
		return deferred.promise();
	}; // end getListLike
	
	
	// # getList 함수
	function getList(likeList, page, reset) {	
		console.log('page: ' + page);
		console.log('reset: ' + reset);
		console.log('좋아요 리스트: ' + likeList);

		if(reset === true){
			str = '';
		}
		
		$.getJSON(
				'<c:url value="/sns/getList?pageNum=' + page + '" />',
				function(list){
				
					if(list.length === 0) isFinish = true;
					
					for(let i=0; i<list.length; i++){
						str +=
							`<div class="title-inner user1">
				              <div class="profile">
				                <img src="${pageContext.request.contextPath}/sns/display1?profileFileLoca=` + list[i].profileFileLoca + `&profileFIleName=` + list[i].profileFileName +`" style="width: 50px; height: 50px;">
				              </div>
				              <div class="title">
				                <p style="text-align: left; color: #5777ba; margin-bottom: 0px;">` + list[i].writer + `</p>
				                <small style="color: tomato;">` + timeStamp(list[i].regDate) + `</small>
				              </div>
				            </div>
				            <!-- 내용 영역 -->
				            <div class="content-inner">
				              <p>` + (list[i].content === null ? '' : list[i].content) + `</p>
				            </div>
				            <!-- 이미지 영역 -->
				            <div class="image-inner">
				              <a href="` + list[i].bno + `">
				                <img src="${pageContext.request.contextPath}/sns/display?fileLoca=` + list[i].fileLoca + `&fileName=` + list[i].fileName + `">
				              </a>
				            </div>
				            <!-- 좋아요 -->
				            <div class="like-inner">
				              <img src="${pageContext.request.contextPath}/resources/img/like.png" style="margin-left: 5px;"><span>` + list[i].likeCnt + `</span>
				            </div>
				            
				            <div class="link-inner">`;
				            	if(likeList != null){
				            		if(likeList.includes(list[i].bno)){
					            		str +=`<a href="` + list[i].bno + `" id="likeBtn"><img src="${pageContext.request.contextPath}/resources/img/heart.png">좋아요</a>`
				            		} else {
					            		str +=`<a href="` + list[i].bno + `" id="likeBtn"><img src="${pageContext.request.contextPath}/resources/img/unheart.png">좋아요</a>`
				            		}	
				            	} else {
				            		str +=`<a href="` + list[i].bno + `" id="likeBtn"><img src="${pageContext.request.contextPath}/resources/img/unheart.png">좋아요</a>`
				            	}
				            	str += `				              
				              <a href="` + list[i].bno + `" id="comment"><i class="bi bi-chat-right-dots">댓글달기</i></a>
				              <a href="` + list[i].bno + `" id="delBtn"><i class="bi bi-file-x">삭제하기</i></a>
				            </div>`;
						
					} //end for
					$('#contentDiv').html(str);
				}// end list
			);// end JSON
	}; // end getList
		
	// # timeStamp :날짜 처리 함수 : 함수를 만들어 두고 위에서 불러서 작성일 및 시간 처리
	function timeStamp(millis) {
		const date = new Date();	//현재 날짜
		//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
		const gap = date.getTime() - millis;
		
		let time;
		if(gap < 60 * 60 * 24* 1000){
			if(gap < 60 * 60 * 1000){
				time = '방금 전';	
			} else {
				time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
			}
		} else {
			const regDate = new Date(millis);
			const year = regDate.getFullYear();
			const month = regDate.getMonth() + 1;
			const day = regDate.getDate();
			
			time = year + '년' + month + '월' + day + '일';
		}
		return time;
	}; // end timeStamp
	
	// # snsGetList 함수 설정
	function snsGetList(pageNum, reset) {
		bno = $(this).attr('href');
		
		$.getJSON(
			'<c:url value="/sns/getDetail/" />' + bno,
			function(data){
				console.log(data);
				
				const src = '${pageContext.request.contextPath}/sns/display?fileLoca=' + data.fileLoca + '&fileName=' + data.fileName;
				const profile = '${pageContext.request.contextPath}/sns/display1?profileFileLoca=' + data.profileFileLoca + '&profileFIleName=' + data.profileFileName;
				let bno = data.bno;
				$('#snsImg').attr('src', src);
				$('#snsPro').attr('src', profile);
				$('#snsWriter').html(data.writer);
				$('#snsRegdate').html(timeStamp(data.regDate));
				$('#snsContent').html(data.content);
				
				$('#snsModal').modal('show');
								
				// # snsReply/getList 시작					
				$.getJSON(
					'<c:url value="/snsReply/getList/" />' + bno,
					function(data){
						console.log('getSNS bno : ' + bno);
						let snsTotal = data.total;
						let snsReplyList = data.list;
						let snsStr = '';
						
						console.log('snsReplyList길이: '+ snsReplyList.length);
						//더보기 버튼 활성화
						//if(snsTotal <= snsPage * 3){
							
						//}
						if(snsReplyList.length <= 0){
							snsStr = '';
							return;
						} else {
							for(let i=0; i<snsReplyList.length; i++){
							snsStr +=
								`<div class="link-inner">
								<img src="${pageContext.request.contextPath}/snsReply/display/`+ snsReplyList[i].snsWriter +`" width="20%">
								<input value="` + snsReplyList[i].snsReply + `" class="form-control" style="background: #f8f8f8;" readonly>
								</div>`;
							}; // for문 종료
							$('#snsReplyList').html(snsStr);
						}			
					}
				); // end getJSON
			}
		); // end getJSON
	}; // end snsGetList
	
	
	// # 상세보기 처리(모달창 열기)
	$('#contentDiv').on('click', '.image-inner a, .link-inner #comment', function(e) {
		e.preventDefault();

		bno = $(this).attr('href');
				
		$.getJSON(
			'<c:url value="/sns/getDetail/" />' + bno,
			function(data){
				console.log(data);
				
				const src = '${pageContext.request.contextPath}/sns/display?fileLoca=' + data.fileLoca + '&fileName=' + data.fileName;
				const profile = '${pageContext.request.contextPath}/sns/display1?profileFileLoca=' + data.profileFileLoca + '&profileFIleName=' + data.profileFileName;
				let bno = data.bno;
				$('#snsImg').attr('src', src);
				$('#snsPro').attr('src', profile);
				$('#snsWriter').html(data.writer);
				$('#snsRegdate').html(timeStamp(data.regDate));
				$('#snsContent').html(data.content);
				
				$('#snsModal').modal('show');

				
				// # snsReply/getList 시작					
				$.getJSON(
					'<c:url value="/snsReply/getList/" />' + bno,
					function (data){
						console.log('getSNS bno : ' + bno);
						let snsTotal = data.total;
						let snsReplyList = data.list;
						let snsStr = '';
						
						console.log('snsReplyList길이: '+ snsReplyList.length);
						//더보기 버튼 활성화
						//if(snsTotal <= snsPage * 3){
							
						//}
						if(snsReplyList.length <= 0){
							$('#snsReplyList').html('');
							return;
						}
						
						for(let i=0; i<snsReplyList.length; i++){
						snsStr +=
							`<div class="link-inner">
							<img src="${pageContext.request.contextPath}/snsReply/display/`+ snsReplyList[i].snsWriter +`" style="width: 15%; height: 15%;">
							<input type="hidden" class="snsWriter" value="`+ snsReplyList[i].snsWriter +`">
							<input value="` + snsReplyList[i].snsReply + `" class="form-control" style="background: #f8f8f8;" readonly>
							<input type="hidden" class="rno" name="rno" value="` + snsReplyList[i].rno +`">
							<button type="button" class="right btn" id="replyDelBtn" style="background-color: pink; color: white;">삭제</button>
							</div>`;
						}; // for문 종료
						$('#snsReplyList').html(snsStr);
					}
				); // end getJSON
				
			}
		); // end getJSON
	});// end 상세보기
	
	// # 새로고침 함수
	function refresh(){
		location.reload();
	}; // end 새로고침
	
	// # sns 댓글 달기
	$('#comment').click(function snsRegi() {
		
		const snsReply = $('#snsReply').val();
		const snsWriter = '${login.userId}';
		const fileLoca = '${login.userFileLoca}';
		const uploadPath = '${login.userUploadPath}';
		const fileName = '${login.userFileName}';
		const fileRealName = '${login.userFileRealName}';
		
		if(snsReply === ''){
			alert('내용을 입력해주세요~');
			return;
		};
		if(snsWriter === ''){
			alert('로그인이 필요한 서비스입니다.');
			$('#snsReply').val('');
			return;
		};
		
		const snsReplyUser = {
			'bno' : bno,
			'snsReply' : snsReply,
			'snsWriter' : snsWriter,
			'fileLoca' : fileLoca,
			'uploadPath' : uploadPath,
			'fileName' : fileName,
			'fileRealName' : fileRealName
		};
		
		$.ajax({
			type : 'post',
			url : '<c:url value="/snsReply/replyRegist" />',
			data : JSON.stringify(snsReplyUser),
			dataType : 'text',
			contentType : 'application/json',
			success : function(data) {
				if(data == 'regSuccess'){
					alert('댓글이 등록되었습니다');
					$('#snsReply').val('');
					refresh();
				}
			},
			error : function() {
				alert('관리자에게 문의하라!');
			}
		});// end ajax
	});// end sns 댓글 달기
	
	// sns 댓글 삭제(bno rno)
	$('#snsReplyList').on('click', '.link-inner button, #replyDelBtn', function() {
		let rno = $(this).siblings(".rno").val();
		let snsWriter = $(this).siblings(".snsWriter").val();
		let userId = '${login.userId}';
		console.log('댓글 rno ' + rno);
		console.log('댓글 bno ' + bno);
		console.log('댓글 남자' + snsWriter);
		console.log('댓글 남자' + userId);
		
		if(snsWriter === userId){
			
			const snsReplyNo = {
					'bno' : bno,
					'snsWriter' : snsWriter,
					'rno' : rno
			};
			
			$.ajax({
				type : 'post',
				url : '<c:url value="/snsReply/delete" />',
				data : JSON.stringify(snsReplyNo),
				dataType : 'text',
				contentType : 'application/json',
				success : function(data) {
					if(data == 'delSuccess'){
						alert('댓글이 삭제되었습니다');
						refresh();
					}
					
				},
				error : function() {
					alert('관리자에게 문의하라!');
				}
			})// end ajax
			
		} else {
			alert('내 댓글만 삭제 되요.');
			return;
		}

	});// end sns 댓글 삭제

	

	
	// # 삭제 처리
	$('#contentDiv').on('click', '.link-inner #delBtn', function(e) {
		e.preventDefault();
		confirm('삭제 하시겠습니까??');
		
		const bno = $(this).attr('href');
		
		$.ajax({
			url : '<c:url value="/sns/delete" />',
			type : 'post',
			data : bno,
			contentType : 'application/json',
			dataType : 'text',
			success : function(result) {
				if(result === 'noAuth'){
					alert('내글만 삭제 가능합니다.');
				} else if (result === 'fail'){
					alert('사진이 없는데 삭제를 시도했다!! 관리자에게 문의!');
				} else {
					alert('게시물이 삭제 되었습니다');
					getListLike(true).done(getList);
				}			
			},
			error : function() {
				alert('관리자에게 문의하세요');
			}
		}); // end ajax
	}); // end 삭제
	
	
	// # 게시 버튼 클릭 이벤트
	$('#uploadBtn').click(function() {
		regist();	//등록 함수 호출
	});// end uploadBtn

	// # regist : 등록 담당 함수
	function regist() {
		//userid 변수 값 저장
		const userId = '${login.userId}';
		//이미지 파일만 받기 위해 준비
		let file = $('#file').val();
		file = file.slice(file.indexOf('.') + 1).toLowerCase();
		
		if(file != 'jpg' && file !== 'jpeg' && file !== 'jfif' && file !== 'gif' && file !== 'bmp' && file !== 'png' && file !== 'tif' && file !== 'bpg'){
			alert('이미지 파일만 등록 가능합니다');
			$('#file').val('');
			$('.fileDiv').css('display', 'none');
			return;
		} else if(userId === ''){
			alert('로그인이 필요한 서비스 입니다.');
			$('.fileDiv').css('display', 'none');
			return;
		}
		//FormData 로 만들어서 ajax로 컨트롤러로 보내기
		const formData = new FormData();
		const data = $('#file');
		console.log('폼데이터: ' + formData, '||| data: ' + data, '||| data의 0번 인덱스: ' + data[0].files );
		
		formData.append('file', data[0].files[0]);
		const content = $('#content').val();
		formData.append('content', content);
		
		$.ajax({
			url : '<c:url value="/sns/upload" />',
			type : 'post',
			data : formData,
			contentType : false,	//false로 해야 multipart로 날아감
			processData : false,
			success : function (result) {
				if(result === 'success'){
					alert('오늘의 생각이 등록되었습니다.');
					$('#file').val('');
					$('#content').val('');
					$('.fileDiv').css('display', 'none');
					getListLike(true).done(getList);
				}
			},
			error : function() {
				alert('관리자에게 문의 하세요');
			}
		}); // end ajax
	}; //end 등록하기
	
	
	// # 좋아요 하기
	$('#contentDiv').on('click', '.link-inner #likeBtn', function(e) {
		e.preventDefault();
		
		if(e.target.matches('img')){
			$('#likeBtn').click();
			return;
		}
		
		const bno = $(this).attr('href');
		const id = '${login.userId}';
		
		if(id === ''){
			alert('로그인이 필요한 서비스 입니다.');
			return;
		}
		
		$.ajax({
			url : '<c:url value="/sns/like" />',
			type : 'post',
			contentType : 'application/json',
			data : JSON.stringify({
				'bno' : bno,
				'userId' : id
			}),
			success : function(result) {
				if(result === 'like'){
					e.target.firstElementChild.setAttribute('src', '${pageContext.request.contextPath}/resources/img/heart.png');
					e.target.style.color = 'blue';
					const $cnt = e.target.parentNode.previousElementSibling.children[1];
					$cnt.textContent = Number($cnt.textContent) + 1;
				} else {
					e.target.firstElementChild.setAttribute('src', '${pageContext.request.contextPath}/resources/img/unheart.png');
					e.target.style.color = 'black';
					const $cnt = e.target.parentNode.previousElementSibling.children[1];
					$cnt.textContent = Number($cnt.textContent) - 1;
				}
				
			},
			error : function() {
				alert('관리자에게 문의하세요!');
			}
		}); // end ajax
	}); // end 좋아요
	
	// # 무한 스크롤
	$(window).scroll(function() {
		
		if(!isFinish){
			if(Math.round($(window).scrollTop()) === $(document).height() - $(window).height()){
				page++;
				getListLike(false).done(getList);
			}
		} else {
			console.log('더이상 불러올 글이 없습니다.');
		}
	}); // end 무한 스크롤

	
	
}); // end JQuery


</script>