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

@WebServlet(name ="blogUpdateServlet",value = "/blog-update")
public class BlogUpdateServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean bidStatus = req.getSession().getAttribute("updateBid") != null;
        if(bidStatus){
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            String detail = req.getParameter("detail");
            int bid = (int) req.getSession().getAttribute("updateBid");

            DBUtil util = new DBUtil();
            int status = util.blogUpdate(title,description,detail,bid);
            req.getSession().removeAttribute("updateBid");
        }
        resp.sendRedirect(Util.base_url+"/dashboard.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int bid = Integer.parseInt(req.getParameter("bid"));
        req.getSession().setAttribute("updateBid",bid);

        try{
            int aid = (int) req.getSession().getAttribute("aid");
            DBUtil util = new DBUtil();
            if(util.isBlogValid(bid,aid)){
                Blog blog = util.singleBlog(bid);
                req.setAttribute("blog",blog);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blog_update.jsp");
                dispatcher.forward(req,resp);
                resp.sendRedirect(Util.base_url+"blog_update.jsp");
            }

        }catch (Exception e){
            System.err.println("blogUpdate Error : " + e);
        }
        resp.sendRedirect(Util.base_url+"dashboard.jsp");
    }
}
