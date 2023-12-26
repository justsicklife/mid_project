const modalClickButton = document.querySelector("#modalClick");
const diaryDate = document.querySelector("#diaryDate");
const diaryTitle = document.querySelector("#diaryTitle");
const diaryContent = document.querySelector("#diaryContent");
const modalId = document.querySelector("#modalId");

modalClickButton.addEventListener("click",modalClick)

function modalClick (e) {
	if(e.target.id === "modal_button") {
		diaryDate.innerHTML = e.target.dataset.date;
		diaryTitle.value= e.target.dataset.title;
		diaryContent.value= e.target.dataset.content;
		console.dir(modalId);	
		modalId.value = e.target.dataset.id;	
	}
	
}


const allClick = document.querySelector("#checkboxAll");

  function change() {
  	const checkboxAll = document.getElementById("checkboxAll");
  	const is_checked = checkboxAll.checked;
  	const checkbox = document.querySelectorAll("#checkbox");
      for(let i = 0 ; i < checkbox.length ; i++) {
          checkbox[i].checked = is_checked;
      }
  }

  allClick.addEventListener("change",change);

$(document).ready(function() {
    $(".delete_title").click(function() {
      $('#trashModal').modal("show");
    });
  });

  

  //-----------------다이어리----------------------------------------

  
function changeDate() {
    var datePicker = document.getElementById('datePicker');
    var selectedDate = datePicker.value;
    document.getElementById('date').innerHTML = selectedDate;
  }
function changeFont() {
    var fontSelect = document.getElementById("fontSelect");
    var font = fontSelect.options[fontSelect.selectedIndex].value;
    document.getElementById("diaryContent").style.fontFamily = font;
  }

  function changeFontSize() {
    var sizeSelect = document.getElementById("sizeSelect");
    var size = sizeSelect.options[sizeSelect.selectedIndex].value;
    document.getElementById("diaryContent").style.fontSize = size + "px";
  }

  function changeFontColor() {
    var fontColor = document.getElementById("fontColor").value;
    document.getElementById("diaryContent").style.color = fontColor;
  }
  function uploadImage() {
    // 이미지 업로드 처리 로직 작성.
    
    // 업로드 완료 후 다른 동작 수행 (예: 페이지 이동)
    window.location.href  ("new-page.html","_blank"); // 이동할 페이지 URL로 변경
  }
  
  function cancel() {
    window.close(); // 현재 창 닫기
  }