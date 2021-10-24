/*Write a recursive program that calculates m to the nthpower. 
 * Instead of iteratively multiplying m n times, you will compute the result recursively by performing successive multiplication operations.
*Your program must obtain the numbers m and n from the command line. Option: Instead of using command line arguments, you can ask users to type in values for m and n.
*/

public class Recursive {
	//The name of the class you will write to implement this program is Recursive. 
	//The main method of this class processes the command line arguments and then calls a method, mToTheNth(), that uses recursion to compute the power. 	
	public static void main(String[] args) {
		
		int m = Integer.parseInt(args[0]);
		int n = Integer.parseInt(args[1]);
		System.out.println(mToTheNth(m,n));

	}

	
	public static int mToTheNth(int m, int n) {
		////If n is 0, the result is 1 and the method returns. 
		//Otherwise, if n is not 0, compute the result by multiplying m by the result of calling mToTheNthwith m and n-1.
		
		if(n<0)
			throw new IllegalArgumentException("Negative Number");
		
		if(n == 0) 
			return 1;
		else {
			return m * mToTheNth(m, n-1);
		}
	}
	

}


