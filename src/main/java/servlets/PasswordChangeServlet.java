package servlets;

import props.Admin;
import utils.DB;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="passwordChangeServlet", value = "/password-change")
public class PasswordChangeServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean aidStatus = req.getSession().getAttribute("updateAid") != null;
        if(aidStatus){
            String oldpass = req.getParameter("oldpass");
            String conform = req.getParameter("conform");
            String newpass = req.getParameter("newpass");
            int aid = (int) req.getSession().getAttribute("updateAid");

            DBUtil util = new DBUtil();

            if(util.checkpass(oldpass,conform,aid)){
                util.passUpdate(newpass,aid);
                resp.sendRedirect(Util.base_url+"dashboard.jsp");
            }else{
                req.setAttribute("passwordError","Şifreler uyuşmuyor!");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/password_change.jsp");
                dispatcher.forward(req,resp);
            }

            req.getSession().removeAttribute("updateAid");
        }






    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int aid = Integer.parseInt(req.getParameter("aid"));
        req.getSession().setAttribute("updateAid",aid);

        try{
            String name = (String) req.getSession().getAttribute("name");
            DBUtil util = new DBUtil();
            if(util.isAdminValid(name,aid)){
                Admin admin = util.singleAdmin(aid);
                req.setAttribute("admin",admin);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/password_change.jsp");
                dispatcher.forward(req,resp);
                resp.sendRedirect(Util.base_url+"password_change.jsp");
            }
        } catch (Exception e){
            System.err.println("passwordChange Error : " + e);
        }
        resp.sendRedirect(Util.base_url+"dashboard.jsp");


    }
}
