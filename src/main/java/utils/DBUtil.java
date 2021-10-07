package utils;

import props.Admin;
import props.Blog;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class DBUtil {

    // pass check
    public boolean checkpass(String oldpass, String conform,int aid){
        boolean status =false;
        DB db = new DB();
        try{
            String sql ="Select * from admin where password = ? and aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,Util.MD5(oldpass));
            pre.setInt(2,aid);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                if(rs.getString("password").equals(Util.MD5(conform))){
                    return true;
                }
            }
        } catch (Exception e){
            System.err.println("passCheck Error : " + e);

        } finally {
            db.close();
        }
        return status;
    }


    // pass update
    public int passUpdate(String newpass,int aid){
        int status = 0;
        DB db = new DB();
        try{
            String sql = "update admin set password = ? where aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,Util.MD5(newpass));
            pre.setInt(2,aid);
            status = pre.executeUpdate();
        } catch (Exception e){
            System.err.println("passUpdate Error : " + e);
        } finally {
            db.close();
        }
        return status;
    }



    public boolean login(String email, String password, String remember, HttpServletRequest req, HttpServletResponse resp) {
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "select * from admin where email = ? and password = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, Util.MD5(password) );
            ResultSet rs = pre.executeQuery();
            status = rs.next();

            if ( status ) {
                // session create
                int aid = rs.getInt("aid");
                String name = rs.getString("name");

                req.getSession().setAttribute("aid", aid);
                req.getSession().setAttribute("name", name);

                // cookie create
                if ( remember != null && remember.equals("on")) {
                    name = name.replaceAll(" ", "_");
                    String val = aid+"_"+name;
                    Cookie cookie = new Cookie("user", val);
                    cookie.setMaxAge( 60*60 );
                    resp.addCookie(cookie);
                }


            }

        } catch (Exception e) {
            System.err.println("login Error : " + e);
        }finally {
            db.close();
        }
        return status;
    }


    // contact insert
    public int contactInsert(String name, String email, String phone_number, String message){
        int status =0;
        DB db = new DB();
        try {
            String sql = "insert into contact_us values (null,?, ?, ?, ?)";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,name);
            pre.setString(2,email);
            pre.setString(3,phone_number);
            pre.setString(4,message);
            status = pre.executeUpdate();
        } catch (Exception e){
            System.err.println("contactInsert Error : " + e);
        } finally {
            db.close();
        }
        return status;
    }



    // blog insert
    public int blogInsert(Blog blog, int aid){
        int status = 0;
        DB db = new DB();
        try {
            System.out.println("blogInsert : " + aid);
            String sql = "insert into blog values (null, ?, ?, ?,now(), ? )";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,blog.getTitle());
            pre.setString(2,blog.getDescription());
            pre.setString(3,blog.getDetail());
            pre.setInt(4,aid);
            status = pre.executeUpdate();

        } catch (Exception e) {
            if ( e.toString().contains("SQLIntegrityConstraintViolationException") ) {
                status = -1;
            }
            System.err.println("blogInsert Error : " + e);
        } finally {
            db.close();
        }
        return status;
    }

    // all blog result for admin
    public List<Blog> allBlog(int aid){
        List<Blog> ls = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "select * from blog where aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();
            while( rs.next()){
                int bid = rs.getInt("bid");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                Blog blog = new Blog(bid,title,description,detail,date);
                ls.add(blog);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            db.close();
        }
        return ls;
    }

    // all blogs for home page
    public List<Blog> homeallBlog(){
        List<Blog> ls = new ArrayList<>();
        DB db = new DB();

        try{
            String sql = "select * from blog";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                int bid = rs.getInt("bid");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                Blog blog = new Blog(bid,title,description,detail,date);
                ls.add(blog);
            }
        } catch (Exception e){
            System.err.println("homeallBlog Error : " + e);
        } finally {
            db.close();
        }
        Collections.reverse(ls);
        return ls;
    }

    // blog item single delete
    public int blogDelete( int bid){
        int status = 0;
        DB db = new DB();
        try {
            String sql = "delete from blog where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,bid);
            status = pre.executeUpdate();
        } catch (Exception e){
            System.err.println("blogDelete Error : " + e);
        } finally {
            db.close();
        }
        return status;
    }

    // is blog valid
    public boolean isBlogValid(int cbid , int aid){
        boolean status = false ;
        DB db = new DB();
        try {
            String sql = "select * from blog where bid = ? and aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,cbid);
            pre.setInt(2,aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        } catch (Exception e){
            System.err.println("isBlogValid Error : " + e);
        } finally {
            db.close();
        }
        return status;
    }

    // is admin valid
    public boolean isAdminValid(String name, int aid){
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "select * from admin where name = ? and aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,name);
            pre.setInt(2,aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        } catch (Exception e){
            System.err.println("isAdminValid Error : " + e);
        }finally {
            db.close();
        }
        return status;
    }








    // single admin
    public Admin singleAdmin( int aid){
        Admin admin = new Admin();
        DB db = new DB();

        try{
            String sql = "select * from admin where aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int aidx = rs.getInt("aid");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                admin = new Admin(aid,name,email,password);
                return admin;
            }
        } catch (Exception e) {
            System.err.println("singleAdmin Error : " + e);
        } finally {
            db.close();
        }



        return admin;
    }









    // single blog
    public Blog singleBlog(int bid){
        Blog blog = new Blog();
        DB db = new DB();

        try {
            String sql = "select * from blog where bid = ? ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,bid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int bidx = rs.getInt("bid");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                blog = new Blog(bid,title,description,detail,date);
                return blog;
            }
        } catch (Exception e){
            System.err.println("singleBlog Error : " + e);
        } finally {
            db.close();
        }
        return blog;
    }

    // blog update
    public int blogUpdate(String title, String description, String detail ,int bid){
        int status = 0;
        DB db = new DB();
        try {
            String sql = "update blog set title = ?, description = ?,detail = ? where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,title);
            pre.setString(2,description);
            pre.setString(3,detail);
            pre.setInt(4,bid);
            status = pre.executeUpdate();
        } catch (Exception e){
            System.err.println("blogUpdate Error : " + e);
        } finally {
            db.close();
        }
        return status;
    }







}
