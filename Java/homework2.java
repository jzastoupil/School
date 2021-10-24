//Jessica Zastoupil
//Homework 2 SEIS601-01

//Prints a message to the screen asking the user to enter a ten digit phone number without any hyphens or spaces.
import java.util.Scanner;

public class Homework2 {
	public static void main(String[] args) {
		System.out.println("Enter a 10 digit number:");
		Scanner scan = new Scanner(System.in);
		String input = scan.nextLine();
		
		System.out.println("You entered: " + input.substring(0,3) + "-" + input.substring(3,6) + "-" + input.substring(6));
		scan.close();
		}
}

