/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.Cls;

import java.util.List;
import model.DB.DB;
import model.POJOS.Post;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author IroshaNa Ranasinghe
 */
public class ViewPost {

    public static List<Post> viewPostFunction() {
        List<Post> postList = null;

        try {
            Session session = DB.getSession();
            Criteria postCriteria = session.createCriteria(Post.class);
            postCriteria.add(Restrictions.eq("status", "active"));
            postCriteria.addOrder(Order.desc("date"));
            postList = postCriteria.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return postList;
    }
}
