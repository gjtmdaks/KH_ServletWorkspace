package com.kh.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.model.vo.Board;

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
		List<Board> list = new ArrayList<>();
		list.add(new Board(1,"kh게시판 1번글","admin",new Date(),"zzzzzzzzzzz"));
		list.add(new Board(2,"kh게시판 2번글","admin",new Date(),"aaaaaaaaaaa"));
		list.add(new Board(3,"kh게시판 1번글","mkm",new Date(),"bbbbbbbbbbb"));
		list.add(new Board(4,"kh게시판 4번글","user01",new Date(),"ccccccccccc"));
		list.add(new Board(5,"kh게시판 5번글","user02",new Date(),"ddddddddddd"));
		
		request.setAttribute("list", list);
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
