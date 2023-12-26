
//아이디 6~12자 검사
function validateInput() {
  var input = document.getElementById("info_id");
  var value = input.value.trim();
  var errorElement = document.getElementById("info_id_error");
  
  const target = document.getElementById('chkUserID');
  
    $("#ck").hide();
    
  if (value.length < 6 || value.length > 12) {
	  target.disabled = true;
	 
    errorElement.style.display = "block";
  } else {
	  target.disabled = false;
    errorElement.style.display = "none";
  }
}

// =====================
//비밀번호 8~20자 검사
function validateInput2() {
  var input = document.getElementById("info_pw");
  var value = input.value.trim();
  var errorElement = document.getElementById("info_pw_error");

  if (value.length < 8 || value.length > 20) {
    errorElement.style.display = "block";
  } else {
    errorElement.style.display = "none";
  }
}

//비밀번호 일치여부
function validateInput3() {
    var pw = document.getElementById("info_pw").value.trim();
    var checkpw = document.getElementById("info_pw_test").value.trim();
    var errorElement = document.getElementById("info_pw_test_error");
    
    if (pw !== checkpw) {
      errorElement.style.display = "block";
      // console.log("불일치");
    } else {
      errorElement.style.display = "none";
    }
  }

  //휴대폰번호 자동 하이픈
  function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

//옵션에서 값 가져오기. Select Option (이메일 입력시)
function setValues() {
  var first = document.getElementById("emailSelection");
  var second = document.getElementById("info_email2");
  if (first.selectedIndex === 0) {
    second.value = "";
  } else {
    second.value = first.options[first.selectedIndex].text;
  }
}

//아이디 중복확인
function check_id() {
	  var id = $("#info_id").val();

	  $.ajax({
	    url: "/register/login",
	    type: "POST",
	    datatype: "json",
	    data: {
	      id: id
	    },
	    success: function (data) {
	      if (data === 0) {
	        $("#info_id_error").hide();
	        $("#ck").text("사용 가능한 아이디입니다.");
	        $("#ck").css("color", "blue");
	        $("#ck").show();
	      }else if (data == 10) {
			  $("#ck").hide();
			  $("#info_id_error").hide();
		  } else {
	        $("#info_id_error").hide();
	        $("#ck").text("이미 사용 중인 아이디입니다.");
	        $("#ck").css("color", "red");
	        $("#ck").show();
	      } 
	    },
	    error: function (xhr, status, error) {
	      console.log(error);
	    },
	  });
	}
	
	//가입취소
	function goToLogin() {
		window.location.href="/login";
	}
	
	// 가입완료버튼 누를때 중복확인 검사 안하면 완료안됨
	function validateForm(event) {
  var id = $("#info_id").val();
  var ck = $("#ck").text();
  
  const phoneNumber  = document.querySelector("#info_tel");
  const info_pw = document.querySelector("#info_pw");
  const info_pw_test = document.querySelector("#info_pw_test");
  
  if (id.length < 6 || id.length > 12) {
    // 아이디 길이 오류
    alert("아이디를 6~12자 사이로 입력해주세요.");
    event.preventDefault(); // 폼 제출 기본 동작 중지
    // 이게 누르면 action url 로 넘어가 잖아요 
    // 근데 이거 쓰면 못넘어가게 할수있어요
  } 
  else if(info_pw.value !== info_pw_test.value) {
	  alert("비밀번호와 확인 비밀번호가 다릅니다.");
 	event.preventDefault();
  }
  else if(phoneNumber.value === "") {
	alert("전화번호를 입력해주세요");	  
	event.preventDefault();
  }
   else if (ck !== "사용 가능한 아이디입니다.") {
    // 아이디 중복 확인 필요
    alert("아이디 중복 확인을 해주세요.");
    event.preventDefault(); // 폼 제출 기본 동작 중지
  } 
  else {
    // 유효성 검사 및 중복 확인 통과
    alert("회원 가입이 완료되었습니다.");
  }
}
