<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
			<link href=<c:url value="/resources/css/style.css"/> rel="stylesheet">
			<script src="/resources/js/script.js"></script> 
			<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
</head>
<body>
<br>
<table class="table table-bordered">
	<colgroup>
		<col width="60"><col><col width="115"><col width="85">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">약속번호</th>
			<th scope="col">약속이름</th>
			<th scope="col">약속날짜</th>
			<th scope="col">약속시작시간</th>
			<th scope="col">약속종료시간</th>
			<th scope="col">약속장소</th>
			<th scope="col">약속이행여부</th>
			<th scope="col">약속삭제여부</th>
		</tr>
	</thead>
	<tbody>
		<%-- <c:forEach var="item" items="${promiselistbyid }" varStatus="status"> --%>
			<tr>
				<td>${promiselistbyid.ypromise_id }</td>
				<td><a href="./${promiselistbyid.ypromise_id}">${promiselistbyid.yproname }</a></td>
				<td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${item.yprodate }" /></td>
				<td>${promiselistbyid.yprostart }</td>
				<td>${promiselistbyid.yproend }</td>
				<td>${promiselistbyid.yproloc }</td>
				<td>${promiselistbyid.yprodone }</td>
				<td>${promiselistbyid.yprodel }</td>
			</tr>
		<%-- </c:forEach> --%>
	</tbody>
</table>

</body>
</html>