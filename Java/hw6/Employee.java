public class Employee extends Person{
	//Class Employee (subclass of Person) 
	//Private member variable name of type String. 
	private String name;
	
	//Overloaded constructor 
	//Takes in two parameters, for name and id. 
	Employee(String empName, int empID){
		//Initialization: name initialization is done by Employee constructor; 
		//ID initialization is done by the Person constructor. 
		super(empID);
		name = empName;
	}
	
	public String getName(){
		return name;
	}
	
	public int getID(){
		return super.ID;
	}
	public String toString()
	   {
		  String result = "Name: " + name + " ID: "  + super.ID;
		  return result;
	   }

	//Overrides equals method of the Object class that will compare two employees 
	//Two employees are the same if they have same id and name.
	public boolean equals(Employee e){
		//if another employee has same id and name as this employee, return true else false
		return (this.toString() == e.toString());
	}

}

