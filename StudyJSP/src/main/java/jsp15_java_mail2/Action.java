package jsp15_java_mail2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public abstract ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
