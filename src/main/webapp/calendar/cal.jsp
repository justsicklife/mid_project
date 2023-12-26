<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko-kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>
    <!-- 부트 스트랩 css 링크 ver.5.0.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- cal.css 적용 -->
    <link rel="stylesheet" href="../calendar/cal.css">
    <!-- 풀캘린더 cdn -->
    <link href='../calendar/fullcalcss.css' rel='stylesheet' />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</head>

<body>
    <!-- 부트 스트랩 nav bar -->
 	<%@ include file="../nevimenu/nevimenu.jsp" %>
<!-- 모달 -->
  <!-- 입력 Modal -->
  <div class="modal fade" id="inputModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        
        <div class="modal-header border-0">
            <!-- <h5 class="modal-title" id="exampleModalLabel">골라</h5> -->
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <div class="mb-3">
            <label for="message-text" class="col-form-label">Schedule</label>
            <textarea class="form-control" id="input-message-text"></textarea>
        </div>

        <div class="modal-footer border-0">
          <button type="button" class="btn btn-input" >●</button>
          <button type="button" class="btn btn-input-cancle">●</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 이동 Modal -->
  <div class="modal fade" id="moveModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header border-bottom-0">
            <!-- <h5 class="modal-title" id="exampleModalLabel">골라</h5> -->
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="mb-3">
            <label for="message-text" class="col-form-label">Schedule</label>
            <textarea class="form-control" id="move-message-text"></textarea>
        </div>
        <div class="modal-footer border-0">
          <button type="button" class="btn btn-move-check" >●</button>
          <button type="button" class="btn btn-move-cancel">●</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 수정, 삭제 Modal -->
  <div class="modal fade" id="choiceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header border-bottom-0">
            <!-- <h5 class="modal-title" id="exampleModalLabel">골라</h5> -->
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="mb-3">
            <label for="message-text" class="col-form-label">Schedule</label>
            <textarea class="form-control" id="choice-message-text"></textarea>
        </div>
        <div class="modal-footer border-0">
          <button type="button" class="btn btn-edit" >●</button>
          <button type="button" class="btn btn-delete">●</button>
        </div>
      </div>
    </div>
  </div>
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
    <!-- calendar 태그 -->
    <div id="calendar-container">
      <div
    id="calendar"
    class="fc fc-media-screen fc-direction-ltr fc-theme-standard">
    <div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr">
        <div class="fc-toolbar-chunk">
            <div class="fc-button-group">
                <button
                    class="fc-prev-button fc-button fc-button-primary"
                    type="button"
                    aria-label="prev">
                    <span class="fc-icon fc-icon-chevron-left"></span>
                </button>
                <button
                    class="fc-next-button fc-button fc-button-primary"
                    type="button"
                    aria-label="next">
                    <span class="fc-icon fc-icon-chevron-right"></span>
                </button>
            </div>
            <button
                disabled=""
                class="fc-today-button fc-button fc-button-primary"
                type="button">today</button>
            <button
                disabled=""
                class="fc-diary fc-button fc-button-primary"
                type="button">diary</button>    
        </div>
        <div class="fc-toolbar-chunk">
            <h2 class="fc-toolbar-title">2023년 6월</h2>
        </div>
        <div class="fc-toolbar-chunk">
            <div class="fc-button-group">
                <button
                    class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active"
                    type="button">month</button>
                <button
                    class="fc-timeGridWeek-button fc-button fc-button-primary"
                    type="button">week</button>
                <button class="fc-timeGridDay-button fc-button fc-button-primary" type="button">day</button>
                <button class="fc-listWeek-button fc-button fc-button-primary" type="button">list</button>
            </div>
        </div>
    </div>
    <div class="fc-view-harness fc-view-harness-active">
        <div class="fc-daygrid fc-dayGridMonth-view fc-view">
            <table class="fc-scrollgrid  fc-scrollgrid-liquid">
                <thead>
                    <tr class="fc-scrollgrid-section fc-scrollgrid-section-header ">
                        <td>
                            <div class="fc-scroller-harness">
                                <div class="fc-scroller" style="overflow: hidden;">
                                    <table class="fc-col-header " style="width: 619px;">
                                        <colgroup></colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="fc-col-header-cell fc-day fc-day-sun">
                                                    <div class="fc-scrollgrid-sync-inner">
                                                        <a class="fc-col-header-cell-cushion "></a>
                                                    </div>
                                                </th>
                                                <th class="fc-col-header-cell fc-day fc-day-mon">
                                                    <div class="fc-scrollgrid-sync-inner">
                                                        <a class="fc-col-header-cell-cushion ">월</a>
                                                    </div>
                                                </th>
                                                <th class="fc-col-header-cell fc-day fc-day-tue">
                                                    <div class="fc-scrollgrid-sync-inner">
                                                        <a class="fc-col-header-cell-cushion ">화</a>
                                                    </div>
                                                </th>
                                                <th class="fc-col-header-cell fc-day fc-day-wed">
                                                    <div class="fc-scrollgrid-sync-inner">
                                                        <a class="fc-col-header-cell-cushion ">수</a>
                                                    </div>
                                                </th>
                                                <th class="fc-col-header-cell fc-day fc-day-thu">
                                                    <div class="fc-scrollgrid-sync-inner">
                                                        <a class="fc-col-header-cell-cushion ">목</a>
                                                    </div>
                                                </th>
                                                <th class="fc-col-header-cell fc-day fc-day-fri">
                                                    <div class="fc-scrollgrid-sync-inner">
                                                        <a class="fc-col-header-cell-cushion ">금</a>
                                                    </div>
                                                </th>
                                                <th class="fc-col-header-cell fc-day fc-day-sat">
                                                    <div class="fc-scrollgrid-sync-inner">
                                                        <a class="fc-col-header-cell-cushion ">토</a>
                                                    </div>
                                                </th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr
                        class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
                        <td>
                            <div class="fc-scroller-harness fc-scroller-harness-liquid">
                                <div
                                    class="fc-scroller fc-scroller-liquid-absolute"
                                    style="overflow: hidden auto;">
                                    <div class="fc-daygrid-body fc-daygrid-body-balanced " style="width: 619px;">
                                        <table class="fc-scrollgrid-sync-table" style="width: 619px; height: 541px;">
                                            <colgroup></colgroup>
                                            <tbody>
                                                <tr>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other"
                                                        data-date="2023-05-28">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-05-28&quot;,&quot;type&quot;:&quot;a}"
                                                                    tabindex="0">28</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other"
                                                        data-date="2023-05-29">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-05-29&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">29</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-tue fc-day-past fc-day-other"
                                                        data-date="2023-05-30">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-05-30&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">30</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-wed fc-day-past fc-day-other"
                                                        data-date="2023-05-31">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-05-31&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">31</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td class="fc-daygrid-day fc-day fc-day-thu fc-day-past" data-date="2023-06-01">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-01&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">1</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td class="fc-daygrid-day fc-day fc-day-fri fc-day-pastw" data-date="2023-06-02">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-02&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">2</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td class="fc-daygrid-day fc-day fc-day-sat fc-day-past" data-date="2023-06-03">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-03&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">3</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fc-daygrid-day fc-day fc-day-sun fc-day-past" data-date="2023-06-04">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-04&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">4</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td class="fc-daygrid-day fc-day fc-day-mon fc-day-past" data-date="2023-06-05">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-05&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">5</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-tue fc-day-today "
                                                        data-date="2023-06-06">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-06&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">6</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
                                                        data-date="2023-06-07">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-07&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">7</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
                                                        data-date="2023-06-08">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-08&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">8</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
                                                        data-date="2023-06-09">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-09&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">9</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sat fc-day-future"
                                                        data-date="2023-06-10">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-10&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">10</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sun fc-day-future"
                                                        data-date="2023-06-11">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-11&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">11</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-mon fc-day-future"
                                                        data-date="2023-06-12">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-12&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">12</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-tue fc-day-future"
                                                        data-date="2023-06-13">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-13&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">13</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
                                                        data-date="2023-06-14">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-14&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">14</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
                                                        data-date="2023-06-15">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-15&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">15</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
                                                        data-date="2023-06-16">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-16&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">16</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sat fc-day-future"
                                                        data-date="2023-06-17">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-17&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">17</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sun fc-day-future"
                                                        data-date="2023-06-18">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-18&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">18</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-mon fc-day-future"
                                                        data-date="2023-06-19">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-19&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">19</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-tue fc-day-future"
                                                        data-date="2023-06-20">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-20&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">20</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
                                                        data-date="2023-06-21">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-21&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">21</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
                                                        data-date="2023-06-22">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-22&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">22</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
                                                        data-date="2023-06-23">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-23&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">23</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sat fc-day-future"
                                                        data-date="2023-06-24">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-24&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">24</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sun fc-day-future"
                                                        data-date="2023-06-25">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-25&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">25</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-mon fc-day-future"
                                                        data-date="2023-06-26">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-26&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">26</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-tue fc-day-future"
                                                        data-date="2023-06-27">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-27&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">27</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
                                                        data-date="2023-06-28">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-28&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">28</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
                                                        data-date="2023-06-29">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-29&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">29</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
                                                        data-date="2023-06-30">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-06-30&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">30</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other"
                                                        data-date="2023-07-01">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-01&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">1</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sun fc-day-future fc-day-other"
                                                        data-date="2023-07-02">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-02&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">2</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-mon fc-day-future fc-day-other"
                                                        data-date="2023-07-03">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-03&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">3</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other"
                                                        data-date="2023-07-04">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-04&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">4</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other"
                                                        data-date="2023-07-05">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-05&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">5</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other"
                                                        data-date="2023-07-06">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-06&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">6</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other"
                                                        data-date="2023-07-07">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-07&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">7</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                    <td
                                                        class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other"
                                                        data-date="2023-07-08">
                                                        <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                            <div class="fc-daygrid-day-top">
                                                                <a
                                                                    class="fc-day-number"
                                                                    data-navlink="{&quot;date&quot;:&quot;2023-07-08&quot;,&quot;type&quot;:&quot;day&quot;}"
                                                                    tabindex="0">8</a>
                                                            </div>
                                                            <div class="fc-daygrid-day-events">
                                                                <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                            </div>
                                                            <div class="fc-daygrid-day-bg"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 
	****
 -->
<div data-id="${ id }" id="id"></div>

<!-- <body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload=""> -->
    
<!-- ---------------------------------------------------------------- -->
    <!-- fullcalendar js -->
    <script src="../calendar/fullcaljs.js"></script>
    <!-- fullcalendar 언어 CDN -->
    <script src="../calendar/fullcal02.js"></script>
    <!-- jQuery CDN ver.3.7.0 -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <!-- 부트 스트랩 js 번들 ver.5.0.2 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="../calendar/cal.js"></script>
</body>
</html>

