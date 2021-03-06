<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot_head.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="./resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/searchList.css" />
</head>
<body>
<c:import url="../temp/boot_nav.jsp"></c:import>




<div class="container search">
	<div class="searchPart">
	<div id = "searchbar">
				
				<div>
					<form action="search">
						<input class="SearchInput" type="text" placeholder="검색" name="search">
						<input class="SearchSubmit" type="submit" value="검색하기">
					</form>
				</div>
				
			
			</div>
	</div>
	
	<div class="searchList">
		<div class="searchVal">
			<h2>${param.search}(으)로 검색한 결과</h2>
		</div>
		<hr>
	<div class="searchinfo">
		<c:if test="${empty map}">
			<h3>연관된 데이터가 없습니다.</h3>
		</c:if>
	
	
		<ul>
		<c:forEach items="${map}" var="map1">
			<li>
				<div>
					<figure>
						<a href="./restaurants/select?restNum=${map1.key.restNum}">  <!-- 상세 페이지 구현시 주소 바꾸기 -->
						<div class="RestImg">
						 <c:forEach items="${map1.key.files}" begin="0" end="0"  var="f">
						<img class="seimg" src="./resources/img/${f.fileName}">
						</c:forEach> 
						</div>
						</a>
						<figcaption class="fig">
							<div class="info">
							<a class="titleA" href="./restaurants/select?restNum=${map1.key.restNum}">  <!-- 상세 페이지 구현시 주소 바꾸기 -->
								<h3 class="title">${map1.key.restName}</h3>
							</a>
							<h3 class="starVal">${map1.key.starVal}</h3>
							<br>
							<h5>
							<c:forEach items="${map1.value}" var="categorys">
								${categorys.categoryName}
							</c:forEach>
							</h5>
							
							
							</div>
						</figcaption>
					</figure>
				</div>
				
			</li>
			</c:forEach>
		</ul>
	</div>
	

	
	</div>
	
	
	<div class="involvedList">
		<h3>${param.search}(으)로 커뮤니티 검색</h3>
		<c:forEach items="${community}" var="c">
		<div class="Ctitle">
			<h4 class="cctitle" >제목 : <a href="${pageContext.request.contextPath}/community/select?num=${c.num}">${c.title}</a></h4>
		</div>
		</c:forEach>
		
		<c:if test="${empty community}">
			<h3>연관된 데이터가 없습니다.</h3>
		</c:if>
		
	</div>
	
	
	<div class="pagination">
  <a href="./search?search=${param.search}">&laquo;</a>
  <a href="./search?search=${param.search}&pn=${pager.startNum-1}">&lt;</a>
  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="n">
	<a href="./search?search=${param.search}&pn=${n}">${n}</a>
	</c:forEach>
  <a href="./search?search=${param.search}&pn=${pager.startNum+1}">&gt;</a>
  <a href="./search?search=${param.search}&pn=${pager.totalPage}">&raquo;</a>
</div>
	
</div>



<c:import url="../temp/boot_footer.jsp"></c:import>
	
	<script>
	
		
	$('.navi').addClass('affix');
	
	

	 </script>
</body>
</html>