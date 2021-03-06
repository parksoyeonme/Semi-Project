<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="store.model.vo.Review"%>
<%@page import="store.model.vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Store store = (Store)request.getAttribute("store");
List<Review> list = (List<Review>)request.getAttribute("list");
String pageBar = (String)request.getAttribute("pageBar");

boolean isBookmark = false;
if(request.getAttribute("isBookmark") != null){
	isBookmark = (Boolean)request.getAttribute("isBookmark");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />

<!-- JS, Popper.js, and jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- icon fontawesome -->
<link rel="icon" href="data:;base64,iVBORw0KGgo="/>
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<!-- storeview css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/storeview.css" />

<!-- ?????????(??????) ??????????????? ?????? -->
<script src="<%=request.getContextPath()%>/js/newTpl.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/newTpl.css" />

<!-- jqcloud.css ???????????? -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jqcloud.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jqcloud-1.0.4.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
 <%@ include file="/WEB-INF/view/common/header.jsp" %>

<!-- ???????????? ?????? -->

<title>HoneyPlate</title>
 
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }

    </style>
     <script>
    // ?????? ????????? ????????? ?????? ????????? ????????????.
    function initMap() {
        // ????????????(???kh)??????, ?????? ??????
        var kh = {lat: 37.49922, lng: 127.03290};
        // ?????? ?????? ????????? ????????????, ????????? (????????????)kh??? ?????????.
        var map = new google.maps.Map(
            document.getElementById('map'), {zoom: 15, center: kh});
        // kh ?????? ????????? ??????????????? ??????
        var marker = new google.maps.Marker({position: kh, map: map});
    };
    
   
   	 var word_array = [
        {text: "??????????????????", weight: 10},
        {text: "????????????", weight: 6, link: "https://www.mangoplate.com/"},
        {text: "????????????", weight: 6, html: {title: "5???????????? ???????????????"}},
        {text: "?????????", weight: 7},
        {text: "?????????", weight: 5}
        // ...as many words as you want
    ];
    

    $(function() {
    	  // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
      $("div#store-hashtag").jQCloud(word_array);
    	
    	 
    	  
    	 
    	<%if(isBookmark){%>
    		$(".fa-star").removeClass("far");
    		$(".fa-star").addClass("fas");
    	<%}%>
    	
   		$("#bookmark-btn").click(function(){

   			<%if(member != null){%>
	   			$(".fa-star").toggleClass("far"); //far : ????????? X
	   			$(".fa-star").toggleClass("fas"); //fas : ????????? ??????
	   			
	   			if($(".fa-star").hasClass("fas")){
	   				$.ajax({
	   					type:"get",
	   					url:"<%=request.getContextPath()%>/store/bookmark/add",
	   					dataType:"text",
	   					data:{memberId:"<%=member.getMemberId()%>",store_no:"<%=store.getBoard_no()%>"},
	   					}); //end of ajax
	   					
	   			}else if($(".fa-star").hasClass("far")){
	   				$.ajax({
	   					type:"get",
	   					url:"<%=request.getContextPath()%>/store/bookmark/remove",
	   					dataType:"text",
	   					data:{memberId:"<%=member.getMemberId()%>",store_no:"<%=store.getBoard_no()%>"},
	   					}); //end of ajax   					
	   			}
   			<%}%>
   		})
   		
   		
    });
    
    
    
    
</script>
  </head>
    <hr />
    <!-- ??????????????? ???????????? ??? ??? -->
    
	<div class="swiper-container col-md-12">
		
		<% Review r1 = list != null && list.size() >= 1 ? list.get(0) : null;%>
		<div class="swiper-wrapper">
		<%if(r1.getReviewRenamedFileName1() !=null){%>
			<div class="swiper-slide"><img class="swiper-slide img" src="<%= request.getContextPath()%>/upload/store/<%= r1.getReviewRenamedFileName1()%>" /></div>
		<%} %>
		<%if(r1.getReviewRenamedFileName2() !=null){%>
			<div class="swiper-slide"><img class="swiper-slide img" src="<%= request.getContextPath()%>/upload/store/<%= r1.getReviewRenamedFileName2()%>" /></div>
		<%} %>
		<%if(r1.getReviewRenamedFileName3() !=null){%>
			<div class="swiper-slide"><img class="swiper-slide img" src="<%= request.getContextPath()%>/upload/store/<%= r1.getReviewRenamedFileName3()%>" /></div>
		<%} %>
		
		<%try{%>
			<% Review r2 = list.get(1);%>
			<%if(r2.getReviewRenamedFileName1() !=null){%>
				<div class="swiper-slide"><img class="swiper-slide img" src="<%= request.getContextPath()%>/upload/store/<%= r2.getReviewRenamedFileName1()%>" /></div>
			<%} %>
			<%if(r2.getReviewRenamedFileName2() !=null){%>
				<div class="swiper-slide"><img class="swiper-slide img" src="<%= request.getContextPath()%>/upload/store/<%= r2.getReviewRenamedFileName2()%>" /></div>
			<%} %>
			<%if(r2.getReviewRenamedFileName3() !=null){%>
				<div class="swiper-slide"><img class="swiper-slide img" src="<%= request.getContextPath()%>/upload/store/<%= r2.getReviewRenamedFileName3()%>" /></div>
			<%} %>
		<%}catch(Exception e){%>
		<%} %>
		</div>
		<!-- ??????????????? -->
		<div class="swiper-button-next"></div><!-- ?????? ?????? (???????????? ?????? ??????) -->
		<div class="swiper-button-prev"></div><!-- ?????? ?????? -->
	
		<!-- ????????? -->
		<div class="swiper-pagination"></div>
	</div>
      <br />
       <div class="row">
         <div class="col-md-8">
         <div class= detail-info>
          <table class="table">
            <thead>
              <tr></tr>
                <th scope="col" colspan="2" style="font-size:30px; color: #FFA726;">
                <%= store.getStore_name()%>
                <div class="store-view-num">
	                <span><i class="far fa-eye"></i><%=store.getView_num() %></span>
	                <span><i class="far fa-calendar-check"></i><%=store.getReservation_num()%></span>
                </div>
                </th>
               
                <th scope="col"></th>
                <th scope="col"></th>
                
               <th scope="col"></th>
                 <%-----------------  ????????? ?????????,???????????? ??????   ---------------------%>
                <%if(member != null && member.getMemberRole().equals(MemberService.MEMBER_ROLE_BUSINESS)
                	&& store.getMember_id().equals(member.getMemberId())){%>
	                <th scope="col" style="width: 12%; text-align:center;">
                		<i class="fas fa-wrench" style="font-size: 30px; padding-left: 5px; color: #FFA726;"></i>
                  		<a href="<%=request.getContextPath()%>/store/storeUpdate?boardNo=<%=store.getBoard_no()%>"><br>????????????</a>          
	                </th>
                
                <%}else if(member != null && member.getMemberRole().equals(MemberService.MEMBER_ROLE_CUSTOMER)){%>
	           
	                <th scope="col" style="width: 12%; text-align:center;">
	                	<button id="bookmark-btn">
	                		<i class="far fa-star" style="font-size: 30px; padding-left: 14px; color: #FFA726;"></i>
	                	</button>
	                  	<span><br>????????????</span>
	                </th>                
	                <th scope="col"><i class="fas fa-edit" style="font-size: 30px;  color: #FFA726;"></i>
	                  <a href="<%=request.getContextPath()%>/store/writereview?store_no=<%=store.getBoard_no()%>"><br>????????????</a></th>
	                 
	                <!-- location.href='<%= request.getContextPath() %>/store/writereview'; -->
	                <th scope="col"><i class="fas fa-shopping-cart" style="font-size: 30px;  color: #FFA726;"></i>
	                  <a href="<%=request.getContextPath()%>/reservation/request?store_no=<%=store.getBoard_no()%>"><br>????????????</a></th>
				<%}%>
	              </tr>
            </thead>
            <tbody>
	            <tr>
	                <th scope="row" class="sto-phone">????????????</th>
	                <td><%= store.getStore_phone()%></td>
	              </tr>
	             <tr>
                <tr>
	                <th scope="row" class="sto-location">??????</th>
	                <td style="width: 602px;"><%= store.getLocation()%></td>
              	</tr>
              	<%if(store.getClosing_day() !=null){ %>
              	<tr>
	                <th scope="row" class="sto-rest">??????</th>
	                <td><%= store.getClosing_day()%></td>
             	</tr>
             	 <%} %>
             	<tr>
	                <th scope="row" class="sto-open">????????????</th>
	                <td><%= store.getOpen_hours()%></td>
             	</tr>
	            <tr>
	               <th scope="row" class="sto-close" style="width:500px">???????????????</th>
	               <td><%= store.getClose_hours()%></td>
	            </tr>
              <%if(store.getBreaktime_close()!=null){ %>
	            <tr>
	               <th scope="row" class="sto-braketime">????????????????????????</th>
	               <td><%= store.getBreaktime_open()%></td>
	            </tr>
	            <tr>
	              <th scope="row" class="sto-braketime">?????????????????????</th>
	              <td><%= store.getBreaktime_close()%></td>
	            </tr>
	            <%} %>
	            <tr>
	                <th scope="row" class="sto-menu">????????????</th>
	                <td><%= store.getMenu()%></td>
	            </tr>
	            <tr>
	               <th scope="row" class="sto-parking">??????</th>
	               <td><%= store.getParking()%></td>
	             </tr>
              
            </tbody>
          </table>
           </div>
          <hr />
           <div class= "col-md-7" >
            <div class="review-info">
          <h5 style="font-size:30px; font-weight: bold;">??????</h5>
          <table class="type08">
            <thead>
            <tr>
              <th scope="cols" colspan="2"></th>
             
            </tr>
            </thead>
            <tbody>
            <% if(list == null || list.isEmpty()) { %>
            <tr>
				<td colspan="2" style="text-align:center;">
					????????? ????????? ????????????.
				</td>
			</tr>
		
			<% } else { 
			for(Review r : list) { %>
            <tr>
              <th scope="row" rowspan="2"><i class="far fa-grin-alt review-icon" style="font-size: 62px; padding-left: 14px;"></i></th>
              <td><%= r.getReview_date()%></td>
            </tr>
            <tr>
             
              <td><%= r.getRating()%>
              <!--  <input type="button" value="????????????" onclick="reviewDelete();" /></td>
            </tr>
            	<script>
            	function reviewDelete(){
        			if(confirm("??? ???????????? ?????????????????????????")){
        				$("[name=reviewDeleteFrm]").submit();
        			}
        		}
            	</script>
            	<form 
			action="<%= request.getContextPath() %>/review/reviewDelete"
			method="post"
			name="reviewDeleteFrm">
			<input type="hidden" name="reviewNo" value="<%= r.getReview_no() %>"/>
			<input type="hidden" name="rName1" value="<%= r.getReviewRenamedFileName1() != null ? r.getReviewRenamedFileName1() : "" %>" />
			<input type="hidden" name="rName2" value="<%= r.getReviewRenamedFileName2() != null ? r.getReviewRenamedFileName2() : "" %>" />
			<input type="hidden" name="rName3" value="<%= r.getReviewRenamedFileName3() != null ? r.getReviewRenamedFileName3() : "" %>" />
			/>
		</form>-->
            <tr>
             <th scope="row" rowspan="2" style="text-align: center;"><%= r.getMember_id()%></th>
              <td><%= r.getReview_content()%></td>
            </tr>
            <tr>
            <td>
             <%if(r.getReviewRenamedFileName1() !=null){%>
             <img style="height: 170px; width:170px;" src="<%= request.getContextPath()%>/upload/store/<%= r.getReviewRenamedFileName1()%>"/>
	          <%} %>
	          <%if(r.getReviewRenamedFileName2() !=null){%>
             <img style="height: 170px; width:170px;" src="<%= request.getContextPath()%>/upload/store/<%= r.getReviewRenamedFileName2()%>"/>
              <%} %>
              <%if(r.getReviewRenamedFileName3() !=null){%>
             <img style="height: 170px; width:170px;" src="<%= request.getContextPath()%>/upload/store/<%= r.getReviewRenamedFileName3()%>"/>
             <%} %>
             </td>
            </tr>
            <% 	} 
		  } %>
            </tbody>
          </table>
        </div> 
          </div>
			<div id='pageBar' style="margin-left: 50%;"><%=request.getAttribute("pageBar") %></div>
         </div>
      
         
         <div class="col-md-3">
          <ul class="nav">
            <div style="border: solid 2px gray; height: 300px;" class= "col-md-12">
              	<div id="map"></div>
            </div>
         
            <div style="border: solid 2px gray; height: 400px;" class= "around_sto col-md-12">
              <h6 >??????????????????</h6>
              <br />
             <div class="col-md-12">
               
                <table class="table">
                  <tbody>
                    <tr>
                      <th scope="row" rowspan="3"><img src="<%=request.getContextPath()%>/images/store/maralog.PNG" onclick="javascript:location.href='<%=request.getContextPath()%>/store/storedetail?board_no=11';" alt="" style="width: 75%; height:80px;"></a></th>
                      <td style=" text-align: left; padding: 0px; border-bottom: none; font-weight: bold;">??????????????????</th>
                    </tr>
                    <tr>
                      <td style="text-align: left; padding: 0px; border-bottom: none; ">????????????: ?????? ??????</td>
                    </tr>
                    <tr>
                      <td style="text-align: left; padding: 0px; border-bottom: none;">??????: ??????/?????????</td>
                    </tr>
                    
                    <tr>
                      <th scope="row" rowspan="3"><img src="<%=request.getContextPath()%>/images/store/jimme.PNG" onclick="javascript:location.href='<%=request.getContextPath()%>/store/storedetail?board_no=4';" alt="" style="width: 75%; height:80px;"></a></th>
                      <td style=" text-align: left; padding: 0px; border-bottom: none; font-weight: bold;">????????????</th>
                    </tr>
                    <tr>
                      <td style="text-align: left; padding: 0px; border-bottom: none; ">????????????: ?????????/??????</td>
                    </tr>
                    <tr>
                      <td style="text-align: left; padding: 0px; border-bottom: none;">??????: ??????/??????</td>
                    </tr>
                   
                   <tr>
                      <th scope="row" rowspan="3"><img src="<%=request.getContextPath()%>/images/store/jinmandu.PNG" onclick="javascript:location.href='<%=request.getContextPath()%>/store/storedetail?board_no=17';" alt="" style="width: 75%; height:80px;"></a></th>
                      <td style=" text-align: left; padding: 0px; border-bottom: none; font-weight: bold;">?????????</th>
                    </tr>
                    <tr>
                      <td style="text-align: left; padding: 0px; border-bottom: none; ">????????????: ??????/??????</td>
                    </tr>
                    <tr>
                      <td style="text-align: left; padding: 0px; border-bottom: none;">??????: ??????/??????</td>
                    </tr>
                   
                    
                  </tbody>
                  </table> 
                              
              </div>
            </div>
            
            
            <div style="border: solid 2px gray; height: 150px;" class= "col-md-12">
              <h6>????????????</h6>
               <div id="store-hashtag" style="width: 400px; height: 100px;"></div>
            	
            </div>
          </ul>
        </div>
       </div>
      
       <hr />
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
     
    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6b_r5mPKTEWuNQ4jO_L0y5v7ivsh22FQ&callback=initMap&libraries=&v=weekly"
      async
    ></script>
  <body> 
  <script>
    new Swiper('.swiper-container', {
    
    slidesPerView : 3, // ????????? ????????? ???????????? ??????
    spaceBetween : 30, // ??????????????? ??????
    slidesPerGroup : 3, // ???????????? ?????? ???, slidesPerView ??? ?????? ?????? ??????????????? ??????
    autoplay: {
        delay: 2000,
      },
    // ???????????? ?????? ?????? ?????? ???????????? ?????????
    // 3?????? ????????? ????????? 1?????? ????????? 2?????? ???????????? ????????? 3?????? ??????
//     loopFillGroupWithBlank : true,
    
    loop : true, // ?????? ??????
    
    pagination : { // ?????????
      el : '.swiper-pagination',
      clickable : true, // ???????????? ???????????? ?????? ???????????? ??????, ????????? ????????? ?????? ?????? ??????
    },
    navigation : { // ???????????????
      nextEl : '.swiper-button-next', // ?????? ?????? ????????????
      prevEl : '.swiper-button-prev', // ?????? ?????? ????????????
    },
    });
          
    </script>
</html>