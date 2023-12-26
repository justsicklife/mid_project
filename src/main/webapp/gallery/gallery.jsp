<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="kr.co.log2.gallery.dto.GalleryDTO" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이미지 갤러리</title>
      
	 
	  <!-- 부트 스트랩 css 링크 ver.5.0.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

   <!-- jQuery CDN ver.3.7.0 -->
   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
 	<link rel="stylesheet" href="/gallery/gallery.css">
  
	</head>
<body>
<!-- 부트 스트랩 nav bar -->
  <%@ include file="../nevimenu/nevimenu.jsp" %>
    <div class="container">
<form action="/gallerycontroller" method="post" >
    <h1>Gallery</h1>
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="이미지 검색">
        <br>
    </div>

    <div class="gallery">
         <c:forEach var="image" items="${images}">
            <div class="image-container">
                <img src="http://inssada.s3-website.ap-northeast-2.amazonaws.com/${image.d_img}" alt="${image.d_img}" 
                onclick="openModal('${image.d_date}')" data-date="${image.d_date}">
                <div class="overlay">
                    <div class="btn-group">
                        <div class="date">${image.d_date}</div>
                        <div class="btn" onclick='openModal("http://inssada.s3-website.ap-northeast-2.amazonaws.com/${image.d_img}")'>확대</div>
                        <div class="btn" >${image.d_img}</div>
                        <div class="btn" onclick='downloadImage("http://inssada.s3-website.ap-northeast-2.amazonaws.com/${image.d_img}")'>다운로드</div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
    <div id="myModal" class="modal"> <!-- 확대모달 -->
        <span class="modal-content">
            <span class="close-modal" onclick="closeModal()">&times;</span>
            <img id="modalImg" class="modal-img">
        </span>
    </div>
    </form>
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.932.0.min.js"></script>
    <script src="/gallery/script.js"></script>
    
    <!-- 부트 스트랩 js 번들 ver.5.0.2 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
