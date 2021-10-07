package servlets;

import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "contactServlet",value = "/contact-servlet")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone_number = req.getParameter("phone_number");
        String message = req.getParameter("message");

        if(Util.isValidPhone(phone_number)){
            req.setAttribute("contactMessage","Geçerli bir telefon numarası girin lütfen!");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contact_us.jsp");
            dispatcher.forward(req,resp);
        }


        DBUtil util = new DBUtil();
        int status = util.contactInsert(name,email,phone_number ,message);
        if( status > 0  ){
            resp.sendRedirect(Util.base_url+"main.jsp");
        }else{
            req.setAttribute("contactMessage","Geçerli bir telefon numarası girin lütfen!");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contact_us.jsp");
            dispatcher.forward(req,resp);

        }


    }


}
