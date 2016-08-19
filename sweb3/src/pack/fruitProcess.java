package pack;

public class fruitProcess {
	private fruitBean fruitbean;
	
	public void setFruitbean(fruitBean fruitbean) {
		this.fruitbean = fruitbean;
	}
	
	public double getTot(){
		double tot = fruitbean.getDanga() * (fruitbean.getDiscount()*0.01);
		return tot;
	}
	
	public double getLast(){
		double last = fruitbean.getDanga() - (fruitbean.getDanga() * (fruitbean.getDiscount()*0.01));
		return last;
	}
}
