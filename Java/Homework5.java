import java.util.Scanner;
public class Homework5 {

	public static void main(String[] args) {
		int numNames;
		Scanner scan = new Scanner(System.in);
		
		//Ask the user to specify the number of names he/she wants to input.
		System.out.println("How many names do you wish to enter?");
		numNames = scan.nextInt();
		scan.nextLine();
		
		//Accordingly declare an array of appropriate size.
		String[] nameArray = new String[numNames]; 

		//Accept the required number of names from the user.
		//Store these names received from the user in a String array.
		for (int i=0; i<nameArray.length; i++) { 
			System.out.println("Enter name #" + (i+1));
			nameArray[i]=scan.nextLine();
		}
		
		
		
		//Print the names to the screen in upper case.
		System.out.println("You entered the following names: ");
		for (int s=0; s<nameArray.length; s++) { 
			System.out.println(nameArray[s].toUpperCase());
		}
		scan.close();
	}

}
