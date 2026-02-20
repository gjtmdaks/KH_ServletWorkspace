<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL연산</h1>
	<h3>1. 산술 연산</h3>
	<p>
		* 스크립틀릿을 사용한 연산 <br>
		10 + 3 = 
		<%=
		(int)request.getAttribute("big")
		+ (int)request.getAttribute("small")
		%>
	</p>
	<p>
		* EL을 사용한 연산 <br>
		10 + 3 = ${ big + small } <br>
		10 - 3 = ${ big - small } <br>
		${ big } x ${ small } = ${ big * small } <br>
		10 / 3 = ${ big / small } <br>
		10 div 3 = ${ big div small } <br>
		10 % 3 = ${ big % small } <br>
		10 mod 3 = ${ big mod small } <br>
	</p>
	
	<hr>
	
	<h3>2. 숫자간 대소 비교</h3>
	<p>
		10 > 3 : ${ big > small } 또는 ${ big gt small } <br>
		10 < 3 : ${ big < small } 또는 ${ big lt small } <br>
		10 >= 3 : ${ big >= small } 또는 ${ big ge small } <br>
		10 <= 3 : ${ big <= small } 또는 ${ big le small } <br>
	</p>
	
	<h3>3. 동등비교 연산</h3>
	<p>
		* 스크립틀릿 방식 <br>
		<%
			String sOne = (String) request.getAttribute("sOne");
			String sTwo = (String) request.getAttribute("sTwo");
		%>
		sOne과 sTwo가 일치합니까? <%= sOne.equals(sTwo) %> <br>
		sOne과 sTwo가 일치합니까? <%= sOne == sTwo %> <br>
	</p>
	<p>
		* EL연산 <br>
		10과 3이 일치합니까? ${ big == small } 또는 ${ big eq small } <br>
		big과 10이 일치합니까? ${ big == 10 } 또는 ${ big eq 10 } <br>
		
		sOne과 sTwo가 일치합니까? ${ sOne eq sTwo } , ${ sOne == sTwo } <br>
		<!-- EL에서 ==비교는 자바의 equals()방식으로 동작한다. -->
		sOne과 sTwo가 일치하지 않습니까? ${ sOne ne sTwo } , ${ sOne != sTwo } <br>
		sOne에 저장된 값이 "안녕"과 일치합니까? ${ sOne == "안녕" } , ${ sOne == '안녕' } <br>
	</p>
	
	<hr>
	
	<h3>4. 객체가 null인지, 또는 List가 비어있는지 체크할 수 있는 연산자</h3>
	<p>
		pTwo가 null입니까? ${ pTwo == null } 또는 ${ empty pTwo } <br>
		pOne이 null입니까? ${ pOne == null } 또는 ${ empty pOne } <br>
		
		lOne이 비어있습니까? ${ empty lOne } <br>
		lTwo이 비어있습니까? ${ empty lTwo } <br>
		${ lTwo }
	</p>
	
	<hr>
	
	<h3>5. 논리연산자</h3>
	<p>
		AND연산 : ${ true && true }, ${ true and true } <br>
		OR 연산 : ${ false || true }, ${ true or false } <br>
	</p>
	
	<script>
		// jsp페이지 내부에서 템플릿문법을 사용하고자 한다면..
		//  방법 1. 페이지 지시어에 isELIgnored 설정을 추가
		//  방법 2. 템플릿문법 앞에 \(이스케이프) 기호를 추가
		var name = "경민";
		console.log('제 이름은 ' + name + "입니다.")
		console.log(` 제 이름은 \${name}입니다.`);
	</script>
</body>
</html>