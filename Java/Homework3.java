//Jessica Zastoupil
//SEIS601-01 Homework 3
 
import java.util.Scanner;
public class Homework3 {
	public static void main(String[] args)
	{
		int oddsum = 0;
		int evensum = 0;
		int value;
		/*Write a Java program that repeatedly asks the user to input a positive integer.
            •A positive number is a number that is bigger than zero
            •You maintain two running sums: the sum of even numbers entered and the sum of odd numbers entered by the user.
            •If the input value is not positive, the program prints “Goodbye” and also prints the sum of odd numbers and the sum of even numbers entered by the user. The program then ends.
		 */
		Scanner scan = new Scanner(System.in);
		System.out.print("Input a positive integer: (enter zero or negative integer to quit)");
		value = scan.nextInt();
		while (value > 0 )
		{
			if (value%2 == 0) //even number
				evensum+= value;
			else
				oddsum+= value;
			System.out.print("Input a positive integer: (enter negative integer to quit)");
			value = scan.nextInt();
		}

		System.out.print("Goodbye. Odd number sum = " + oddsum + ". Even number sum = " + evensum);
		scan.close();
	}
}