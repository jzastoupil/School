//*****************************************************************
// Course:  SEIS 601 
// This is the Employee Class.
//
// It is a subclass of the Person class
// It has a private member variable called name, of type String.
// It has an overloaded constructor that takes in two parameters, name & id.
//
// name initialization is done by the constructor in this class; id initialization is done by the 
// super class' constructor (in Person class)
//
// the equals method of the Object class is overridden here to compare to Employee objects 
//
//*****************************************************************
public class Employee extends Person 
{
		private String name;

		// constructor		
		public Employee (String name_new, int id) {
			super(id);
			name = name_new;
		}

		// overridden equals method for comparing id and name of two employees
		public boolean equals(Employee other)
		{
		   if (other == null)
		   {
		      return false;
		   }

		   if (this.getClass() != other.getClass())
		   {
		      return false;
		   }

		   if (this.id != other.id)
		   {
		      return false;
		   }

		   if (!this.name.equals(other.name))
		   {
		      return false;
		   }
		   return true;
		}
		
}
