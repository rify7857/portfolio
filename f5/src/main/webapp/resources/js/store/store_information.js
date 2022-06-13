 $(document).ready(function() {
	//img_slide();
    calendarInit();
    show_review_page(1,storeIdx);
    get_average_score(storeIdx);
 		$('#review_submit').on('click',function(){
 				if($(".review-write").val() == ""){
 					alert("내용을 작성해주세요.");
 				}else if($("#review-score-select").val() == "별점주기"){
 					alert("별점을 입력해주세요");
 				}else{
 					review_form.submit();
 					alert("작성이 완료되었습니다.");
 				}
		}); 
		$("#more-review-button").on("click",function(){
			var rpage = $("#review-page").val();
			var mpage = $("#myreview-page").val();
			if($("#all-review-list").css("display")== "none"){
				show_review_page(rpage,storeIdx);
			}else{
				show_my_review_page(mpage,sessionmemberId,storeIdx);
			}
			});
		$("#close-review-button").on("click",function(){
			$("#review-page").val(1)
			$("#myreview-page").val(1)
			var rpage = $("#review-page").val();
			var mpage = $("#myreview-page").val();
			if($("#all-review-list").css("display")== "none"){
				show_review_page(rpage,storeIdx);
			}else{
				show_my_review_page(mpage,sessionmemberId,storeIdx);
			}
			});
		$("#my-review-list").on("click",function(){
			show_my_review_page(1,sessionmemberId,storeIdx);
		});
		$("#all-review-list").on("click",function(){
			show_review_page(1,storeIdx);
		});
	
	$(".review-write").on("click",function(){
			if(sessionmemberId == ""){
				var confirm_result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
				if(confirm_result){
					$(location).attr('href', "http://localhost:9000/f5/login.do");  
				}else{
					$(this).blur();
				}
			}
	});
	 $(document).on('change','.modal-select-time',function(){
	 	if($('.modal-select-time option:selected').attr('class') == 'red-option'){
	 		alert("동시간대 예약인원이 너무 많습니다. 가게에 문의해주세요.");
	 		$('.modal-select-time option:eq(0)').prop("selected",true);
	 	}
	 });
});

function calendarInit() {

    var date = new Date(); 
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); 
    var kstGap = 9 * 60 * 60 * 1000; 
    var today = new Date(utc + kstGap); 
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
  
  
    
    var currentYear = thisMonth.getFullYear();
    var currentMonth = thisMonth.getMonth(); 
    var currentDate = thisMonth.getDate();

	renderCalender(thisMonth);

	
    function renderCalender(thisMonth) {

     
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

 
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();


        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();
		
        var currentMonth_2 =currentMonth + 1;

        $('.year-month').text(currentYear + '.' + (currentMonth + 1));
		var calendar="";
        calendar=calendar +"<table class='days'><tr><th class='day'>MON</th><th class='day'>TUE</th><th class='day'>WED</th><th class='day'>THU</th>"
        +"<th class='day'>FRI</th><th class='day'>SAT</th><th class='day'>SUN</th></tr><tr>"
        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar=calendar+'<td class="day_prev_disable">' + i + '</td>';
            if(prevDate==0){
            	calendar=calendar+'</tr><tr>'
            }
        }
        
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar=calendar+"<td><span>" + i + "</span><a class ='calendar_reservation' id='"+currentYear+"-"+currentMonth_2+"-"+i+"'>예약하기</a></td>";
            if((i+prevDay)%7 == 0){
            	calendar=calendar+'</tr><tr>'
            }
        }
        calendar.innerHTML = calendar.innerHTML +'</tr><tr>'
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar=calendar+'<td class="day_next_disable">' + i + '</td>'
        }
       		 calendar=calendar+'</tr></table>'
       	
       /* document.write(calendar); */
       		$('.dates').empty();
       		$('.dates').append(calendar);
  
    }
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
    $(document).on('click','.calendar_reservation',function(){
    	if(sessionmemberId == ""){
    		var confirm_result = confirm("로그인이 필요한 서비스입니다. 로그인페이지로 이동하시겠습니까?");
    		if(confirm_result){
					$(location).attr('href', "http://localhost:9000/f5/login.do");  
				}
    	}else{
    		var rDate = $(this).attr('id');
    		var str = "";
			str = str+"<option>--선택--</option>"
        	str = str+"<option value=1 id='1"+rDate+"'>오전</option>";
    		str = str+"<option value=2 id='2"+rDate+"'>점심시간</option>"
       		str = str+"<option value=3 id='3"+rDate+"'>13:00~15:00</option>"
       		str = str+"<option value=4 id='4"+rDate+"'>15:00~17:00</option>"
        	str = str+"<option value=5 id='5"+rDate+"'>저녘시간</option>"
       		str = str+"<option value=6 id='6"+rDate+"'>20:00 이후</option>"
       		$('.modal-select-time').empty();    
			$('.modal-select-time').append(str);  
			$('.selected-date').text($(this).attr('id'));
		    $('.selected-date-hidden').val($(this).attr('id'));
		    $('.modal-window').css("display","block");
			$('.reservation-modal').css("display","block");
			$('body').css("overflow","hidden");    		
			for(var i=1; i<7; i++){
				reservation_count_check(rDate,storeIdx,i);
			}
			
    	}
    });
    $('#reservation-close-button').on('click', function () {
    	$('.modal-window').css("display","none");
    	$('.reservation-modal').css("display","none");
    	$('body').css("overflow","auto");
    	$(".modal-select-number option:eq(0)").prop("selected",true);
    	$(".modal-select-time option:eq(0)").prop("selected",true);
	});
	$('#reservation-submit-button').on('click',function(){
		if($('.modal-select-number option:selected').val() == $(".modal-select-time option:eq(0)").val()){
			alert("인원수를 입력해주세요");
		}else if($('.modal-select-time option:selected').val()==$(".modal-select-time option:eq(0)").val()){
			alert("시간대를 입력해주세요");
		}else{
		var confirm_result=confirm($('.selected-date').text()+" 일 "+ $('.modal-select-number option:selected').val() + " "+$('.modal-select-time option:selected').val()+"(으)로 예약신청하시겠습니까?")
		if(confirm_result){
			alert("예약이 완료되었습니다.");
			$('.modal-window').css("display","none");
	    	$('.reservation-modal').css("display","none");
	    	$('body').css("overflow","auto");
	    	store_information_reservation_form.submit();
	    	$(".modal-select-number option:eq(0)").prop("selected",true);
	    	$(".modal-select-time option:eq(0)").prop("selected",true);
	    	
		}

		}
	});
   }
   
function reservation_count_check(rDate,storeIdx,rTime){
	var text = 	$("#"+rTime+rDate).text()
	$.ajax(
		{
			url:"store_reservation_count_check.do?rDate="+rDate+"&storeIdx="+storeIdx+"&rTime="+rTime,
			success : function(content){
				rObject=JSON.parse(content);
				if(rObject.result < 5  || rObject.tNumber > 6){
					$("#"+rTime+rDate).text(text+"     동시간대 예약인원이 많습니다.");
					$("#"+rTime+rDate).attr("class","red-option");
				}
			},
			error :function(){
				alert("ajax = 실패");
			}
	});
}
/****************
	이미지슬라이드
*************/


	$(document).on('click','.button_next',function(){
		if(k!=Object.keys(store_intro_img_list).length-3){
			k++;
			$('#img-div').css({'transform':'translate('+(k)*(-310)+'px,0px)','transition':'all 0.7s'});
		}
		
	});
	$(document).on('click','.button_before',function(){
		if(k!=0){
			k--;
			$('#img-div').css({'transform':'translate('+(k)*(-310)+'px,0px)','transition':'all 0.7s'});
		}
	});
	
	

	function touch_end(event) {
	  end_x = event.changedTouches[0].pageX;
	  
	  if(start_x > end_x+100){
	  if(k!=Object.keys(store_intro_img_list).length-1){
	  	k++;
		$('#img-div').css({'transform':'translate('+(k)*(-310)+'px,0px)','transition':'all 0.7s'});
		}
	  }else if(end_x>start_x+100){
	  	if(k!=0){
		k--;
		$('#img-div').css({'transform':'translate('+(k)*(-310)+'px,0px)','transition':'all 0.7s'});
		}
	  }
	  else{
			$('#img-div').css({'transform':'translate('+(k)*(-310)+'px,0px)','transition':'all 0.7s'});
		}
	};
	function touch_move(event){
		move_x = event.changedTouches[0].pageX;
		if(start_x>move_x){
			if(k!=Object.keys(store_intro_img_list).length-1){
				$('#img-div').css({'transform':'translate('+(-(start_x-move_x)-(k*310))+'px,0px)','transition':'none'});
			}
		}else{
			if(k!=0){
				$('#img-div').css({'transform':'translate('+((move_x-start_x)-(k*310))+'px,0px)','transition':'none'});
			}
		}
	};
	/* } */
	window.onresize = function(event){
		k=0;
		$('#img-div').css({'transform':'translate(0px,0px)'});
	};
	


function show_review_page(rpage,storeIdx){
		if(rpage == 1){
			$("#close-review-button").css("display","none");
		}else{
			$("#close-review-button").css("display","block");
		}
		
		$.ajax(
				{
					url :"store_information_review.do?rpage="+rpage+"&storeIdx="+storeIdx,
					success : function(content){
						const reviewObject=JSON.parse(content);
							var str='<div id="review_table">';
							for(var k in reviewObject.jlist){
								str +='<div class="store-user">';
								str +='<div class="score-mobile">';
								str +='<div><div><img src="#"></div>';
								str +='<div>'+reviewObject.jlist[k].memberId+'</div></div></div>';
								str +='<div class="store-review-content">';
								str +='<div class="review-score" id="score'+reviewObject.jlist[k].reviewIdx+'">'+reviewObject.jlist[k].reviewScore+'</div>';
								str +='<select id = "score-update'+reviewObject.jlist[k].reviewIdx+'" class = "score-update">';
								str +='<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>';
								str +='<div class="text-box"><div class="review-text" id="div'+reviewObject.jlist[k].reviewIdx+'">'+reviewObject.jlist[k].reviewContent+'</div>';
								str +='<input type = "hidden" class="review-text-update" placeholder ="'+reviewObject.jlist[k].reviewContent+'" id="input'+reviewObject.jlist[k].reviewIdx+'">';
								str +='<div class="review-update-div" id="update'+reviewObject.jlist[k].reviewIdx+'">';
								str +='<button class = "review-update-cancle" id="'+reviewObject.jlist[k].reviewIdx+'">취소</button>';
								str +='<button class = "review-update-submit" id="'+reviewObject.jlist[k].reviewIdx+'">수정완료</button></div>';
								str +='<div class="div'+reviewObject.jlist[k].memberId+'" id="review_control'+reviewObject.jlist[k].reviewIdx+'">';
								str +='<button class = "review-delete-button" id="'+reviewObject.jlist[k].reviewIdx+'">삭제</button>';
								str +='<button class = "review-update-button" id="'+reviewObject.jlist[k].reviewIdx+'">수정</button></div></div></div></div>';
						}
							str +='</div>';
								$("#review_table").remove();
								$("#review-page").after(str);
								$("#review-page").val(parseInt(rpage)+1);
								$(".review-update-div").css("display","none");
								$(".score-update").css("display","none");		
								for(var k in reviewObject.jlist){
									var memberId = reviewObject.jlist[k].memberId;
									if(sessionmemberId != reviewObject.jlist[k].memberId ){
										$('.div'+memberId).css("display","none");
									}else{
										$('.div'+memberId).css("display","block");
									}
								}
								$("#all-review-list").css("display","none");
								$("#my-review-list").css("display","block");
							},
					error : function(){
						alert("ajax 리뷰보기실패");
					}
				}
			);
				}
			$(document).on('click','.review-delete-button',function(){
				var rpage = $("#review-page").val();
				var mpage = $("#myreview-page").val();
				var delete_check = confirm("삭제하시겠습니까? 삭제된 정보는 저장되지 않습니다.");
				if(delete_check){
					$.ajax(
						{
							url : "store_review_delete.do?reviewIdx="+$(this).attr('id'),
							success : function(content){
							if(content=='1'){
								alert("삭제에 성공하였습니다.");
								if($("#all-review-list").css("display")== "none"){
									show_review_page(parseInt(rpage)-1,storeIdx);
								}else{
									show_my_review_page(parseInt(mpage)-1,sessionmemberId,storeIdx);
								}
						}
								}
							}
						);
						
					}
				});
			$(document).on('click','.review-update-button',function(){
				var review_idx=$(this).attr('id');
				$('.score-update').css("display","none");
				$('.review-score').css("display","block");
				$('#score'+review_idx).css("display","none");
				$('#score-update'+review_idx).css("display","block");
				$('.div'+sessionmemberId).css("display","block");
				$('.review-text').css('display','block');
				$('.review-text-update').attr('type','hidden');
				$('.review-update-div').css("display","none");
				$('#update'+review_idx).css("display","block");
				$('#div'+review_idx).css('display','none');
				$('#input'+review_idx).attr('type','text');
				$('#review_control'+review_idx).css('display','none');
				
			});
		
		$(document).on('click','.review-update-submit',function(){
			var rpage = $("#review-page").val();
			var mpage = $("#myreview-page").val();
			var review_idx=$(this).attr('id');
			var text = $('#input'+review_idx).val();
			var score = $('#score-update'+review_idx+ ' option:selected').val();
			if(text == ""){
				alert("내용을 입력해주세요");
			}else{
			var update_check = confirm("수정 하시겠습니까?");
			if(update_check){
				$.ajax(
					{
						url : "store_review_update.do?reviewIdx="+review_idx+"&reviewContent="+text+"&reviewScore="+score,
						
						success : function(content){
							if(content=='1'){
								alert("수정되었습니다.");
								$('#update'+review_idx).css("display","none");
								$('#review_control'+review_idx).css('display','block');
								$('#input'+review_idx).attr('type','hidden');
								$('#div'+review_idx).css('display','block');
								if($("#all-review-list").css("display")== "none"){
									show_review_page(parseInt(rpage)-1,storeIdx);
								}else{
									show_my_review_page(parseInt(mpage)-1,sessionmemberId,storeIdx);
								}
							}
						}
					}
				);
			}
			}
		});
		$(document).on('click','.review-update-cancle',function(){
			var review_idx=$(this).attr('id');
			$('#update'+review_idx).css("display","none");
			$('#review_control'+review_idx).css('display','block');
			$('#input'+review_idx).attr('type','hidden');
			$('#div'+review_idx).css('display','block');
			$('#score-update'+review_idx).css('display','none');
			$('#score'+review_idx).css('display','block');
		});
		function show_my_review_page(mpage,memberId,storeIdx){
			if(mpage == 1){
				$("#close-review-button").css("display","none");
			}else{
				$("#close-review-button").css("display","block");
			}
			$.ajax(
					{
						url :"store_information_myreview.do?mpage="+mpage+"&memberId="+memberId+"&storeIdx="+storeIdx,
						success : function(content){
							const reviewObject=JSON.parse(content);
								var str='<div id="review_table">';
								for(var k in reviewObject.jlist){
								str +='<div class="store-user">';
								str +='<div class="score-mobile">';
								str +='<div><div><img src="#"></div>';
								str +='<div>'+reviewObject.jlist[k].memberId+'</div></div></div>';
								str +='<div class="store-review-content">';
								str +='<div class="review-score" id="score'+reviewObject.jlist[k].reviewIdx+'">'+reviewObject.jlist[k].reviewScore+'</div>';
								str +='<select id = "score-update'+reviewObject.jlist[k].reviewIdx+'" class = "score-update">';
								str +='<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>';
								str +='<div class="text-box"><div class="review-text" id="div'+reviewObject.jlist[k].reviewIdx+'">'+reviewObject.jlist[k].reviewContent+'</div>';
								str +='<input type = "hidden" class="review-text-update" placeholder ="'+reviewObject.jlist[k].reviewContent+'" id="input'+reviewObject.jlist[k].reviewIdx+'">';
								str +='<div class="review-update-div" id="update'+reviewObject.jlist[k].reviewIdx+'">';
								str +='<button class = "review-update-cancle" id="'+reviewObject.jlist[k].reviewIdx+'">취소</button>';
								str +='<button class = "review-update-submit" id="'+reviewObject.jlist[k].reviewIdx+'">수정완료</button></div>';
								str +='<div class="div'+reviewObject.jlist[k].memberId+'" id="review_control'+reviewObject.jlist[k].reviewIdx+'">';
								str +='<button class = "review-delete-button" id="'+reviewObject.jlist[k].reviewIdx+'">삭제</button>';
								str +='<button class = "review-update-button" id="'+reviewObject.jlist[k].reviewIdx+'">수정</button></div></div></div></div>';
						}
								str +='</div>';
									$("#review_table").remove();
									$("#myreview-page").after(str);
									$("#myreview-page").val(parseInt(mpage)+1);
									$(".review-update-div").css("display","none");
									$(".score-update").css("display","none");	
									for(var k in reviewObject.jlist){
										var memberId = reviewObject.jlist[k].memberId;
										if(sessionmemberId != reviewObject.jlist[k].memberId ){
											$('.div'+memberId).css("display","none");
										}else{
											$('.div'+memberId).css("display","block");
										}
									}
									$("#all-review-list").css("display","block");
									$("#my-review-list").css("display","none");
								},
						error : function(){
							alert("ajax 내리뷰보기실패");
						}
					}
				);
					
		}
function get_average_score(storeIdx){
	$.ajax(
		{	url : "store_information_score.do?storeIdx="+storeIdx,
			success : function(content){
				$("#average-score").append(content);
			},
			error : function(){
				alert("평점실패");
			}
	});
};