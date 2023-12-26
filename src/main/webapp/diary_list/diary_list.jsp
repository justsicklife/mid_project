<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>diaryList</title>
    
  <!-- 부트 스트랩 css 링크 ver.5.0.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

   <!-- jQuery CDN ver.3.7.0 -->
   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
 
  <link rel="stylesheet" href="./diary_list/diary_list.css">
</head>
<body>
<!-- 부트 스트랩 nav bar -->
 	<%@ include file="../nevimenu/nevimenu.jsp" %>
<div class="container">
         <h1>Diary List</h1>
<form action="/list" method="post">
  <div class="button_group">
    <input class="delete" type="submit" name="cmd" value="삭제"/>
  </div> 

  <div class="button_optional_select">
    <div class="button_checkbox_wrap">
      <input type="checkbox" id="checkboxAll" class="all_button_checkbox">
      <label class="button_all" for="selection_all">
        <span class="blind">all</span>
      </label>
    </div>
  </div>
  <hr>

<c:forEach var="item" items="${ diaryList}">
  <div class="edit_list">
    <div class="button_checkbox">
       <input type="checkbox" id="checkbox" name="id" value="${item.getDiaryNumber() }" class="button_checkbox blind" readonly="">
         <label for="selection_22"  id="label_22" draggable="true"></label>
    </div>   
    <div class="edit_inner">
      <div class="edit_title">
        <a class="Tmodal" data-toggle="modal" href="/ModifyController?diaryNumber=${ item.getDiaryNumber()}">
        ${item.getDiaryTitle() }
        </a>
      </div>
    </div>

    <div class="edit_date">
      <span class="date">
      	${item.getDiaryDate() }
      </span>
    </div>
  </div>
</c:forEach>
</form>

  <script src="./diary_list/diary_list.js"></script>
   <!-- 부트 스트랩 js 번들 ver.5.0.2 -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>