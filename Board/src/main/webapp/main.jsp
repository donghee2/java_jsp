<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	.container{
		width: 1200px;
		display: flex;
		flex-direction: column;
		margin: 50px auto;
	}
	header{
		text-align: right;
	}
	.profile{
		display: inline-block;
		text-align: left;
	}
	nav{
		border-bottom: 1px solid black;
		padding: 20px 0px;
	}
	nav ul{
		list-style-type: none;
		display: flex;
		flex-direction: row;
		justify-content: space-around;
	}
	nav ul li{
		width: 200px;
	}
	nav ul li a:link,nav ul li a:visited {
		display: inline-block;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		width: 100%;
		padding:10px 0px;
		color:black;
		text-decoration: none;
	}
</style>
</head>
<body>
	<c:if test="${sessionScope.dto == null}">
	<c:redirect url="index.jsp"/>
</c:if>
	<div class="container">
		<header>
			<div class="profile">
				${sessionScope.dto.name }님 로그인 하셨습니다.<br>
				<a href="logout.do?command=logout">로그아웃</a> | <a href="update_view.jsp">회원정보 수정</a>
			</div>
		</header>
		<nav>
			<ul>
				<li><a href="main.jsp">홈</a></li>
				<li><a href="">게시판</a></li>
				<li><a href="">회원정보관리</a></li>
			</ul>
		</nav>
	</div>	
</body>
</html>