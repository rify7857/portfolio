<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gangnam Foodly</title>
<link href="/f5/resources/css/store/store.css" rel="stylesheet" />
<script src="/f5/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/f5/resources/css/am-pagination.css">
<script>
	$(document).ready(function(){
		var search = "${search}";
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${reqPage}',		// initial page		
		    pageSize: '${pageSize}',			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		jQuery('.showlabelsm').text('The selected page no: '+e.page);
		
		if ( search != "" ) {
			
			$(".col-lg-6").remove();
			$.ajax({
				url : "store_search_json.do?rpage="+e.page+"&search="+search,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						var str = "<div class='col-lg-6'>";
						if ( data.jlist[i].rno % 4 == 1 || data.jlist[i].rno % 4 == 3 ) {
							
								str += "<div class='store-card mb-4'>";
									str += "<a href='#!'><img class='card-img-top' src='/f5/resources/upload/"+data.jlist[i].suFile1+"' alt='...' /></a>";
									str += "<div class='card-body'>";
										str += "<h2 class='card-title h4'>"+data.jlist[i].storeName+"</h2>";
										str += "<p class='card-text'>"+data.jlist[i].storePlace+"</p>";
										str += "<a class='btn btn-primary' href='store_information.do?storeIdx="+data.jlist[i].storeIdx+"'>매장 보러가기 →</a>";
									str += "</div>";
								str += "</div>";
						}
						if ( data.jlist[i].rno % 4 == 2 || data.jlist[i].rno % 4 == 0 ) {
							
								str += "<div class='store-card mb-4'>";
								str += "<a href='#!'><img class='card-img-top' src='/f5/resources/upload/"+data.jlist[i].suFile1+"' alt='...' /></a>";
								str += "<div class='card-body'>";
								str += "<h2 class='card-title h4'>"+data.jlist[i].storeName+"</h2>";
								str += "<p class='card-text'>"+data.jlist[i].storePlace+"</p>";
								str += "<a class='btn btn-primary' href='store_information.do?storeIdx="+data.jlist[i].storeIdx+"'>매장 보러가기 →</a>";
								str += "</div>";
								str += "</div>";
						}
							str += "</div>";
						$(".store_content").append(str);
					}
				}
			});
		} else {
			
			$(".col-lg-6").remove();
			$.ajax({
				url : "store_search_json.do?rpage="+e.page+"&search="+search,
				success : function(result) {
					
					const data = JSON.parse(result);
					
					for ( var i in data.jlist ) {
						var str = "<div class='col-lg-6'>";
						if ( data.jlist[i].rno % 4 == 1 || data.jlist[i].rno % 4 == 3 ) {
							
								str += "<div class='store-card mb-4'>";
									str += "<a href='#!'><img class='card-img-top' src='/f5/resources/upload/"+data.jlist[i].suFile1+"' alt='...' /></a>";
									str += "<div class='card-body'>";
										str += "<h2 class='card-title h4'>"+data.jlist[i].storeName+"</h2>";
										str += "<p class='card-text'>"+data.jlist[i].storePlace+"</p>";
										str += "<a class='btn btn-primary' href='store_information.do?storeIdx="+data.jlist[i].storeIdx+"'>매장 보러가기 →</a>";
									str += "</div>";
								str += "</div>";
						}
						if ( data.jlist[i].rno % 4 == 2 || data.jlist[i].rno % 4 == 0 ) {
							
								str += "<div class='store-card mb-4'>";
								str += "<a href='#!'><img class='card-img-top' src='/f5/resources/upload/"+data.jlist[i].suFile1+"' alt='...' /></a>";
								str += "<div class='card-body'>";
								str += "<h2 class='card-title h4'>"+data.jlist[i].storeName+"</h2>";
								str += "<p class='card-text'>"+data.jlist[i].storePlace+"</p>";
								str += "<a class='btn btn-primary' href='store_information.do?storeIdx="+data.jlist[i].storeIdx+"'>매장 보러가기 →</a>";
								str += "</div>";
								str += "</div>";
						}
							str += "</div>";
						$(".store_content").append(str);
					}
				}
			});
		}
	});
		
 	});
</script> 
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row store_content">
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <c:forEach var="vo"  items="${list}">
                            <c:choose>
                            <c:when test="${vo.rno % 4 == 1 || vo.rno % 4 == 3}">
	                            <div class="store-card mb-4">
	                                <a href="#!"><img class="card-img-top" src="/f5/resources/upload/${vo.suFile1 }" alt="..." /></a>
	                                <div class="card-body">
	                                    <h2 class="card-title h4">${vo.storeName }</h2>
	                                    <p class="card-text">${vo.storePlace }</p>
	                                    <a class="btn btn-primary" href="store_information.do?storeIdx=${vo.storeIdx }">매장 보러가기 →</a>
	                                </div>
	                            </div>
	                        </c:when>
                            </c:choose>
                            </c:forEach>
                        </div>
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <c:forEach var="vo"  items="${list}">
                            <c:choose>
                            <c:when test="${vo.rno % 4 == 2 || vo.rno % 4 == 0}">
                            <div class="store-card mb-4">
                                <a href="#!"><img class="card-img-top" src="/f5/resources/upload/${vo.suFile1 }" alt="..." /></a>
                                <div class="card-body">
                                    <h2 class="card-title h4">${vo.storeName }</h2>
                                    <p class="card-text">${vo.storePlace }</p>
                                    <a class="btn btn-primary" href="store_information.do?storeIdx=${vo.storeIdx }">매장 보러가기 →</a>
                                </div>
                            </div>
	                        </c:when>
                            </c:choose>                           
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
						
						<!-- 지도 css -->          
                  
               <style>
                 
                 .customoverlay {position:relative;bottom:37px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
                 .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
                 .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #ffc107;background: #ffc107 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
                 .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:5px 5px;font-size:14px;font-weight:bold;}
                 .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}                 
                 
          </style>
                
                <!-- 지도 기능 --> 
                 
                 <div id="map" style="width:100%;height:200px;"></div>
                 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c88216da6af0d0b0fef722865614d397"></script>
                             <script>
                 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                 mapOption = { 
                 center: new kakao.maps.LatLng(37.49808768696724, 127.02800593024848), // 지도의 중심좌표
                 level: 5 // 지도의 확대 레벨
            };

                 var map = new kakao.maps.Map(mapContainer, mapOption);

                 var imageSrc = '/f5/resources/images/mapicon.png', // 마커이미지의 주소입니다    
                 imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
                 imageOption = {offset: new kakao.maps.Point(20, 25)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                 markerPosition = new kakao.maps.LatLng(37.49808768696724, 127.02800593024848); // 마커가 표시될 위치입니다

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                position: markerPosition,
                image: markerImage // 마커이미지 설정 
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);  

                // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                var content = '<div class="customoverlay">' +
                '  <a href= https://map.naver.com/v5/search/%EA%B0%95%EB%82%A8%EA%B5%AC%20%EB%A7%9B%EC%A7%91?c=14141000.0748800,4511459.8281494,13,0,0,0,dh&isCorrectAnswer=true>' +
                '    <span class="title">강남구 맛집</span>' +
                '  </a>' +
                '</div>';

                // 커스텀 오버레이가 표시될 위치입니다 
                var position = new kakao.maps.LatLng(37.49808768696724, 127.02800593024848);  

                // 커스텀 오버레이를 생성합니다
                var customOverlay = new kakao.maps.CustomOverlay({
                map: map,
                position: position,
                content: content,
                yAnchor: 1 
          });
                </script>
                        
                        </div>
                    </div>
                
                <!-- 끝 -->  	
                   
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Categories</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">#중국집</a></li>
                                        <li><a href="#!">#일식집</a></li>
                                        <li><a href="#!">#치킨집</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">#분식집</a></li>
                                        <li><a href="#!">#돈까스집</a></li>
                                        <li><a href="#!">#한식집</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">이런 검색어는 어때요?</div>
                       <div class = "card-body"> 
                        <div class="card-body">
                        	<div><a href = "#">짜장면 맛집 모아보기!</a></div>
                        </div>
                        
                    </div>
                </div>
                 <!-- Pagination-->
            </div>
            <div id="paging" style="text-align: center;">
				<div id="ampaginationsm"></div>
            </div>
        </div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script src="http://localhost:9000/f5/resources/js/am-pagination.js"></script>
</body>
</html>

