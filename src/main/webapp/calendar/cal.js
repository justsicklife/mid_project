
// 세션에서 document id 를 가져온다.
const documentId = document.querySelector("#id");
// document에서 가져온 data-id 를 가져온다
const id = documentId.dataset.id;

// event 를 담을 배열
let events = [];

// date,isAllday (date 형타입과, bool 값)
 function formetDate(nowDate,isAllday = true) {
        // 현재 Date 값에서 년도만 가져옴  
        let year = nowDate.getFullYear() 
        // 현재 Date 값에서 몇달인지 만 가져옴
        // 주의! nowDate.getMenth() 는
        //  0 부터 시작해서 1을 더해줘야함
        // 예를 들면 1월은 -> 0임
        
        // 삼항 연산자 사용 
        // https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Conditional_operator
        // 여기서 잠깐 설명하자면
        // newDate.getMonth()+1 이 9 보다 크다면 
        // nowDate.getMonth() + 1 을 한값을 반환하고 
        // https://curryyou.tistory.com/185 백틱 사용법
        // 아니라면 백틱 을 사용하여 10 보다 작은값들은 숫자앞에 0을 붙여준다.
        // 예 : 5월이면 05 이렇게 리턴하게 하기위해서
        // 밑에 5개의 줄도 설명한 것과 같다.
        let month = nowDate.getMonth() + 1> 9 ? nowDate.getMonth() + 1 : `0${(nowDate.getMonth() + 1)}`;  
        let date = nowDate.getDate()> 9 ? nowDate.getDate() : `0${(nowDate.getDate())}`
  
        // isAllday 가 true 라면 
        if(isAllday ===  true) {
            // year-menth-date 를 반환한다.
            // 반환값 예 : 2023-06-17
            return `${year}-${month}-${date}` 
        } else {
            // isAllday가 false 라면 
            // 반환값 예 : 2023-06-17T08:32:05
           let hour = nowDate.getHours() > 9 ? nowDate.getHours() : `0${nowDate.getHours()}`;
           let minutes = nowDate.getMinutes()  > 9 ? nowDate.getMinutes() : `0${nowDate.getMinutes()}`;
           let seconds = nowDate.getSeconds() > 9 ? nowDate.getSeconds() : `0${nowDate.getSeconds()}`;
            return `${year}-${month}-${date}T${hour}:${minutes}:${seconds}`
        }
    }


// 함수명을 쓰지 않고 그냥 사용하는 
// 익명함수 https://dasima.xyz/javascript-anonymous-function/
// 이렇게 쓰면 이름을 함수명을 안쓰고 바로 실행할수있음
// (function () {
//   console.log("aaa")
// })()

(function () {

    // $ 이건 제이쿼리 인데 저도 잘 모르겠음
    $(function () {
        // calendar element 취득
        var calendarEl = $('#calendar')[0];
        // ajax 메서드 실행문
        $.ajax({
          // get 요청으로 한다.
          type : 'get',
          // /2Log_InSsaDa/controller/getdate 이 url에 
          // get 요청을 보낸다.
          // 이걸 controller 에 있는 doGet() 이 받음
          url: `/event/getdate?id=${id}`,
          // async 비동기로 불러오냐 false
          // aysnc 가 true라면 비동기로 불러옴
          // https://recollectionis.tistory.com/167 설명 
          async: false,
          // 받아올 dateType 은 JSON 형태로 받아오는것
          dateType: "JSON", 
          success : function(result) { // 결과 성공 콜백함수
          // result 가 왜 json 이 아닌지 모르겠음 이건 선생님한테 설명을 들을 필요가 있음
            for(let i = 0 ; i < result.length ; i++) {
              // 받아온 데이터 맨위에 있는 events 배열에 푸쉬
              // result : 받아온 배열 데이터를 의미함 
              // createEvent 는 84번째 줄을의미함 
               let myEvent = createEvent(result[i].event_description, result[i].str_time,result[i].end_time , result[i].allday_chk == 0 ? false : true );
                //events 배열에 myEvent 를 push 해줌
                // https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/push
               events.push(myEvent);
              }
          },
          error : function(request, status, error) { // 결과 에러 콜백함수
              console.log(error)
          }
        })

        // createEvent 함수 title, start,end,allday 를 받음
        function createEvent(title, start, end, allday) {
          // evnet 객체를 초기화함 
          let event = {
            title: title,
            start: start,
            end: end,
            allday: allday
          };
        
          // event 를 리턴해줌
          return event;
        }
        
        // full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
            height: '700px', // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: '00:00', // Day 캘린더에서 시작 시간
            slotMaxTime: '23:59', // Day 캘린더에서 종료 시간
            // 해더에 표시할 툴바
            headerToolbar: {
                left: 'prev,next today diary',
                center: 'title',
                right: 'dayGridMonth,listWeek'
            },
            initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            // initialDate: '2021-07-15',  초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능?
            selectable: true, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
            // locale: 'ko', // 한국어 설정

           /*  // 일기장 커스텀 버튼 추가 --------------------------------------------------------------------------------------------
            customButtons: {
                diary: { // 추가한 버튼 설정
                    text : "diary",  // 버튼 내용
                    click : function(){
                        window.location.href = "http://127.0.0.1:5500/diary/tp.html";
                    }
                    
                }
            },*/
//---------------------------------------------------------------------------------------------
   


// --------------------------------------------------------------------------------------------

          /* 드래그로 이벤트 날짜 위치 변경 하기 */
          eventDrop: function (info) {
            $('#moveModal').modal("show");
            
            console.log(info);
            $('#move-message-text').val("'" + info.event.title + "'" + "일정을 옮기시겠습니까?"); // 모달에 이전 내용 표시
        
            $('.btn-move-check').click(function(){
            
                $(function modifyData() {
                    $.ajax({
                    url: `/event/update`,
                    method: "post",
                    dateType: "JSON",
                    data: {
                      title: info.event._def.title,
                      start: formetDate(info.event._instance.range.start,info.event._def.allDay),
                      end: formetDate(info.event._instance.range.end,info.event._def.allDay),
                      oldTitle: info.oldEvent._def.title,
                      oldStart: formetDate(info.oldEvent._instance.range.start,info.oldEvent._def.allDay),
                      oldEnd: formetDate(info.oldEvent._instance.range.end,info.oldEvent._def.allDay)
                    }
                    });
                });
                $('#moveModal').modal("hide");
            });

            $('.btn-move-cancel').click(function(){
                info.revert(); // 이벤트를 원래 위치로 되돌립니다. 
                $('#moveModal').modal("hide");
            });
        },

// --------------------------------------------------------------------------------------------

        // 캘린더에서 클릭 or 드래그로 이벤트를 생성
        select: function (arg) {
            console.log(arg);
           // 기존 클릭 이벤트 핸들러 제거
           $('.btn-input').off('click');
         
           // textarea 초기화
           $('#input-message-text').val("");
         
           // 모달 창 열기
           $('#inputModal').modal("show");
         
           // 입력 버튼 클릭 이벤트 핸들러
           $('.btn-input').click(function () {
             var title = $('#input-message-text').val(); // textarea의 입력값 가져오기
            
          $('#inputModal').modal("hide");
          calendar.unselect();
        
          if (title) {
                  // 캘린더에 이벤트 추가
                    calendar.addEvent({
                              title: title,
                              start: arg.start,
                              end: arg.end,
                              allDay: arg.allDay
                            });
                    $.ajax({
                      // 이 url로 post 요청을함 
                      // 이걸 contorller 에 있는 getPost 가 받음
                      url: `/event/create`, // 데이터를 처리할 서버 측 API 엔드포인트 URL
                      method: 'POST', // 전송 방식 (POST 또는 GET)
                      dateType: "JSON", 
                      data: {
                        id: `${id}`, // 이벤트 ID
                        str_time: formetDate(arg.start,arg.allDay)  , // 이벤트 시작 시간
                        end_time: formetDate(arg.end,arg.allDay), // 이벤트 종료 시간
                        allday_chk: arg.allDay, // 종일 이벤트 여부
                        event_description: title // 이벤트 설명
                      },
                      success: function(response) {
                      //https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify
                      // JSON.stringify(response) 자바스크립트 객체를 JSON 으로 변환함
                      console.log("response : "+JSON.stringify(response));
                        // 데이터 전송 성공 시 실행할 코드
                        console.log('Data sent successfully');
                  
                        // 모달 창 닫기 및 선택 해제
                        $('#inputModal').modal("hide");
                        calendar.unselect();
                      },
                      error: function (xhr, status, error) {
                        // 데이터 전송 실패 시 실행할 코드
                        console.error('Error sending data:', error);
                      }
                    });
                  }
                });
         
                // 취소 버튼 클릭 이벤트 핸들러
                $('.btn-input-cancel').click(function () {
                    // 모달 창 닫기 및 선택 해제
                    $('#inputModal').modal("hide");
                    calendar.unselect();
                });
              },


// --------------------------------------------------------------------------------------------
           
            /* 이벤트 선택해서 수정 or 삭제하기 */
            eventClick: function (info) {
                //모달 사용 js
                // var myModal = new bootstrap.Modal(document.getElementById('myModal'), options);
                // jquery
                $('#choiceModal').modal("show");
                
                console.log(info);
                $('#choice-message-text').val(info.event.title); // 모달에 이전 내용 표시
  
                // 수정 버튼 클릭 이벤트
                $('.btn-edit').click(function () {
                  var title = $('#choice-message-text').val(); // 수정된 일정 내용 가져오기
                  if (title) {
                    info.event.setProp('title', title); // 일정 내용 변경
                  }
                  $('#choiceModal').modal("hide");
                  $('.btn-edit').off('click'); // 클릭 이벤트 핸들러 제거
                });


                // 삭제 버튼 클릭 이벤트
                $('.btn-delete').click(function () {
                    info.event.remove();
                    $('#choiceModal').modal("hide");  

					// 삭제할 데이터를 객체로 만듬
                    var obj = {
                    title: info.event._def.title,
                    start: formetDate(info.event._instance.range.start,info.event._def.allDay),
                    end: formetDate(info.event._instance.range.end,info.event._def.allDay)
                    };
                    $(function deleteData() {
                    $.ajax({
                        url: `/event/delete`,
                        method: "post",
                        dataType: "json",
                        data: obj,
                        });
                    });
                });
            }, 
//-----------------------------------sss------------------------------------------------
            events: events
          });
          // 캘린더 랜더링
          calendar.render();
      });
})();