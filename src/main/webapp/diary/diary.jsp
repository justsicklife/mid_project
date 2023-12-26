<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>일기장</title>
    <!-- 부트 스트랩 css 링크 ver.5.0.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

   <!-- jQuery CDN ver.3.7.0 -->
   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="/diary/diary.css">
</head>
<body>
<!-- 부트 스트랩 nav bar -->
 	<%@ include file="../nevimenu/nevimenu.jsp" %>
<form action="/diarycontroller" method="post" enctype="multipart/form-data">

  <div class="container">
    <!-- 수정 -->
    <h2>Diary</h2>
    <br>
    <label for="datePicker">날짜</label>
<input type="date" name="date" id="datePicker" onchange="changeDate()">
<br>
    <label for="fontSelect">글꼴 </label>
    <select id="fontSelect" onchange="changeFont()">
      <option value="궁서, serif">궁서체</option>
      <option value="함초롱바탕, serif">함초롱바탕</option>
      <option value="돋움, sans-serif">돋움</option>
      <option value="맑은 고딕, sans-serif"> 맑은고딕</option>
      <option value="나눔고딕, sans-serif">나눔고딕</option>
      <option value="Arial, sans-serif">Arial</option>
      <option value="Helvetica, sans-serif">Helvetica</option>
      <option value="Georgia, serif">Georgia</option>
    </select>

    <label for="sizeSelect">글자크기 </label>
    <select id="sizeSelect" onchange="changeFontSize()">
      <option value="12">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
    </select>
    
    <label for="fontColor">글자색상</label>
    <input type="color" id="fontColor" onchange="changeFontColor()">
  
    <table width="500">
      <!-- <tr>
        <th colspan="2">
          Diary Write
        </th>
      </tr> -->
      <tr>
        <td>
          <input type="text" placeholder="제목을 입력하세요." name="title" maxlength="20" style="width:100%"> <!--스타일 수정-->
        </td>
      </tr>
      <tr>
        <td colspan="2" height="400">
          <textarea id="diaryContent" class="diaryText" placeholder="내용을 입력하세요." name="content" style="width: 100%; height: 100%" ></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="right">
          <div class="image-upload">
          <label for="image">
            
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
              <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
              <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
            </svg>

          </label>:</label>

          <input type="file" id="image" name="image" >
		 </div>
          <br>

        <input type="reset" class="cancle" value="취소">
          <input type="submit" class="write" value="글쓰기" onclick="uploadImageToS3()">
        </td>
      </tr>
    </table>
  </div>
  </form>
  
  <script src="https://sdk.amazonaws.com/js/aws-sdk-2.283.1.min.js"></script>
  <script src="/diary/diary.js"></script>
  <!-- 부트 스트랩 js 번들 ver.5.0.2 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
   
</body>
</html>