/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.mycartcopy.helper;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author ROHIT
 */
public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory()
    {
        try
        {
            if(factory == null)
            {
              factory=new Configuration().configure().buildSessionFactory(); 
            }
          
        }catch(Exception e)
                {
                e.printStackTrace();
                }
        return factory;
    }
}
