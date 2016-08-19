package pack;

public class ExamProcess { //business logic
	private ExamBean examBean;
	
	public void setExamBean(ExamBean examBean){
		this.examBean = examBean;
	}
	
	public int getTot(){
		int imsi = examBean.getKor() + examBean.getEng();
		return imsi;
	}
	
	public double getAvg(){
		return (examBean.getKor() + examBean.getEng())/ 2.0;
	}
}
