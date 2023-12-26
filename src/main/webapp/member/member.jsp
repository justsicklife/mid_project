<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>member</title>
  <link rel="stylesheet" href="../member/member.css">

</head>

<body>

  <div class="container">
    <div class="content">
      <h2>회원가입</h2>
      <p>회원이 되어 나만의 일기를 써주세요~</p>
      
      <div class="form_area">
        <form action="/register/register" method="post">
          <div class="info_area">
            <div class="inp_box">
              <input type="text" name="id" id="info_id" placeholder="아이디 입력 (6~20자)" onkeyup="validateInput()" />
              <button type="button" id="chkUserID" onClick="check_id()" class="btn btn_check"  >중복 확인</button> 
            </div>
            <p id="info_id_error" class="desc" style="display:none; color: red;">6~12자 사이로 입력하세요</p>
           <p id="ck" class="desc" style="display:none;"></p> <!-- gtp -->
          <!--<p id="info_id_test_error" class="desc" style="display:none; color:red">사용할 수 없는 아이디입니다</p>  -->
          </div>
  
          <div class="info_area">
            <input type="password" name="password" id="info_pw" placeholder="비밀번호 입력 (8~20자 이내)" onchange="validateInput2()"/>
            <p id="info_pw_error" class="desc" style="display:none; color:red">8~20자 이내의 비밀번호를 입력해주세요</p>
          </div>
  
          <div class="info_area">
            <input type="password" id="info_pw_test" placeholder="비밀번호 재입력" onchange="validateInput3()"/>
            <p id="info_pw_test_error" class="desc" style="display:none; color:red">비밀번호가 일치하지 않습니다</p>
          </div>
  
          <div class="info_area">
            <input type="text" name="username" id="info_name" placeholder="이름을 입력해주세요" />
          </div>
  
          <div class="info_area">
            <input type="text" id="info_tel" placeholder="휴대폰 번호 입력 ('-'제외 11자리 입력)" class="form-control" name="phone_number" oninput="oninputPhone(this)" maxlength="14"/>
          </div>
          <div class="info_area email">
            <input type="text" name="email_id" id="info_email" placeholder="이메일 주소" /> <span class="text">@</span>
            <input type="text" name="email_domain" id="info_email2" value="" placeholder="" />
            <select id="emailSelection" name="email_id" size="1" onchange="setValues();">
              <option value="1">직접입력</option>
              <option value="naver.com">naver.com</option>
              <option value="daum.net">daum.net</option>
              <option value="gmail.com">gmail.com</option>
            </select> 

          </div>
  
          <div class="info_area birthday">  
            <input placeholder="생년월일" name="birth" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" style="width: 100%;"/>
          </div>
          <div class="btn_area">
            <!-- <button class="btn btn_join">가입완료</button> 기존코드 -->
            <button type="submit" onclick="return validateForm(event)" class="btn btn_join">가입완료</button>
            <button type="button" onclick="goToLogin()" class="btn btn_cancel">가입취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
 <script src="../member/member.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</body>
<script>

</script>
</html>