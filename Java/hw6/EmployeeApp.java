import java.util.Scanner;
public class EmployeeApp {
//Class EmployeeApp which has a main method 
	public static void main(String[] args) {
		String empName;
		int empID;
		Scanner scan = new Scanner(System.in);
		
		//Create an Employee array of size 3 
		Employee[] empArray = new Employee[3];
		for(int i = 0; i<empArray.length; i++){
			//Accepts user input for name and id for 3 employees; 
			System.out.println("Enter employee name:");
			empName = scan.nextLine();
			
			System.out.println("Enter employee ID:");
			empID = scan.nextInt();
			scan.nextLine();
			
			//creates 3 Employee objects and stores them in the array. 
			//Use Constructors of both the classes to initialize the objects. 
			empArray[i]= new Employee(empName, empID);
		}

		//Using the equals method you implemented, compare: 
		//? Employee object at index 0 and index 1 
		//? Employee object at index 1 and index 2 
		//? Employee object at index 0 and index 2
		//and specify if employees are distinct or same.
		if (empArray[0].equals(empArray[1]))
			{
				//print they are the same
				System.out.println(empArray[0].toString() + " and " + empArray[1].toString() + " are the same");
			}
		else
			{
				//print they are not the same
				System.out.println(empArray[0].toString() + " and " + empArray[1].toString() + " are NOT the same");
			}
		
		if (empArray[1].equals(empArray[2]))
			{
				//print they are the same
				System.out.println(empArray[1].toString() + " and " + empArray[2].toString()  + " are the same");
			}
		else
			{
				//print they are not the same
				System.out.println(empArray[1].toString() + " and " + empArray[2].toString() + " are NOT the same");
			}
		if (empArray[0].equals(empArray[2]))
			{
			//print they are the same
			System.out.println(empArray[0].toString() + " and " + empArray[2].toString() + " are the same");
			}
		else
			{
			//print they are not the same
			System.out.println(empArray[0].toString() + " and " + empArray[2].toString() + " are NOT the same");
			}
		scan.close();
	}
}




