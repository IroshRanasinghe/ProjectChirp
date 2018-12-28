/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import model.DB.DB;
import model.POJOS.Post;
import model.POJOS.User;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author IroshaNa Ranasinghe
 */
public class PostAddServletController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView model = null;

        Session ses = DB.getSession();
        Transaction tr = ses.beginTransaction();

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = "active";

//        Date of post
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date d = new Date();
        String date = sdf.format(d);

        User user = (User) request.getSession().getAttribute("user");

        Post p = new Post();
        p.setDate(date);
        p.setTitle(title);
        p.setDescription(description);
        p.setStatus(status);
        p.setUser(user);

        ses.save(p);
        tr.commit();
        
        model = new ModelAndView("index");

        return model;
    }

}
