<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 게시글 목록 페이지 -->
<h2>일반게시판</h2>
<table class='list-table'>
	<thead>
		<tr>
			<th style="width: 10%">번호</th>
			<th style="width: 40%">제목</th>
			<th style="width: 20%">작성자</th>
			<th style="width: 30%">작성일</th>
		</tr>
	</thead>
	<tbody>
		<!-- 반복문으로 등록된 게시글들를 출력하는곳입니다. -->
		<c:forEach items="${list}" var="board">
        <tr class="board-row" data-num="${board.num}">
            <td>${board.num}</td>
            <td>${board.title}</td>
            <td>${board.writer}</td>
            <td>${board.date}</td>
        </tr>
    </c:forEach>
	</tbody>
</table>

<script>
	$(document).on("click", ".board-row", function () {
		const boardNum = $(this).data("num");

		$.ajax({
			url: "/ajax/board/view",
			type: "get",
			data: { num: boardNum },
			success: function (data) {
				$(".outer").html(data);
			},
			error: function (xhr) {
				console.log(xhr);
			}
		});
	});
</script>


