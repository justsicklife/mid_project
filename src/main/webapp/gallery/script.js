var imageContainers = document.getElementsByClassName('image-container');

// 날짜 표시
for (var i = 0; i < imageContainers.length; i++) {
  var imageContainer = imageContainers[i];
  var image = imageContainer.getElementsByTagName('img')[0];
  var dateOverlay = imageContainer.getElementsByClassName('date')[0];
  var date = image.getAttribute('data-date');
  var formattedDate = formatDate(date);
  dateOverlay.innerHTML = formattedDate;
}

// 모달 열기 함수
function openModal(imageSrc) {
  var modal = document.getElementById('myModal');
  var modalImg = document.getElementById('modalImg');
  modal.style.display = 'block';
  modalImg.src = imageSrc;
}

// 모달 닫기 함수
function closeModal() {
  var modal = document.getElementById('myModal');
  modal.style.display = 'none';
}

// 이미지 다운로드 함수
function downloadImage(imageSrc) {
  var link = document.createElement('a');
  link.href = imageSrc;
  link.download = imageSrc.split('/').pop();
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  
}

// 검색 기능 구현
var searchInput = document.getElementById('searchInput');

searchInput.addEventListener('input', function() {
  searchImages();
});

function searchImages() {
  var searchInputValue = searchInput.value.toLowerCase();
  var images = document.getElementsByClassName('image-container');

  for (var i = 0; i < images.length; i++) {
    var image = images[i];
    var imageName = image.getElementsByTagName('img')[0].getAttribute('alt').toLowerCase();
    var imageDate = image.getElementsByTagName('img')[0].getAttribute('data-date');

    if (imageName.includes(searchInputValue) || imageDate.includes(searchInputValue)) {
      image.style.display = 'inline-block';
    } else {
      image.style.display = 'none';
    }
  }
}

function formatDate(dateString) {
  var dateParts = dateString.split('-');
  var year = dateParts[0];
  var month = dateParts[1];
  var day = dateParts[2];

  var formattedDate = year + "." + month + "." + day;
  return formattedDate;
}

function getBucketImages() {
  // AWS SDK를 초기화합니다.
  AWS.config.update({
    region: 'ap-northeast-2', // 리전을 설정합니다.
    credentials: new AWS.Credentials('AKIAZBPCYDIBQA7FNCWY', 'V8KLmUHwocGxjFMontLze7gVPes9CWanTdOeA0/Z') // 액세스 키와 비밀 액세스 키를 설정합니다.
  });

  // S3 객체를 생성합니다.
  var s3 = new AWS.S3();

  // S3 버킷에서 이미지 목록을 가져옵니다.
  var params = {
    Bucket: 'inssada', // 버킷 이름을 설정합니다.
    Prefix: '' // 이미지 파일이 저장된 경로를 설정합니다.
  };

  s3.listObjects(params, function (err, data) {
    if (err) {
      console.log(err, err.stack);
    } else {
      var images = data.Contents;
      displayGallery(images);
    }
  });
}