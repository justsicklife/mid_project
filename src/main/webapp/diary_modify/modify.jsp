<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>수정Page</title>
   <!-- 부트 스트랩 css 링크 ver.5.0.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

   <!-- jQuery CDN ver.3.7.0 -->
   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/diary/diary.css">
</head>
<body>
<!-- 부트 스트랩 nav bar -->
 	<%@ include file="../nevimenu/nevimenu.jsp" %>
<form action="/ModifyController" method="post">

    <div class="container">
	<!-- 수정 -->
    <h2>Modify</h2>
    <br>
      <label for="datePicker">날짜 선택:</label>
    <input type="date" name="datePicker" value="${diary.getD_date() }" id="datePicker" onchange="changeDate()">
    <br>
      <label for="fontSelect">글꼴:</label>
      <select id="fontSelect" onchange="changeFont()">
        <option value="궁서, serif">궁서체</option>
        <option value="함초롱바탕, serif">함초롱바탕</option>
        <option value="돋움, sans-serif">돋움</option>
        <option value="맑은 고딕, sans-serif">맑은고딕</option>
        <option value="나눔고딕, sans-serif">나눔고딕</option>
        <option value="Arial, sans-serif">Arial</option>
        <option value="Helvetica, sans-serif">Helvetica</option>
        <option value="Georgia, serif">Georgia</option>
      </select>
  
      <label for="sizeSelect">글자 크기:</label>
      <select id="sizeSelect" onchange="changeFontSize()">
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
      <label for="fontColor">글자 색상:</label>
      <input type="color" id="fontColor" onchange="changeFontColor()">
    
      <table border="1" width="500">
<!--         <tr>
          <th colspan="2">
            Diary Modify
          </th>
        </tr> -->
        <tr>
          <td>
            <input type="text" placeholder="제목을 입력하세요." value="${diary.getD_title() }" name="title" maxlength="20" style="width:99%">
          </td>
        </tr>
        <tr>
          <td colspan="2" height="400">
            <textarea id="diaryContent" placeholder="내용을 입력하세요."  name="content" style="width: 100%; height: 100%">${diary.getD_cont() }
            </textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="right">
            <label for="image">이미지:</label>
            <input type="file" id="image" name="image" value="${diary.getD_img() }">
            <br>
 		  <input type="reset" value="취소" name="reset">
          <input type="submit" value="수정" name="mode">
          <input type="submit" value="삭제" name="mode">
          <input type="hidden" name="id" value="${diary.getD_no() }"/>
          </td>
        </tr>
      </table>
    </form>
     <script src="https://sdk.amazonaws.com/js/aws-sdk-2.283.1.min.js"></script>
  <script src="/diary/diary.js"></script>
  <!-- 부트 스트랩 js 번들 ver.5.0.2 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     </body> 
</html>