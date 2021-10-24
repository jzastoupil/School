
public class HW_recursive {

	public static void main(String[] args) {	
		int m = Integer.parseInt(args[0]);
		int n = Integer.parseInt(args[1]);
		//int m=10;
		//int n=2;
		
		System.out.println(mToTheNth(m,n));
	}

	public static int mToTheNth(int m, int n){
		
		if(n==0)
			return 1;
		else
			return m*mToTheNth(m,n-1);
		
	}	
}
