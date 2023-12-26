<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -->

<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- 부트 스트랩 css 링크 ver.5.0.2 -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">

<!-- jQuery CDN ver.3.7.0 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
   integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
   crossorigin="anonymous"></script>

<link rel="stylesheet" href="/trash-list/trash.css">
</head>
<body>
	<!-- 부트 스트랩 nav bar -->
 	<%@ include file="../nevimenu/nevimenu.jsp" %>
   <!-- 모달 -->
   <div class="modal fade" id="trashModal" data-bs-backdrop="static"
      data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="staticBackdropLabel">-</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="container">
                  <div class="img">
                     <img src="img.png" alt="">
                  </div>
                  <label class="diary_date" for="datePicker">날짜 선택:</label> <span
                     class="date" id="diaryDate">06.15 16:43</span>
                  <!-- <input type="date" id="datePicker" onchange="changeDate()"> -->
                  <br>
                  <table border="1" width="500">
                     <tr>
                        <th colspan="2">Diary</th>
                     </tr>
                     <tr>
                        <td><input type="text" placeholder="제목을 입력하세요."
                           maxlength="20" style="width: 99%" id="diaryTitle"></td>
                     </tr>
                     <tr>
                        <td colspan="2" height="400"><textarea id="diaryContent"
                              placeholder="내용을 입력하세요." style="width: 100%; height: 100%"></textarea>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2"><img id="uploadedImage" src="" alt="사진"
                           style="max-width: 100%;"></td>


                      <!-- <td colspan="2" align="right">
                        <label for="image">이미지:</label>
                        <input type="file" id="image" name="image">
                        <br>
                        <input type="button" value="취소">
                        <input type="button" value="글쓰기"> -->
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
            <div class="modal-footer">
               <form action="list" method="post"> 
               <!-- 
               <button type="button" name="cmd" value="일괄복구" class="btn btn-secondary"
                  data-bs-dismiss="modal">restore</button>
               <button type="button" name="cmd" value="일괄삭제" class="btn btn-primary">delete</button>
                -->
                  <input type="submit" name="cmd" value="복구" class="btn btn-secondary"
                     data-bs-dismiss="modal"/>
                  <input type="submit" name="cmd" value="삭제" class="btn btn-primary"/>
                  <input type="hidden" name="id" id="modalId"/>
               </form>
            </div>
         </div>
      </div>
   </div>

   <div class="container">
      
   <h1>Trash</h1>
<form action="garbage" method="post">
   
  <div class="button_group">
   <input type="submit" class="delete" name="cmd" value="복구"/>
    <input type="submit" class="restore" name="cmd" value="삭제"/>
  
  </div>

  <div class="button_optional_select">
    <div class="button_checkbox_wrap">
      <input class="all_button_checkbox" type="checkbox" />
      <label class="button_all" for="selection_all">
        <span class="blind">all</span>
      </label>
    </div>
  </div>


  <hr>

<div id="modalClick">
<c:forEach var="item" items="${diaryList }">
  <div class="delete_list">
    <div class="button_checkbox">
         <input class="form-check-input" name="id" type="checkbox" value="${item.getDiaryNumber() }" id="checkbox">
         <label for="selection_22" id="label_22" draggable="true"></label>
    </div>   
    <div class="delete_inner">
      <div class="delete_title">
        <a class="Tmodal" id="modal_button" data-toggle="modal" href="#trashModal" data-id="${item.getDiaryNumber() }" data-date="${item.getDiaryDate() }" data-content="${item.getDiaryContent() }" data-title="${item.getDiaryTitle() }" >
        
           ${ item.getDiaryTitle()}
        </a>
      </div>
    </div>

    <div class="delete_date">
      <span class="date">
         ${ item.getDiaryDate()}
      </span>
    </div>
  </div>
  </c:forEach>
</div>
 </form>
</div>

   
   <script src="/trash-list/trash.js"></script>
   <!-- 부트 스트랩 js 번들 ver.5.0.2 -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"></script>
</body>
</html>