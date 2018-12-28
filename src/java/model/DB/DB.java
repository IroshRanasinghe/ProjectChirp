/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DB;

import org.hibernate.Session;

/**
 *
 * @author IroshaNa Ranasinghe
 */
public class DB {

    private static Session session;

    public static Session getSession() {
        if (session == null) {
            session = model.Connection.FactoryManager.getSessionFactory().openSession();
        }
        return session;
    }

}
