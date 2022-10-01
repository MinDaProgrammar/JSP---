package jsp15_java_mail2;


//CREATE TABLE auth_member(
//name VARCHAR(20) NOT NULL,
//id VARCHAR(16) PRIMARY KEY,
//passwd VARCHAR(16) NOT NULL,
//email VARCHAR(50) UNIQUE NOT NULL,
//gender VARCHAR(1) NOT NULL,
//auth_status VARCHAR(1) NOT NULL
//);
public class MemberDTO {
	private String name;
	private String id;
	private String passwd;
	private String email;
	private String gender;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
