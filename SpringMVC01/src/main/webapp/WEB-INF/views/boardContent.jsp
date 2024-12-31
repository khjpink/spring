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
	<% pageContext.setAttribute("newLineChar", "\n"); %>
	<div class="container">
	  <h2>Spring MVC01</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">
	    	<table class="table">
	    		<tr>
	    			<td>제목</td>
	    			<td>${vo.title}</td>  
	    		</tr> 
	    		<tr>
	    			<td>내용</td>
	    			<td>
	    				${fn:replace( vo.content, newLineChar,"<br>" )}
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>작성자</td>
	    			<td>${vo.writer}</td> 
	    		</tr>
	    		<tr>
	    			<td>작성일</td>
	    			<td>
	    				${fn:split( vo.indate, " ")[0]} <!-- 띄워쓰기 기준으로 시간 지우고, 년월일인 0번째 인덱스 나오게  -->
	    			</td>
	    		</tr>	    		
	    		<tr>
	    			<td colspan="2" align="center">
	    				<a href="../boardUpdateForm.do/${vo.idx}" class="btn btn-success btn-sm">수정화면</a>
	    				<a href="../boardDelete.do/${vo.idx}" class="btn btn-warning btn-sm" />삭제</a>
	    				<a href="../boardList.do" class="btn btn-info btn-sm">목록</a>
	    				<!-- 패스베리어블 방식을 쓰면 폴더안에 들어간걸로 인식하기 때문에,
	    				http://localhost:8081/controller/boardContent.do/boardList.do 이렇게 나온다. 
	    				 
	    				 폴더를  빠져나가야함. 경로를 바꿔줌 ../boardList.do"
	    				 http://localhost:8081/controller/boardList.do
	    				 -->
	    			</td>
	    		</tr>
	    	</table>
	    </div>
	    <div class="panel-footer">스프링게시판 - 김현정</div>
	  </div>
	</div>
</body>
</html>