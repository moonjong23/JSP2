package pack;

public class Gugudan {
	private static Gugudan gugudan = new Gugudan();
	
	public static Gugudan getInstance(){
		return gugudan;
	}
	
   public Gugudan() {
      // TODO Auto-generated constructor stub
   }
   
   public int[] compute(int dan){
      int[] gu = new int[9];
      for (int i = 1; i < gu.length; i++) {
         gu[i - 1] = dan * i;
      }
      return gu;
   }
}
