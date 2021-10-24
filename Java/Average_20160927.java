//Jessica Zastoupil
//SEIS 601-01

//Write a program that reads three integers from the user and prints
//their average (which may be a non-integer real number)

import java.util.Scanner;
public class Average_20160927 {
	public static void main(String[]args){
		int number1, number2, number3;
		double result;		
		
		Scanner scan = new Scanner(System.in); 
		
		//get three integers from the user
		System.out.print ("Enter number 1: ");
		number1 = scan.nextInt();
		System.out.print ("Enter number 2: ");
		number2 = scan.nextInt();
		System.out.print ("Enter number 3: ");
		number3 = scan.nextInt();
		
		//find the average of the three integers, which could be a double (non-integer real number)
		result = (double) (number1+number2+number3) / 3;
		
		//print result of the average
		System.out.println ("The average of the three numbers is: " + result);  
	}
}
