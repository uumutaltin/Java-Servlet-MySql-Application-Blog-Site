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


@WebServlet(name = "blogDetailServlet",value = "/blog-detail")
public class BlogDetailServlet extends HttpServlet {


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


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bid = Integer.parseInt(req.getParameter("bid"));
        req.getSession().setAttribute("updateBid",bid);

        DBUtil util = new DBUtil();
        Blog blog = util.singleBlog(bid);

        req.setAttribute("blog",blog);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blog_detail.jsp");
        dispatcher.forward(req,resp);

        resp.sendRedirect(Util.base_url+"blog_detail.jsp");
    }
}
