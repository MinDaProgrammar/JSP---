<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="jsp14_java_mail.GmailSMTPAuthenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String content = request.getParameter("content");
	String subject = request.getParameter("subject");
	
	try{
		//서버 정보 설정
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		//인증 정보 설정
		Authenticator authenticator = new GmailSMTPAuthenticator();
		
		//메일 전송 기본 단위를 세션 객체에 전송
		Session mailSession = Session.getDefaultInstance(properties, authenticator);
		
		//전송할 메일에 대한 정보
		Message mailMessage = new MimeMessage(mailSession);
		
		//1. 발신자 정보 설정
		Address senderAddress = new InternetAddress(sender, "아이티윌");
		
		//2. 수신자 정보 설정
		Address receiverAddress = new InternetAddress(receiver);
		
		mailMessage.setHeader("content-Type", "text/html; charset=UTF-8");
		mailMessage.setFrom(senderAddress);
		mailMessage.addRecipient(RecipientType.TO, receiverAddress);
		
		mailMessage.setSubject(subject);
		mailMessage.setContent(content, "text/html; charset=UTF-8");
		mailMessage.setSentDate(new Date());
		
		Transport.send(mailMessage);
		out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
	}catch(Exception e){
		e.printStackTrace();
		out.println("<h3>SMTP 서버 설정 또는 서비스 문제 발생!</h3>");
	}
	
%>