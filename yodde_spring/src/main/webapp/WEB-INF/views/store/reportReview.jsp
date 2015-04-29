<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>신고</title>
      
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/review/review.css" />
   </head>
   <body>
   
   
      <form action="${root}/reportReview" method="post">
         <div class="content">
            <div class="title">
               <img src="${root}/resources/images/images/report_title.png" height="30px;">
            </div>
            <ul>
               <!-- 신고당할 사람의 닉네임 끌어오기 -->
               <li>
                  <div class="sub">
                     대상
                  </div>
                  <input type="text" value="${writer}" class="review_nick" name="reportNick" readonly>
               </li>
               
               <!-- 신고할 리뷰의 내용 끌어오기 -->
               <li>
                  <div class="sub">
                     내용
                  </div>
                  <textarea cols="80" class="review_content"  name="reviewContent" style="resize:none;"readonly>${content}</textarea>
               </li>
               
               <li>
                  <div class="sub">
                     사유
                  </div>
                  <textarea cols="80" class="report_content"  id="context" name="reasonContent" style="resize:none;"></textarea>
               </li>
               
               <li class="bottom_Btn">
                  <button type="submit" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/images/images/report.png); background-size: 100%;" onclick="alert('소중한 의견 감사합니다.');window.close()"></button>
                  <button type="reset" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/images/images/close_btn.png); background-size: 100%;" onclick="window.close()"></button>
               </li>
            </ul>
         </div>
      </form>
   </body>
</html>