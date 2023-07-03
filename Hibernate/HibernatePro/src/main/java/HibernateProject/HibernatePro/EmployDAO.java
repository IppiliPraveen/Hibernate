package HibernateProject.HibernatePro;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import jakarta.ws.rs.core.Request;

public class EmployDAO {
	
	
	private boolean rederTbl=false;
	public boolean isRederTbl() {
		return rederTbl;
	}

	public void setRederTbl(boolean rederTbl) {
		this.rederTbl = rederTbl;
	}
	
	public String addEmploy(Employ employ) {
	
		SessionFactory sf = SessionHelper.getConnection();
		Session s = sf.openSession();
		Transaction t = s.beginTransaction();
		s.save(employ);
		t.commit();
		return "Employ Added Successfully...";
	}
	
	public List<Employ> getEmploy(int empNo) {
		SessionFactory sessionFactory= SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		List<Employ> employ = new ArrayList();
		 try {
			 transaction = session.beginTransaction();
			 Criteria criteria = session.createCriteria(Employ.class);
			 criteria.add(Restrictions.eq("empNo",empNo));
			 
			 employ = criteria.list();
			 transaction.commit();

		} catch (Exception e) {
		 if (transaction != null) {
		transaction.rollback();
		}
		e.printStackTrace();
		} finally {
		 session.close();
		}
		return employ;
	}

	public List<Employ> getEmploy1(int empNo) {
		SessionFactory sf = SessionHelper.getConnection();
		Session s = sf.openSession();
		Query q = s.createQuery(" from Employ where Empno="+empNo);
		List<Employ> lst = q.list();
		if(lst.size()>0) {
			System.out.println("Inside 55");
		}
		return lst;
	}
	
	public int logIn(String uname, String pswd) {
		SessionFactory sf = SessionHelper.getConnection();
		Session s = sf.openSession();
		Query q = s.createQuery("from Credentials where User_name='"+uname+"' and Password='"+pswd+"'");
		int count = q.list().size();
		return count;
	}
	
	public List<Employ> searchAll() {
		SessionFactory sf = SessionHelper.getConnection();
		Session s = sf.openSession();
		Query q = s.createQuery(" from Employ");
		List<Employ> lst = q.list();
		if(lst.size()>0) {
			System.out.println("Inside 76");
		}
		return lst;
	}
	
	public void resetSearch() {
		setRederTbl(false);
	}
	
	
}
