
package com.learn.mycartcopy.dao;

import com.learn.mycartcopy.entities.User;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration; 
import org.hibernate.*;

/**
 *
 * @author ROHIT
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    //get user by email and password
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try{
            String query ="from User where userEmail =: e and userPassword=: p ";
            Session session =this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user=(User)q.getSingleResult();
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
    
}
