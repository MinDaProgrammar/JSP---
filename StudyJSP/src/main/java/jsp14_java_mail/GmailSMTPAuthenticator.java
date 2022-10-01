package jsp14_java_mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GmailSMTPAuthenticator extends Authenticator {
	PasswordAuthentication passwordAuthentication;
	
	public GmailSMTPAuthenticator() {
		passwordAuthentication = new PasswordAuthentication("xkdlzntld1", "rxosdkuszmkhdgzr");
		
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
	
}
