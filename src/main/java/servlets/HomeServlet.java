package servlets;

import props.Blog;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "homeServlet",value = "/home")
public class HomeServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Blog> ls = (List<Blog>) req.getSession().getAttribute("blogs");
        if(ls != null){
            List<Blog> lsx = ls;
            req.getSession().removeAttribute("blogs");
            req.getSession().setAttribute("blogs",lsx);
        }
        resp.sendRedirect(Util.base_url+"main.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        DBUtil util = new DBUtil();
        List<Blog> ls = util.homeallBlog();
        req.setAttribute("blogs",ls);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/main.jsp");
        dispatcher.forward(req,resp);

        resp.sendRedirect(Util.base_url+"main.jsp");






    }
}
