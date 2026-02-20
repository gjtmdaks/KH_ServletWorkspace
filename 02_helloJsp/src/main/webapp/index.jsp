<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP</h1>
	<p>
		JSP
		 - HTML형식으로 자바코드를 기술할 수 있는 자바 언어로
		   서블릿에서 응답화면을 구현했을 시 발생하는 복잡성을 줄이고 위해 탄생
		   
		 - Servlet은 백엔드 비지니스
	</p>
	 
	 <hr>
	 
	 <h2>JSP Element 표현법</h2>
	 <h3>1. jsp 스크립팅 원소</h3>
	 <ol>
	 	<li>1. 선언문 : &lt;%! !&gt;</li>
	 	<li>2. 스클립틀릿 : &lt;% %&gt;</li>
	 	<li>3. 표현식 : &lt;%= %&gt;</li>
	 </ol>
	 
	 <a href="/jsp/jsp/01_scriptingElement.jsp">스크립팅 원소</a>
	 
	 <h3>2. 지시어(Directive) &lt;%@ page/include/taglib %&gt;</h3>
	 <ol>
	 	<li>
	 		page 지시어 : 현재 jsp페이지를 처리하는데 필요한
	 		각종 속성을 기술할 수 있는 지시어.
	 		<ul>
	 			<li>language : 현재 jsp에서 사용할 언어유형</li>
	 			<li>contentType : 웹 브라우저가 받아 볼 페이지의 형식 및 인코딩 타입</li>
	 			<li>pageEncoding : jsp파일에 기록된 "자바코드"의 인코딩 방식</li>
	 			<li>import : 자바의 import기능</li>
	 			<li>errorPage : 현재 jsp에서 에러가 발생할 경우 보여줄 에러페이지 경로</li>
	 		</ul>
	 		<a href="/jsp/jsp/02_directive.jsp">페이지 지시어</a>
	 	</li>
	 	<li>
	 		include 지시어 : jsp파일에 또다른 jsp파일을 포함시키고자 할 때 사용
	 		<a href="/jsp/jsp/03_include.jsp">include 지시어</a>
	 	</li>
	 	<li>
	 		taglib 지시어 : jsp기능을 확장한 추가 라이브러리 등록을 위한 지시어
	 	</li>
	 </ol>
	 
	 <h1>* EL(Expression Language)</h1>
	 <p>
	 	기존에 사용햇던 표현식, 출력식을 jsp에서 간결한
	 	방식으로 기술할 수 있도록 지원하는 언어
	 </p>
	 
	 <h3>1. EL기본 문법</h3>
	 <a href="/jsp/el/el.do">01_EL</a>
</body>
</html>