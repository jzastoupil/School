 //Design and implement a class Employee in a java file called Employee.java. 
public class Employee {
	//The class should contain instance variables for employee’s name, age, yearsOfService.
	private String employeeName;
	private int empAge;
	private int yearsOfService;
	static int numberOfEmployees = 0;
	
	//Define the Employee constructor to accept and initialize instance data. 
	Employee(String newName, int newAge, int newYOS){ 			 
		employeeName = newName;
		  empAge = newAge;
		  yearsOfService = newYOS;
		//The class should also keep track of the number of employee objects created using a static variable.
		//This variable gets incremented every time in the constructor.
		numberOfEmployees++;
	}
	
	
	//Include get and set methods for the three instance variables
	public void setEmployeeName(String e){
		employeeName = e;
	}
	
	public String getEmployeeName(){
		return employeeName;
	}
	
	public void setAge(Integer a){
		empAge = a;
	}
	
	public Integer getAge(){
		return empAge;
	}
	
	public void setYearsOfService(Integer y){
		yearsOfService = y;
	}
	
	public Integer getYearsOfService(){
		return yearsOfService;
	}
	
	
	static int getNumberOfEmployees() { 
		return numberOfEmployees; 
		}
	
	//Include a instance method called isEligibleForRetirement()that returns a boolean.
	Boolean isEligibleForRetirement(){
	//true if the employee is eligible for retirement, false if not.
	//For an employee to be eligible for retirement, the sum of age and years of service needs to be greater than 60.
		if (empAge + yearsOfService > 60)
			return true;
		else
			return false;
		}
	
	}