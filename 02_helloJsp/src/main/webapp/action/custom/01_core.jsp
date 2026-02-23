<%@ page import="java.util.*, com.kh.action.model.vo.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	<h3>1. 변수</h3>
	<pre>
		* 변수 선언(&lt;c:set var="변수명" value="리터럴" scope="스코프" &gt;)
		 - 변수를 선언하고 초기값을 대입하는 용도로 사용
		 - 선언한 변수를 어떤 scope에 담을지에 따라 다양한 영역에서 사용할 수 있다.
		   (기본값 pageScope)
		 - c:set을 통해 선언한 변수는 EL로 사용가능
		 - 변수의 자료형을 별도로 지정하지 않는다.
	</pre>
	<c:set var='num1' value="10" />
	<c:set var='num2' value='20' />
	num1변수의 값 : ${ num1 } <br>
	num2변수의 값 : ${ num2 } <br>
	
	<c:set var="result" value="${ num1 + num2 }" scope="request" />
	result변수의 값 : ${ result } <br>
	
	<c:set var="result">
		999999
	</c:set>
	${ result } <br>
	
	<hr>
	
	<pre>
		* 변수 삭제(&lt;c:remove var="삭제할 변수명" scope="스코프" &gt;)
		 - scope영역에서 변수를 삭제하는 태그
		 - scope미지정시 "모든" 영역에서 삭제된다.
	</pre>
	삭제전 result : ${ result } <br>
	
	pageScope에서 삭제 <br>
	<c:remove var="result" scope="page"/>
	
	삭제후 result : ${ result } <br>
	
	모든 스코프에서 result삭제 <br>
	<c:remove var="result"/>
	
	삭제후 result : ${ result } <br>
	
	<hr>
	
	<pre>
		* 변수 출력(&lt; c:out value="출력할값" default="기본값" escapeXml="true/false" &gt;)
		 - 데이터를 화면상에 출력할 때 사용하는 태그
		 - default : value에 출력할 값이 존재하지 않는 경우 대체값을 기술한다.
		 - escapeXml : 출력할 값 중 xml태그가 포함된 경우, escape처리 할지를 지정
		   하는 속성(기본값 true)
	</pre>
	
	result : <c:out value="${ result }" /> <br>
	default : <c:out value="${ result }" default="데이터가 없습니다" /> <br>
	
	<c:set var="htmlStr">
		<b>HTML 문자열</b>
	</c:set>
	${ htmlStr } <br>
	<c:out value="${ htmlStr }" /> <br>
	<c:out value="${ htmlStr }" escapeXml="false" /> <br>
	
	<hr>
	
	<h3>2. 조건문 if(&lt; c:if test="조건식" &gt;)</h3>
	<pre>
		- JAVA의 단독 IF문과 동일한 역할을 하는 태그
		- 조건식의 test속성의 값에는 반드시 EL구문을 작성해줘야한다.
	</pre>
	
	<c:if test="${ num1 ge num2 }">
		<b>num1이 num2보다 크거나 같습니다.</b>
	</c:if>
	
	<c:if test="${ num1 le num2 }">
		<b>num1이 num2보다 작거나 같습니다.</b>
	</c:if>
	
	<h3>3. 조건문 - choose(&lt; c:choose &gt; &lt; c:when &gt; &lt; c:otherwise &gt;)</h3>
	<pre>
		- java의 다중 if-else문 또는 switch문과 비슷한 역할을 하는 태그
		- c:choose태그 아래에 c:when과 c:otherwise태그를 기술한다.
	</pre>
	
	<c:choose>
		<c:when test="${ num1 eq 20 }">
			<b>num1은 20입니다.</b>
		</c:when>
		<c:when test="${ num1 eq 10 }">
			<b>num1은 10입니다.</b>
		</c:when>
		<c:otherwise>
			<b>num1은 10, 20이 아닙니다</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복분 - forEach</h3>
	<pre>
		for loop 문 - c:forEach var="변수명" begin="초기값" end="끝값" step="증가값"
		향상된 for 문 - c:forEach var="변수명" items="배열/컬렉션" varStatus="현재 요소의 상태값"
	</pre>
	
	<c:forEach var="i" begin="1" end="10">
		현재 i의 값 : ${ i } <br>
	</c:forEach>
	
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("홍길동",20,"남자"));
		list.add(new Person("고길동",40,"남자"));
		list.add(new Person("김길순",30,"여자"));
		
		HashMap<String, Person> map = new HashMap<>();
		map.put("홍길동", new Person("홍길동",20,"남자"));
		map.put("김길순", new Person("김길순",30,"여자"));
		
		pageContext.setAttribute("pList", list);
		pageContext.setAttribute("pMap", map);
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="person" items="${ pList }" varStatus="s">
				<tr>
					<td>${ s.count }</td>
					<td>${ person.name }</td>
					<td>${ person.age }</td>
					<td>${ person.gender }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<c:forEach var="entry" items="${ pMap }">
		${ entry.key } <br>
		${ entry.value.age } <br>
		${ entry.value.gender } <br>
	</c:forEach>
	
	<h3>5. 반복문 - forTokens</h3>
	<pre>
		c:forTokens var="변수명" items="분리시킬문자열" delims="구분자"
		 - 구분자를 통해서 분리된 각 무자열에 순타적으로 접근하여 반복을 수행
		 - java의 split함수난 StringTokenizer와 비슷한 역할을 수행한다.
	</pre>

	<c:set var="device" value="컴퓨터,핸드폰,TV,건조기/냉장고.세탁기" />
	<ul>
		<c:forTokens var="d" items="${ device }" delims=",/." >
			<li>${ d }</li>
		</c:forTokens>
	</ul>	
	
	<h3>6. 쿼리스트링과 url을 만들어주는 태그</h3>
	<pre>
		c:url var="변수명" value="url주소"
			c:param name="키값" value="밸류값"
	</pre>
	
	<a href="list.do?num1=1&num2=2">url</a> <br>
	
	<c:url var="listUrl" value="list.do">
		<c:param name="num1" value="1" />
		<c:param name="num2" value="2" />
	</c:url>
	<a href="${ listUrl }">c:url을 이용한 주소값</a>
</body>
</html>