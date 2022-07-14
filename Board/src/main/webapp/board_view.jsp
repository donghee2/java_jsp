<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn_delete").click(function() {
			var d = "boardDelete.do?bno=${requestScope.board.bno}";
			location.href = d;
		});
		$("#btn_update").click(function() {
			var d = "boardUpdateView.do?bno=${requestScope.board.bno}";
			location.href = d;
		});
	});
</script>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<section>
		<table>
			<tr>
				<td>글번호 : </td>
				<td>${requestScope.board.bno }</td>
			</tr>
			<tr>
				<td>글 제목 : </td>
				<td>${requestScope.board.title }</td>
			</tr>
			<tr>
				<td>작성자(닉네임) : </td>
				<td>${requestScope.board.writer }(${requestScope.board.nick })</td>
			</tr>
			<tr>
				<td>조회수 : ${requestScope.board.bcount }</td>
			</tr>
			<tr>
				<td colspan="2">${requestScope.board.content }</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="#">좋아요 : ${requestScope.board.like }</a>
					<a href="#">싫어요 : ${requestScope.board.hate }</a>
				</td>
			</tr>
			<c:if test="${requestScope.board.writer == sessionScope.dto.id }">
			<tr>
				<td colspan="2">
					<button id="btn_update">수정</button>
					<button id="btn_delete">삭제</button>
				</td>
			</tr>
			</c:if>
		</table>
	</section>
</body>
</html>