/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import model.DB.DB;
import model.POJOS.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author IroshaNa Ranasinghe
 */
public class SignUpServletController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView model = null;

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String pw1 = request.getParameter("pw1");
        String pw2 = request.getParameter("pw2");
        String u_type = "user";
        String status = "active";

        Session s = DB.getSession();

        if (pw1.equals(pw2)) {
            Criteria userCriteria = s.createCriteria(User.class);
            User user = (User) userCriteria.add(Restrictions.eq("email", email)).uniqueResult();
            if (user == null) {
                Transaction tr = s.beginTransaction();
                User u = new User();
                u.setName(name);
                u.setEmail(email);
                u.setContact(contact);
                String password = DigestUtils.sha1Hex(pw2);
                u.setPassword(password);
                u.setUserType(u_type);
                u.setStatus(status);
                s.save(u);
                tr.commit();

                model = new ModelAndView("index");
            } else {
                model = new ModelAndView("signup");
                model.addObject("error", "User already exsist");
            }
        } else {
            model = new ModelAndView("signup");
            model.addObject("error", "Password does not match");
        }

        return model;
    }
}
