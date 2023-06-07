package HibernateProject.HibernatePro;

public class EmployMain {
	public static void main(String[] args) {
		Employ emp=new Employ();
		EmployDAO empDao=new EmployDAO();
		
		System.out.println(empDao.getEmploy(1));
	}

}
