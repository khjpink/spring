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
	  <h2>Spring MVC02</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">
	    <table id="boardList" class="table table-bordered table-hover">
	    	<tr class="active">
	    		<td>번호</td>
	    		<td>제목</td>
	    		<td>내용</td>
	    		<td>작성자</td>
	    		<td>작성일</td>
	    		<td>조회수</td>
	    	</tr>
	    	<tbody id="view">
	    		<!-- 비동기 방식으로 가져온 게시글을 나오게할 부분 -->	
	    	</tbody>
	    	<tr>
	    		<td colspan="5">
	    			<button onclick="goForm()" class="btn btn-primary btn-sm">글쓰기</button>
	    		</td>
	    	</tr>
	    </table>
	    </div>
	    <!-- 글쓰기 폼 --> 
	    <div class="panel-body" id="wform" style="display:none;">
		    <form id="frm">
		    	<table class="table" >
		    		<tr>
		    			<td>제목</td>
		    			<td><input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요" ></td>  
		    		</tr> 
		    		<tr>
		    			<td>내용</td>
		    			<td><textarea class="form-control" name="content" rows="7" cols="" placeholder="내용을 입력해주세요"></textarea></td>
		    		</tr>
		    		<tr>
		    			<td>작성자</td>
		    			<td><input type="text" class="form-control" name="writer" placeholder="작성자를 입력해주세요"></td> 
		    		</tr>
		    		<tr>
		    			<td colspan="2" align="center">
		    				<button class="btn btn-success btn-sm" type="button" onclick="goInsert()">등록</button>
		    				<button class="btn btn-warning btn-sm" type="reset" id="fclear">취소</button>
		    				<button class="btn btn-info btn-sm" onclick="goList()">목록</button>
		    			</td>
		    		</tr>
		    	</table>
	    	</form>	    
	    </div>
	    <div class="panel-footer">스프링게시판 - 홍길동</div>
	  </div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			loadList();
		});

		function loadList(){
			$.ajax({
				url : "board/all",
				type: "get",
				dataType: "json",
				success : makeView, //콜백함수
				error : function(){ aleret("error"); }
			});
		} // loadList 함수 끝 

		// 게시글 리스트 보여줌
		function makeView(data){
			var listHtml = "";
			$.each(data, function(index, obj){
				listHtml += "<tr>";
				listHtml += "<td>" + (index +1 ) + "</td>";
				listHtml += "<td id='t" + obj.idx + "'>"; 
				listHtml += "<a href='javascript:goContent(" + obj.idx + ")'>";  
				listHtml += obj.title;
				listHtml += "</a>";
				listHtml += "</td>";
				listHtml += "<td>" + obj.content + "</td>"; 
				listHtml += "<td id='w" + obj.idx + "'>" + obj.writer + "</td>"; 
				listHtml += "<td>" + obj.indate + "</td>";
				listHtml += "<td>" + obj.count + "</td>";
				listHtml += "</tr>";
				
				//게시글 상세보기 화면
				listHtml += "<tr id= 'c"+ obj.idx +"' style='display:none'>";  
				listHtml += "<td>내용</td>";
				listHtml += "<td colspan='4'>";
				listHtml += "<textarea id='ta" + obj.idx + "' readonly rows='7' class='form-control'>"
				//listHtml +=  obj.content;
				listHtml += "</textarea>";
				
				//수정 삭제 화면 
				listHtml += "<br>";
				listHtml += "<span id='ub" + obj.idx + "'>";
				listHtml += "<button onclick='goUpdateForm(" + obj.idx + ")' class='btn btn-sm btn-success'>수정화면</button></span> &nbsp;"; //nbsp줄을 바꾸지 않고 띄워쓰기 주는 효과
				listHtml += "<button onclick='goDelete(" + obj.idx + ")' class='btn btn-sm btn-warning'>삭제</button> &nbsp;";
				listHtml += "</td>";
				listHtml += "</tr>";
			});
			
			$("#view").html(listHtml);
			
			goList();
		} // makeView 함수 끝

		//글쓰기 버튼 클릭시 view보이고, 폼은 숨기기
		function goForm(){
			$("#boardList").css("display","none");
			$("#wform").css("display","block");
		};

		//목록 버튼 클릭시 view숨기고, 폼 보이게 
		function goList(){
			$("#boardList").css("display","table-row");
			$("#wform").css("display","none");
		}; //goList 끝
		
		//비동기 게시글 등록기능
		function goInsert(){
			var fData = $("#frm").serialize();
			
			$.ajax({
				url : "board/new", 
				type : "post",
				data : fData,
				success : loadList, 
				error : function(){ aleret("error"); }
			})

			$("#fclear").trigger("click");
		}; // goInsert 끝
		
		
		//게시글 상세보기 내용 보이게 안보이게 
		function goContent(idx){
			if( $("#c" + idx).css("display") == "none" ){
				
				$.ajax({
					url : "board/" + idx,  
					type : "get",
					dataType : "json",
					success : function(data){ 
						$("#ta" + idx).val(data.content); 
					},
					error : function() { alert("error"); }
					
				});
				//게시글 상세 내용 표시
				$("#c" + idx).css("display", "table-row");
				
			//게시물 닫기	
			}else{
				
				// 게시글 조회수 증가
				 $.ajax({
					url : "board/count/"+idx, 
					type : "put",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify({"idx":idx}),
					success : loadList,
					error : function(){ alert("조회수 증가 실패"); }	
				}), // 조회수 증가 ajax끝 
				
				$("#c" + idx).css("display", "none");
			}
		} // goContent 끝
		
		//게시글 삭제 
		function goDelete(idx){
			var real = confirm("정말 삭제하시겠습니까?")
			if(real){
				$.ajax({
					url : "board/" + idx, 
					type : "delete",
					data : {"idx": idx},
					success : function(){ 
						alert("글 삭제 성공");
						loadList();
					},
					error : function(){ alert("글 삭제 실패"); }
				});
			}
		} // goDelete 끝

		//게시글 수정 화면
		function goUpdateForm(idx){
			$("#ta" + idx).attr("readonly", false);
 
			var title = $("#t" + idx).text();
			var newTitle = "<input id='nt" + idx + "' value='" + title + "' type='text' class='form-control'>"; 
			$("#t" + idx).html(newTitle)
			
 			var writer = $("#w" + idx).text();
			var newWriter = "<input id='nw" + idx + "' value='" + writer + "' type='text' class='form-control'>";   
			$("#w" + idx).html(newWriter)

			var newBtn = "<button onclick='goUpdate("+idx+")' class='btn btn-primary btn-sm'>수정</button>";
			$("#ub" + idx).html(newBtn)
		} // goUpdateForm 끝

		 // 게시글 수정완료 
		function goUpdate(idx){
			var title = $("#nt" + idx).val();   
			var content = $("#ta" + idx).val();
			var writer = $("#nw" + idx).val();

			$.ajax({
				url : "board/update", 
				//업데이트는 보낼데이터가 idx,ti,co,wr 많아서 json객체로보내면 스프링이 알아서 변환해주는데,put방식으로 보내면 스프링이 못받는다..
				//put방식의 비동기로 stringify 데이터를 보낼때만 JOSN.이라고 써야하고 이 JSON객체를 {"":}문자열로 바꿔줘야한다.
				type : "put",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({"idx":idx, "title":title, "content":content, "writer":writer}), //json객체를 stringify문자열로 변환
				success : function(){ 
					alert("글 수정 성공");
					loadList();
				},
				error : function(){ alert("글 수정 실패"); }
			});
		} // goUpdate 끝
		

	</script>
</body>
</html>

