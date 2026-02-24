<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class='wrapper'>
		<header>
			<h3 style="font-Weight: bolder">KH C CLASS</h3>
		</header>
		<nav>
			<a id='list'>게시판</a> <a id='insert'>등록</a>
		</nav>
		<div class='outer'>
			<!--
				게시글 목록,
				게시글 등록,
				게시글 상세보기
			 -->
		</div>
	</div>
	<script>
		//첫 요청
		function showList(){
			
			$.ajax({
				url : '/ajax/board/list',
				success : function(data){
					$(".outer").html(data);
				},
				error : function(xhr, status){
					console.log(xhr)
				}
			})
		}
		showList();
		$("#list").on('click',function(e){
			showList();
		});
		
		$("#insert").on('click',function(e){
			$.ajax({
				url : '/ajax/board/insert',
				success : function(data){
					$(".outer").html(data);
				},
				error : function(xhr, status){
					console.log(xhr);
				}
			})
		});

		$(".outer").on("click","table.list-table tr", function(){
			// 현재 선택된 tr태그
			// this, event.target
			var bno = $(this).children().eq(0).text();
			
			$.ajax({
				url : '/ajax/board/view',
				data : {bno},
				success : function(data){
					$(".outer").html(data);
				},
				error : function(xhr, status){
					console.log(xhr);
				}
			})
		});

		$(".outer").on('click',"table.enroll-table button#btn", function(e){
			// 백엔드에 전송할 데이터
			var data = {
				title: $("[name=title]").val(),
				writer: $("[name=nickname]").val(),
				content: $("[name=content]").val()
			};
			$.ajax({
				url : '/ajax/board/insert',
				data,
				method: "post",
				success : function(){
					alert("저장성공!");
					showList();
				},
				error : function(xhr, status){
					console.log(xhr);
				}
			})
		});
	</script>
</body>
</html>