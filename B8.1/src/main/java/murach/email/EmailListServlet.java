package murach.email;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;
import murach.data.UserIO;

public class EmailListServlet extends HttpServlet
{    
    @Override
    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException {

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // perform action and set URL to appropriate page
        String url = "/index.jsp";
        if (action.equals("join")) {
            url = "/index.jsp";    // the "join" page
        }
        else if (action.equals("add")) {                
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String heardFrom = request.getParameter("heardFrom");
            String wantsUpdates = request.getParameter("wantsUpdates");
            String wantsUpdates2 = request.getParameter("wantsUpdates2");
            String contactVia = request.getParameter("contactVia");

            // store data in User object and save User object in database
            User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);        
        user.setHeardFrom(heardFrom);        
        user.setWantsUpdates(wantsUpdates);
        user.setWantsUpdates2(wantsUpdates2);
        user.setContactVia(contactVia);
            UserDB.insert(user);
            
            // set User object in request object and set URL
        
        if(firstName == null || firstName.trim().isEmpty() || lastName == null || lastName.trim().isEmpty() || email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Input not valid!!!!!");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }else{
            request.setAttribute("user", user);
        // create the Date object and store it in the request
        Date currentDate = new Date();
        request.setAttribute("currentDate", currentDate);

        // create users list and store it in the session
        String path = getServletContext().getRealPath("/WEB-INF/EmailList.txt");
        ArrayList<User> users = UserIO.getUsers(path);
        HttpSession session = request.getSession();
        session.setAttribute("users", users);

         url = "/thanks.jsp";   // the "thanks" page
        

        // forward request and response objects to specified URL
        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);
        }
    }    
}
    @Override
    protected void doGet(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException {
        doPost(request, response);
    }    
}