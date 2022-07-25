<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file result</title>
</head>
<body>
	<h2>${requestScope.writer }가 보낸 파일</h2>
	<a href="fileDown.do?file=${requestScope.file1 }">파일 다운로드</a>
	${requestScope.file1 }
</body>
</html>