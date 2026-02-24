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
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		List<Map<String, Object>> list;
		
		if(session.getAttribute("list") == null) {
			list = new ArrayList<>();
			for(int i=0; i<5; i++) {
				// 게시글 5개 추가
				// 번호, 내용, 제목, 작성자, 작성일
				Map<String, Object> board = new HashMap<>();
				board.put("bno", i+1);
				board.put("title", "kh게시판 "+(i+1)+"번글");
				board.put("writer", "admin");
				board.put("createDate", new Date());
				board.put("content", "zzzzzzzzzzz");
				
				list.add(board);
			}
			session.setAttribute("list", list);
		}
		
//		HttpSession session = request.getSession();
//
//	    List<Board> list = (List<Board>) session.getAttribute("list");
//
//	    if (list == null) {
//	        list = new ArrayList<>();
//	        list.add(new Board(1,"kh게시판 1번글","admin",new Date(),"zzzzzzzzzzz"));
//	        list.add(new Board(2,"kh게시판 2번글","admin",new Date(),"aaaaaaaaaaa"));
//	        list.add(new Board(3,"kh게시판 1번글","mkm",new Date(),"bbbbbbbbbbb"));
//	        list.add(new Board(4,"kh게시판 4번글","user01",new Date(),"ccccccccccc"));
//	        list.add(new Board(5,"kh게시판 5번글","user02",new Date(),"ddddddddddd"));
//
//	        session.setAttribute("list", list);
//	    }
//
//	    request.setAttribute("list", list);
	    request.getRequestDispatcher("/board/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
