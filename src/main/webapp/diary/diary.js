
  function changeDate() {
      var datePicker = document.getElementById('datePicker');
      var selectedDate = datePicker.value;
      document.getElementById('datePicker').innerHTML = selectedDate;
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
  
	 console.log("test");
        AWS.config.update({
            accessKeyId: 'AKIAZBPCYDIBQA7FNCWY', // 여기에 액세스 키 ID 입력
            secretAccessKey: 'V8KLmUHwocGxjFMontLze7gVPes9CWanTdOeA0/Z', // 여기에 비밀 액세스 키 입력
            region: 'ap-northeast-2' // 여기에 AWS 리전 입력
          });
console.log("test2");
          // 파일 업로드 함수
          function uploadImageToS3() {
            const s3 = new AWS.S3();
            const fileInput = document.getElementById('image');
            const file = fileInput.files[0];

            const fileName = file.name;
            const fileContent = file;

            const params = {
              Bucket: 'inssada', // 여기에 S3 버킷 이름 입력
              Key: fileName,
              Body: fileContent
            };
			console.log('접속완료')
			
            s3.upload(params, function(err, data) {
              if (err) {
                console.log('파일 업로드 에러:', err);
              } else {
                console.log('파일 업로드 성공:', data.Location);
              }
            });
          }
          console.log("test3");
