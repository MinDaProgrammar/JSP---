<%@page import="jsp12_jstl.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("idx", 3);
	request.setAttribute("name", "홍길동");
	
	List memberList = new ArrayList();
	memberList.add(new MemberDTO("admin","1234","관리자",0));
	memberList.add(new MemberDTO("hong","1234","홍길동",24));
	memberList.add(new MemberDTO("mindoong","1234","민둥이",40));
	
	request.setAttribute("memberList", memberList);
	
	String[] names = {"홍길동","이순신","강감찬"};
	request.setAttribute("names", names);
	
	
	pageContext.forward("test4_result.jsp");


%>