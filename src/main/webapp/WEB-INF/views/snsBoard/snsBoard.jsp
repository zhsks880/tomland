<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp"%>

  <section id="hero" class="d-flex align-items-center freeTable">

    <div class="container regi">
      <div class="row">

        <!-- 좌측 폼 -->
        <div class="col-lg-2 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
          <div class="fileDiv">
            <img id="fileImg" src="./assets/img/like2.png">
          </div>
        </div>

        <!-- 우측 메뉴 -->
        <div class="col-lg-6 d-lg-flex flex-lg-column order-1 order-lg-2 regi">
          <h4 style="text-align: left;">사진 업로드</h4>
          <div class="user1">
            <div>
              <img src="assets/img/like2.png" alt="프로필사진" style="width: 50px; height: 50px;">
            </div>
            <div style="width: 100%;">
              <textarea name="" id="" rows="2" style="width: 100%;" class="form-control"></textarea>
              <div class="reply-group">
                <div class="filebox user2">
                  <label for="file">이미지업로드</label>
                  <input type="file" name="file" id="file" onchange="readURL(this);">
                  <button type="button" class="right btn" id="uploadBtn" style="background-color: #5777ba; color: white;">게시</button>
                </div>
              </div>
            </div>
          </div> <!--end 등록 폼 -->
          
          <!-- 보여주기 폼 -->
          <div id="contentDiv">
            <div class="title-inner user1">
              <div class="profile">
                <img src="./assets/img/free-marker.png" style="width: 50px; height: 50px;">
              </div>
              <div class="title">
                <p style="text-align: left;">홍길동</p>
                <small>2022년12월23일</small>
              </div>
            </div>
            <!-- 내용 영역 -->
            <div class="content-inner">
              <p>내용내용</p>
            </div>
            <!-- 이미지 영역 -->
            <div class="image-inner">
              <a href="#">
                <img src="./assets/img/like2.png">
              </a>
            </div>
            <!-- 좋아요 -->
            <div class="like-inner">
              <img src="./assets/img/icon.jpg"><span>440</span>
            </div>
            <div class="link-inner">
              <a href=""><img src="./assets/img/like2.png">좋아요</a>
              <a href=""><i class="bi bi-chat-right-dots">댓글달기</i></a>
              <a href=""><i class="bi bi-file-x">삭제하기</i></a>
            </div>
          </div><!--end 보여주기 폼-->

        </div>

      </div>
    </div>

  </section><!-- End Hero -->


<%@ include file="../include/footer.jsp"%>