<%@page import="board.FileBoardDAO"%>
<%@page import="board.FileBoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uploadPath = "/upload";	//루트(webapp)의 하위 폴더 upload 에 저장
	
// 	ServletContext context = request.getServletContext();
// 	String realPath = context.getRealPath(uploadPath);
// 	out.println(realPath);

	String realPath = request.getServletContext().getRealPath(uploadPath);
	int fileSize = 1024 * 1024 * 10;	//byte -> MB -> 10MB
	MultipartRequest multi = new MultipartRequest(request, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	FileBoardDTO dto = new FileBoardDTO();
	dto.setName(multi.getParameter("name"));
	dto.setPass(multi.getParameter("pass"));
	dto.setContent(multi.getParameter("content"));
	dto.setSubject(multi.getParameter("subject"));
	dto.setOriginalFile(multi.getOriginalFileName("file"));
	dto.setRealFile(multi.getFilesystemName("file"));
	out.println(dto.getName()+"<br>"+dto.getPass()+"<br>"+dto.getContent()+"<br>"+dto.getSubject()+"<br>"+dto.getOriginalFile()+"<br>"+dto.getRealFile());
	
	FileBoardDAO dao = new FileBoardDAO();
	int insertCount = dao.insertFileBoard(dto); 
	
	if(insertCount==0){
		%>
		<script>
// 			alert("글쓰기 실패!");
// 			history.back();
		</script>
		<%
	}else{
		response.sendRedirect("driver.jsp");
	}
%>
