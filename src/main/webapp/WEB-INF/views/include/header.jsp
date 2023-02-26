<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top  header-transparent ">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1><a href="<c:url value='/' />" >TomLand</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar navbar-expand-lg">
     
        <ul>
          <li><a class="nav-link scrollto active" href="<c:url value='/' />" >Home</a></li>
          <li><a class="nav-link scrollto" href="<c:url value='/#features' />">Intro</a></li>
          <li><a class="nav-link scrollto" href="<c:url value='/#gallery' />">Gallery</a></li>
<!--           <li><a class="nav-link scrollto" href="#pricing">Pricing</a></li> -->
          <li><a class="nav-link scrollto" href="<c:url value='/#faq' />">F.A.Q</a></li>
          <li><a class="nav-link scrollto" href="<c:url value='/#contact' />">Contact</a></li>
          <li class="dropdown"><a href="#"><span>Tom`s Service</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="<c:url value='/board/boardList' /> ">자유게시판</a></li>
              <li><a href="<c:url value='/sns/snsBoard' />">이미지게시판</a></li>
              <li><a href="<c:url value='/util/gonggong' />">따릉이찾기</a></li>
              <li><a href="<c:url value='/gamja/gamjaList' />">감자마켓</a></li>
           <!-- <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li> -->
            </ul>
          </li>
          
          
          <!-- 로그인 안했을 시 버튼 -->
          <c:if test="${login == null}">
          <li><a class="getstarted scrollto js-scroll-trigger" href="#log-in" data-toggle="modal" data-target="#log-in"
              id="myLogin">Login</a></li>
          </c:if>
          
          <!-- 로그인 유지 시 -->
          <c:if test="${login != null}">
          <li><a class="getstarted scrollto js-scroll-trigger" href="<c:url value='/user/userMypage' />" id="Mypage">Mypage</a></li>
          <li><a class="getstarted scrollto js-scroll-trigger" href="<c:url value='/user/logOut' />" id="LogOut">LogOut</a></li>
          </c:if>
          
        </ul>
        
        <i class="bi bi-list mobile-nav-toggle"></i>
        <!-- 로그인 Modal-->
        <div class="modal fade" id="log-in">
          <div class="modal-dialog">
            <div class="modal-content">

              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">
                  <span style="color: #5777ba;">Tomland</span> 로그인
                </h4>
                <button type="button" class="modalClose" id="modalClose" data-dismiss="modal">&times;</button>
              </div>

              <!-- Modal body -->
              <div class="modal-body">

                <form action="#" method="post" id="signInForm" style="margin-bottom: 0;">
                  <table style="margin: 0 auto; width: 80%">
                    <tr>
                      <td style="text-align: left">
                        <p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;<span id="idCheck"></span></p>
                      </td>
                    </tr>
                    <tr>
                      <td><input type="text" name="signInId" id="signInId" class="form-control tooltipstered"
                          maxlength="14" required="required" aria-required="true"
                          style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                          placeholder="최대 14글자"></td>
                    </tr>
                    <tr>
                      <td style="text-align: left">
                        <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;<span id="pwCheck"></span></p>
                      </td>
                    </tr>
                    <tr>
                      <td><input type="password" size="17" maxlength="20" id="signInPw" name="signInPw"
                          class="form-control tooltipstered" maxlength="20" required="required" aria-required="true"
                          style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                          placeholder="최소 8글자"></td>
                    </tr>
                    <!-- 자동 로그인 체크박스 -->
                    <!-- <tr>
                                      <td><input type="checkbox" id="auto-login" name="autoLogin" /> &nbsp;자동 로그인</td>
                                    </tr> -->

                    <tr>
                      <!-- <td style="padding-top: 10px; text-align: center">
                                        <p><strong>Tomland에 온걸 환영합니다</strong></p>
                                      </td> -->
                    </tr>
                    <tr>
                      <td style="width: 100%; text-align: center;">
                      <input type="button" value="로그인"
                          class="btn form-control tooltipstered" id="signIn-btn"
                          style="background-color: #5777ba; margin-top: 0; height: 40px; color: white; border: 0px solid #5777ba; opacity: 0.8">
                      </td>
                    </tr>
                    
                    <tr>
                      <td
                        style="width: 100%; text-align: center; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">

                        <a class="btn form-control tooltipstered" data-toggle="modal" href="<c:url  value='/user/userJoin'/>"
                          style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: #39a150; border: 0px solid #388E3C; opacity: 0.8">
                          회원가입</a>
                      </td>
                    </tr>
					
                  </table>
                  <br>
                  <div class="find" style="text-align: center; font-size: 13px;">
                  <span><a href="<c:url value='/user/findId' />">아이디 찾기</a></span>&nbsp;&nbsp; | &nbsp;&nbsp;<span><a href="<c:url value='/user/findPw' />">비밀번호 찾기</a></span>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div><!-- end modal -->
      </nav><!-- .navbar -->
    </div>

    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
	
	</script>
	  
  <script>
  
  $(function(){
	  
	//로그인 버튼 클릭 이벤트
	$('#signIn-btn').click(function(){
		
		const id = $('#signInId').val();
		const pw = $('#signInPw').val();
		
		const login = {
			'userId' : id,
			'userPw' : pw
		};
		$.ajax({
			type : 'post',
			url : '<c:url  value="/user/login" />',
			contentType : 'application/json',
			dataType : 'text',
			data : JSON.stringify(login),
			success : function(data){
				//아이디가 없다(idFail)
				if(data === 'idFail'){
					alert('아이디가 없습니다. 회원 가입 해주세요');
				} else if(data === 'pwFail'){
					alert('비밀번호가 틀렸습니다.');
					$('#signInPw').focus();
				} else {
					alert('로그인을 환영합니다');
					location.href='<c:url value="/" />';
				}
			},
			error : function(){
				alert('관리자에게 문의하세요');
			}

		});// end ajax
		
		
	}) // end signIn-btn
	  
	//엔터키 입력 시 이벤트
	$('#signInPw').keydown(function(e) {
		if(e.keyCode == 13){
			$('#signIn-btn').click();
		}
	}); // end signIn-btn
	
  }); //end jQuery
  </script>  
    
    
    
    
    
    
  </header><!-- End Header -->
  
