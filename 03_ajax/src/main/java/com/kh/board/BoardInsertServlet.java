package com.kh.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/board/insert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 입력한 값 저장
		// 클라이언트가 전달한 값을 VO클래스로 변환(HashMap)
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
        HttpSession session = request.getSession();
        List<Map<String, Object>> list =
        	    (List<Map<String, Object>>) session.getAttribute("list");
        // session 주소를 앝은 복사 실행

        if (list == null) {
            list = new ArrayList<>();
        }
		
        // 사용자가 값을 전부 입력했다면
		if(!(title.isEmpty() || writer.isEmpty() || content.isEmpty())){
			// 마지막 글 번호 + 1
			int newBno;
		    if (list.isEmpty()) { // list가 비어있어서 첫번째 글이면 1번
		        newBno = 1;
		    } else { // list에 뭔가 있으면 list.size-1로 마지막 위치의 정보(bno)를 추출 후 +1
		        Map<String, Object> lastBoard = (Map<String, Object>) list.get(list.size() - 1);
		        int lastBno = (int) lastBoard.get("bno");
		        newBno = lastBno + 1;
		    }
	        
	        int bno = list.stream()
	        			.mapToInt(b-> ((int)b.get("bno")))
	        			.max()
	        			.orElse(0);
		    
		    Map<String, Object> board = new HashMap<>();
			board.put("bno", newBno);
//			board.put("bno", bno+1);
			board.put("title", title);
			board.put("writer", writer);
			board.put("createDate", new Date());
			board.put("content", content);
			
			list.add(board);
			// session주소를 가져왔기에 list 추가만으로 session 자동 저장
//            session.setAttribute("list", list); // 불필요
		}else {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        return;
		}
//        request.setAttribute("list", list);
//	    request.getRequestDispatcher("/board/list.jsp").forward(request, response);
		// 성공시 showlist() 실행해서 list.jsp를 보여줄 필요 없음
	}
}
