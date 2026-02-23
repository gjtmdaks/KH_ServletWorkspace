<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Ajax 개요</h1>
	<!-- 
		Asynchronous JavaScript And XML
		 - 서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고
		   일부분만 로드할 수 있게 하는 기법.
		 - A태그나 Form태그를 통한 요청은 동기식 요청방식이라고 부른다.
		   (응답결과가 돌아와야 볼 수 있다.)
		
		* 동기식 / 비동기식
		 - 동기식 : 요청 처리 후 그에 해당하는 응답 페이지가 돌아와야만 그 다음 작업이 가능
				  만약 서버에서 호출된 결과까지의 시간이 지연되면 그 시간동안 대기해야 한다.
				  항상 전체 페이지가 리로드 된다.
		 
		 - 비동기식 : 현재 페이지를 그대로 유지하면서 중간중간마다 추가적인 요청을 보내줄 수 있다.
					검색어 자동완성기능, 아이디중복체크기능, 실시간 검색 기능
					서버에서 결과를 반환해주기까지 오랜 시간이 걸리더라도 현재 페이지를 이용하는데
					문제가 없다.
	 -->
	<h1>XMLHttpRequest 객체를 이용한 ajax</h1>
	<button onclick="ajaxTest1()">ajax get</button>
	<button onclick="ajaxTest2()">ajax post</button>

	<div id="target"></div>
	<script>
		// XmlHttpRequest를 이용한 비동기 통신
		function ajaxTest1(){
			// 1. XmlHttpRequest객체 생성
			const xhr = new XMLHttpRequest();

			// 2. xhr객체 설정
			// open("전송방식", "주소", [동기/비동기])
			xhr.open("get", "/ajax/ajaxTest.do?id=admin");

			// 3. 요청에 대한 응답결과를 처리할 이벤트 리스너 기술
			xhr.onreadystatechange = function(){
				// readyState : 전송상태를 관리하는 속성
				if(xhr.readyState == 4){ // 요청 성공시

					// xhr.status 응답결과를 관리하는 속성
					if(xhr.status == 200){ // 응답 성공시

						// 정상 수신시 응답데이터가 담기는 영역
						console.log(xhr.responseText);
						target.innerHTML = "<h3>GET : "+xhr.responseText+"</h3>";
						
					}else if(xhr.status == 404){ // 응답 실패시
						alert("찾는 페이지가 존재하지 않습니다.");
					}else{
						alert("에러 발생");
					}
				}
			};

			// 4. 객체를 활용하여 요청보내기
			xhr.send();
		}
		
		function ajaxTest2(){
			const xhr = new XMLHttpRequest();
			xhr.open("post","/ajax/ajaxTest.do");

			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						target.innerHTML = `<h3>POST : \${xhr.responseText}</h3>`;
					}
				}
			};

			// body영역에 담긴 데이터의 형식을 기술
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("id=user01"); // send의 매개변수가 body영역
		}
	</script>
	
	<h1>fetch함수를 이용한 AJAX</h1>
	<button onclick="fetch1()">Fetch Get테스트</button>
	<button onclick="fetch2()">Fetch Post테스트</button>
</body>
</html>