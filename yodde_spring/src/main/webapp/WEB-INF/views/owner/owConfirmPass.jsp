<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>비밀번호 확인</title>
      <c:set var="root" value="${pageContext.request.contextPath}"/>
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>      <!-- footer, title css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />      <!-- category css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>         <!-- main css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/member/member.css"/>
      
      <script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
      <script>
         var password="${ownerDto.password}";
             function OwConfirmPass(){
               if(password == $("input[name='password']").val()){
                  $(location).attr("href", "${root}/info/modifyOwner")
               }else{
                  alert("비밀번호가 틀렸습니다.");
                  $(location).attr("href", "${root}/info/OwPasswordConfirm?email=${ownerDto.email}")
               }
            }
      </script>
   </head>
   <body>
      <div>
         <jsp:include page="../common/title.jsp"/>         <!-- title -->
      </div>
      
      <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
      <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
      <form action="${root}/info/OwPasswordConfirm" method="post" onsubmit="OwConfirmPass()">
      <div class="content" style="margin-bottom:16%;">                           <!-- content -->
         <div class="myPage_content">
            <div class="Password_box" >
               <div class="result_title">               <!-- login title -->
                  <img src="${root}/resources/images/images/passconfirm.png" height="30">
               </div>
               <ul class="delete_content_box">
                  <li class="confirm_box">
                     <div class="Password">PASS WORD</div>
                     <input type="password" class="password" name="password" >
                 </li>
                 
                 <li class="delete_Btn">
               <button type="button" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/images/images/ok.png); background-size: 100%;"  onclick="OwConfirmPass()"></button>
               <button type="reset" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/images/images/close_btn.png); background-size: 100%;" onclick="javascript:history.back()"></button>
            </li>
             </ul>
           </div>
         </div>
      </div>
      </form>
      <div>
         <jsp:include page="../common/footer.jsp"/>         <!-- footer -->
      </div>
   </body>
</html>