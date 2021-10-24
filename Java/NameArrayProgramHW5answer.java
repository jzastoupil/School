/*
Write a program that does the following:
Asks the user to specify the number of names he/she wants to input.
Accordingly declare an array of appropriate size.
Accept the required number of names from the user. 
Store these names received from the user in a String array.
Print the names to the screen in uppercase. 
 */

import java.util.Scanner;


public class NameArrayProgram {

	public static void main(String[] args){
		int numNames;
		
		
		Scanner scan = new Scanner (System.in);
		
		System.out.println("Enter the the number of names you want to enter:");
		numNames =  scan.nextInt();
		
		String[] nameArray = new String[numNames];
		
		int counter = 0;
		while (counter < numNames)	
		{
			System.out.println("Enter name #" + (counter + 1) );
			nameArray[counter] = scan.next();	
			counter++;
		}
		
		counter = 0;
		System.out.println("Here are the names you entered in upper case:");
		while(counter < numNames)
		{
			System.out.println(nameArray[counter].toUpperCase());
			counter++;
		}
			
	}
}
