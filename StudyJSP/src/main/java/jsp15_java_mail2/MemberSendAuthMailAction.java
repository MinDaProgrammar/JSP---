package jsp15_java_mail2;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp14_java_mail.GmailSMTPAuthenticator;

public class MemberSendAuthMailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberSendAuthMailAction");
		ActionForward forward = null;
		GenerateUserAuthenticationCode code = new GenerateUserAuthenticationCode(50);
		System.out.println(code.getAuthCode());
		System.out.println("인증코드 : "+ code.getAuthCode());
		String authCode = code.getAuthCode();
	
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		String sender = "xkdlzntld1@gmail.com";
		String receiver = email;
		String subject = "아이티윌 인증 메일입니다";
		String content = "<a href='http://localhost:8080/StudyJSP/MemberAuth.auth?id"+id+"&authCode="+authCode+"><b>인증하려면 클릭하세요</b></a>";

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
			System.out.println(("<h3>메일이 정상적으로 전송되었습니다.</h3>"));
			
			MemberSendAuthMailService service = new MemberSendAuthMailService();
			boolean isRegistSuccess = service.registAuthCode(id,authCode);
			
			if(!isRegistSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('인증코드 등록 실패!'); history.back(); </script>");
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('인증코드 등록 성공!'); history.back(); </script>");
//				forward = new ActionForward();
//				forward.setPath("");
//				forward.setRedirect(true);
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(("<h3>SMTP 서버 설정 또는 서비스 문제 발생!</h3>"));
		}
		return forward;
	}

}
