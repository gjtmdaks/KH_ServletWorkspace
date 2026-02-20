package com.kh.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.action.model.vo.Person;

/**
 * Servlet implementation class ELOperation
 */
@WebServlet("/el/oper.do")
public class ELOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELOperation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "안녕");
		request.setAttribute("sTwo", new String("안녕"));
		
		request.setAttribute("pOne", new Person("홍길동", 20, "남자"));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> list1 = new ArrayList<>();
		request.setAttribute("lOne", list1);
		
		ArrayList<String> list2 = new ArrayList<>();
		list2.add("ㅎ..");
		request.setAttribute("lTwo", list2);
		
		request.getRequestDispatcher("/el/02_elOper.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
