<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 등록페이지 -->
<h2>게시판등록</h2>
<table class='enroll-table'>
	<tr>
		<th>제목</th>
		<td colspan=3><input type="text" name="title" value="" /></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td colspan="3"><input type="text" name="nickname" /></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td colspan="3" style="height: 200px;"><textarea name="content"></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="4">
			<button id="btn">등록</button>
		</th>
	</tr>
</table>
<!-- 
<script>
	$("#btn").on('click',function(e){
		$.ajax({
			url : '/ajax/board/insert',
			type: "post",
			data: {
				title: $("input[name=title]").val(),
    			writer: $("input[name=nickname]").val(),
    			content: $("textarea[name=content]").val()
			},
			success : function(data){
				alert("저장성공!");
				$(".outer").html(data);
			},
			error : function(xhr, status){
				console.log(xhr);
			}
		})
	});
</script> -->
