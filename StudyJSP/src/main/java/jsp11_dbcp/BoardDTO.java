package jsp11_dbcp;

import java.sql.Date;

public class BoardDTO {
	private int idx;	//입력된 글쓰기의 기본 순서 AUTO_INCREMENT와 PRIMARY KEY 설정됨
	private String name;	//작성자
	private String passwd;	//비밀번호
	private String subject;	//글쓰기 제목
	private String content;	//내용
	private Date date;	//오늘 날짜 now()함수를 사용
	private int readcount;	//조회수 기본값은 0으로 설정
	
	//Setters and Getters
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
}
