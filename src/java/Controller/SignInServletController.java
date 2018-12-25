/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DB;
import POJOS.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.iharder.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author IroshaNa Ranasinghe
 */
public class SignInServletController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String email = request.getParameter("email");
        String password = DigestUtils.sha1Hex(request.getParameter("password"));
        ModelAndView model = null;

        Session s = DB.getSession();
        Criteria userCriteria = s.createCriteria(User.class);
        userCriteria.add(Restrictions.and(Restrictions.eq("email", email), Restrictions.eq("password", password), Restrictions.eq("status", "active")));
        User user = (User) userCriteria.uniqueResult();
        if (user != null) {
            if (user.getUserType().equals("admin")) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("logedUser", "Admin");
                request.getSession().setAttribute("adminName", user.getName());
                request.getSession().setAttribute("logedEmail", user.getEmail());
                request.getSession().setAttribute("logedContact", user.getContact());
                model = new ModelAndView("index");
            } else if (user.getUserType().equals("user")) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("logedUser", user.getName());
                request.getSession().setAttribute("logedEmail", user.getEmail());
                request.getSession().setAttribute("logedContact", user.getContact());
                model = new ModelAndView("index");
            }
        } else {
//            wrong email and password

            model = new ModelAndView("signin");
            model.addObject("error", "Wrong Email or Password");
        }
        return model;
    }

}
