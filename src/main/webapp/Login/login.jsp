<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="./Login/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</head>
      <body>
       <div class="container">
        <div class="form">
            <!-- 로그인 폼에 id와 password 입력 필드에 name 속성을 추가합니다. -->
            <form action="/login" method="post">
                <div class="img_box">
                    <img src="/in_logo_b.png" width="90" alt="in_logo">
                </div>
                
                <input type="text" name="id" placeholder="아이디" />
                <input type="password" name="password" placeholder="비밀번호" />
                
                <button type="submit" class="login">login</button>

                <p>계정이 없으신가요? <a href="/register">회원가입</a></p>
                
            </form>
        </div>
    </div> 
      </body> 
    </html>