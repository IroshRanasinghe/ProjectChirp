/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cls.ViewPost;
import model.POJOS.Post;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author IroshaNa Ranasinghe
 */
public class ViewPostController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView model = new ModelAndView("index");
        try {
            List<Post> postList = ViewPost.viewPostFunction();
            model.addObject("post", postList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return model;
    }

}
