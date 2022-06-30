<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
						<!-- 로그인 시 url에 비밀번호가 표시되면 안되기때문에 post로 처리 -->
	<form action="login_session_process.jsp" method="post">
		아이디 : <input type="text" name="id"> <br>
		비밀번호 : <input type="password" name="pass"> <br>
		<button>로그인</button>
	</form>
</body>
</html>