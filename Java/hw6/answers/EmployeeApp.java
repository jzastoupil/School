//*****************************************************************
// Course:  SEIS 601 
// This is the EmployeeApp Class. It include the main method
//
// It creates an Employee array of size 3.
//
// It then accepts users input for name and id to create 3 Employee objects and store them in the array
//
// The overridden equals method, in the Employee class, is then used to compare the 3 Employee objects
// to determine if they are unique, or the same as one of the others.
//
//*****************************************************************
import java.util.Scanner;

public class EmployeeApp {
	
	public static void main(String[] args) {
		
		 int id = 0;
 
		 Scanner scan = new Scanner(System.in);
	
		// Create array
		 
		Employee[] employeeArray = new Employee[3];
		
		// populate array with user input
		
		for (int i=0; i < employeeArray.length; i++) {
 
			System.out.print("Enter Name #" + (i+1) + ":");
			String name = scan.nextLine();
			 
			System.out.print("Enter ID #" + (i+1) +  ":");
			id = scan.nextInt();
			
			scan.nextLine();
			
			employeeArray[i] = new Employee(name, id);			

		}
		
		if (employeeArray[0].equals(employeeArray[1]))
			System.out.println("Objects at index 0 and index 1 match");
		else
			System.out.println("Objects at index 0 and index 1 don't match");
			
		if (employeeArray[1].equals(employeeArray[2]))
			System.out.println("Objects at index 1 and index 2 match");
		else
			System.out.println("Objects at index 1 and index 2 don't match");
		
		if (employeeArray[0].equals(employeeArray[2]))
			System.out.println("Objects at index 0 and index 2 match");
		else
			System.out.println("Objects at index 0 and index 2 don't match");
	
		scan.close();
	}
}
