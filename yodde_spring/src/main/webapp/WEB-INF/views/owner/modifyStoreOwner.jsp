<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요때</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/commons/common.css" />
<!-- footer, title css -->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/commons/category.css" />
<!-- category css -->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/main/main.css" />
<!-- main css -->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/owner/owner.css" />

<script type="text/javascript"
	src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/scripts/jquery.validate.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#profile").attr("src", e.target.result)
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#valiex").validate({
			rules : {
				name : {
					required : true,
					minlength : 2,
					maxlength : 20
				},
				email : {
					required : true,
					email : true
				},

				business : {
					required : true,
					business : true
				},

				password : {
					required : true,
					minlength : 3,
					maxlength : 12
				},

				pwchk : {
					required : true,
					minlength : 3,
					maxlength : 12,
					equalTo : "#password"
				}
			},

			messages : {
				name : {
					required : " 닉네임을 입력하세요.",
					minlength : " {0}글자 이상으로 입력하세요.",
					maxlength : " {0}글자 이하로 입력하세요."
				},
				email : {
					required : " 이메일을 입력하세요.",
					email : " 이메일을 바르게 입력하세요."
				},

				business : {
					required : " 사업자번호를 입력하세요.",
					business : " 잘못된 사업자 등록번호입니다."
				},

				password : {
					required : " 비밀 번호를 입력하세요.",
					minlength : " {0}글자 이상으로 입력하세요.",
					maxlength : " {0}글자 이하로 입력하세요."
				},
				pwchk : {
					required : " 비밀 번호를 입력하세요.",
					minlength : " {0}글자 이상으로 입력하세요.",
					maxlength : " {0}글자 이하로 입력하세요.",
					equalTo : " 비밀 번호가 서로 일치하지 않습니다."
				}
			}
		});
	});
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/title.jsp" />
		<!-- title -->
	</div>

	<div class="content">
		<div class="content_storeJoin">
			<div class="modifyOwner_box">
				<form id="valiex" novalidate="novalidate" action="modifyOwner" enctype="multipart/form-data"
					method="post">
					<div class="result_title">
						<!-- login title -->
						<img src="${root}/resources/images/images/join_buss.png"
							height="30" ">
					</div>

					<ul class="content_box" style="width: 650px;">
						<li class="myProfile">
							<!-- user의 프로필사진과 닉네임 받아오는 부분 -->
							<div class="myPhoto">
								<c:choose>
									<c:when test="${ownerDto.profilePic != null}">
										<img src="${root}${ownerDto.profilePic}" id="profile" style="Width: 150px; Height: 150px; border-radius: 75px;">
									</c:when>
									<c:otherwise>
										<img id="profile" src="${root}/resources/images/images/profile.png" style="Width: 150px; Height: 150px; border-radius: 75px;">
									</c:otherwise>
								</c:choose>
							</div>
							<div style="padding-top: 10px;">
								<!-- 프로필 사진 변경 부분 -->
								<div id="fileInputForm"
									style="position: relative; float: center; width: 50px; height: 25px; overflow: hidden; margin-left: 50px; cursor: pointer; background-image: url('${root}/resources/images/images/modify_submit.png'); background-size: 100%;">
									<input type="file" name="uploadfile" onchange="readURL(this);"
										style='margin-left: -10px; width: 50px; height: 25px; filter: alpha(opacity = 0); opacity: 0; -moz-opacity: 0; cursor: pointer;'>
								</div>
							</div>
						</li>
						<li>
							<div class="profile_content">
								<!-- user정보 : 순서대로 level, email, 우편번호, 남긴 리뷰갯수  -->
								<p>
									<img src="${root}/resources/images/images/pick.png" height="25">
									<input type="text" class="join_input error"
										style="ime-mode: active;" name="email" placeholder=" ID@EMAIL"
										value="${ownerDto.email}" onfocus="this.placeholder=''"
										onblur="this.placeholder=' ID@EMAIL'" readonly> <label
										for="email" generated="true" class="error"></label>
								</p>

								<p>
									<img src="${root}/resources/images/images/pick.png" height="25">
									<input type="text" class="join_input error"
										style="ime-mode: active;" name="name"
										placeholder=" STORE_NAME" value="${ownerDto.storeName}"
										onfocus="this.placeholder=''"
										onblur="this.placeholder=' NICKNAME'" readonly> <label
										for="name" generated="true" class="error"></label>
								</p>

								<p>
									<img src="${root}/resources/images/images/pick.png" height="25">
									<input type="text" class="join_input error"
										style="ime-mode: active;" id="business" name="business"
										placeholder=" REGISTRATION_NUMBER"
										onfocus="this.placeholder=''" value="${ownerDto.registerNum}"
										onblur="this.placeholder=' REGISTRATION_NUMBER'" readonly>
									<label for="business" generated="true" class="error"></label>
								</p>

								<p>
									<img src="${root}/resources/images/images/pick.png" height="25">
									<input type="password" class="join_input error"
										style="ime-mode: active;" id="password" name="password"
										placeholder=" PASSWORD" onfocus="this.placeholder=''"
										onblur="this.placeholder=' PASSWORD'"> <label
										for="password" generated="true" class="error"> 비밀 번호
										수정 </label>
								</p>

								<p>
									<img src="${root}/resources/images/images/pick.png" height="25">
									<input type="password" class="join_input error"
										style="ime-mode: active;" id="pwchk" name="pwchk"
										placeholder=" PASSWORD" onfocus="this.placeholder=''"
										onblur="this.placeholder=' PASSWORD'"> <label
										for="pwchk" generated="true" class="error"> 비밀 번호 수정
										확인 </label>
								</p>
							</div>
						</li>
					</ul>



					<div class="owbottom_Btn">
						<input type="IMAGE" src="${root}/resources/images/images/ok.png"
							height="30" name="Submit" value="Submit"> <a href=""
							onclick=""> <img
							src="${root}/resources/images/images/cancel.png" height="30" style="margin-left:20px;">
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div>
		<jsp:include page="../common/footer.jsp" />
		<!-- footer -->
	</div>
</body>
</html>