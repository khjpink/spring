<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	  <h2>Spring MVC01</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">
	    <table class="table table-bordered table-hover">
	    	<tr class="active">
	    		<td>번호</td>
	    		<td>제목</td>
	    		<td>내용</td>
	    		<td>작성자</td>
	    		<td>작성일</td>
	    		<td>조회수</td>
	    	</tr>
	    	
    	<c:forEach items="${list}" var="vo" varStatus="i">
	    	<tr>
	    		<td>${i.count}</td>
	    		<td><a href="boardContent.do/${vo.idx}">${vo.title}</a></td>  
	    		<td>${vo.content}</td>
	    		<td>${vo.writer}</td>
	    		<td>${fn:split( vo.indate, " ")[0]}</td>
	    		<td>${vo.count}</td>
	    	</tr>		    	
    	</c:forEach>
    	 	    	
	    </table>
	    <a href="boardForm.do" class="btn btn-primary btn-sm">글쓰기</a>
	    </div>
	    <div class="panel-footer">스프링게시판 - 김현정</div>
	  </div>
	</div>
</body>
</html>