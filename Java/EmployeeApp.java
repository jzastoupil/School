/*Create a client class called EmployeeApp(in a file called EmployeeApp.java) which has a main method.
•Using Scanner class, it will ask the user for data for 2 employees.
•i.e. name, age, and years of service for emp1 and then emp2.
•Take this user input and invoke the constructor of Employee class, passing the user provided input as arguments. You now have 2 initialized Employee instances.
•Now, your main method should print the number of Employee objects created, display data for each, and specify whether each employee is eligible for retirement or not.
*/
import java.util.Scanner;
public class EmployeeApp {

	public static void main(String[] args) {
		String employeeName1, employeeName2;
		Integer empAge1, empAge2, yearsService1, yearsService2;

		Scanner scan = new Scanner(System.in); 
		
		System.out.print("Enter Employee 1's Name: ");
		employeeName1 = scan.nextLine();
		System.out.print("Enter Employee 1's Age: ");
		empAge1 = scan.nextInt();
		System.out.print("Enter Employee 1's Years of Service: ");
		yearsService1 = scan.nextInt();
		
		System.out.print("Enter Employee 2's Name: ");
		employeeName2 = scan.nextLine();
		System.out.print("Enter Employee 2's Age: ");
		empAge2 = scan.nextInt();
		System.out.print("Enter Employee 2's Years of Service: ");
		yearsService2 = scan.nextInt();
		
		
		Employee emp1 = new Employee(employeeName1,empAge1,yearsService1);
		Employee emp2 = new Employee(employeeName2,empAge2,yearsService2);
		
		
		//print the number of Employee objects created, display data for each, and specify whether each employee is eligible for retirement or not	
		System.out.println("Number of employees entered: " + Employee.getNumberOfEmployees()); 
		System.out.println("Employee 1: " + emp1.getEmployeeName());
		System.out.println("Age: " + emp1.getAge());
		System.out.println("Years of Service: " + emp1.getYearsOfService());
		System.out.println("Eligible for retirement: " + emp1.isEligibleForRetirement());
		System.out.println("");
		System.out.println("Employee 2: " + emp2.getEmployeeName());
		System.out.println("Age: " + emp2.getAge());
		System.out.println("Years of Service: " + emp2.getYearsOfService());
		System.out.println("Eligible for retirement: " + emp2.isEligibleForRetirement());
		
		scan.close();
		
	}

}