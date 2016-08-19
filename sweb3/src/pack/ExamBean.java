package pack;
//formbean : client에서 전달되는 값이 복수일 경우 이를 클래스 type으로 처리
public class ExamBean {
	private String name;
	private int kor, eng;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	
	
}
