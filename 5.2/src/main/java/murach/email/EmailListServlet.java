package murach.email;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/index.jsp";
        
        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // perform action and set URL to appropriate page
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
        
        // process paramters
        if (heardFrom == null) {
            heardFrom = "NA";
        }
        if (wantsUpdates == null) {
            wantsUpdates = "No";
        }
        else {
            wantsUpdates = "Update available.";
        }
        if (wantsUpdates2 == null) {
            wantsUpdates2 = "No";
        }
        else {
            wantsUpdates2 = "Email Update available.";
        }
            
            // store data in User object
            User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);        
        user.setHeardFrom(heardFrom);        
        user.setWantsUpdates(wantsUpdates);
        user.setWantsUpdates2(wantsUpdates2);
        user.setContactVia(contactVia);

            // validate the parameters
            if(firstName == null || firstName.trim().isEmpty() || lastName == null || lastName.trim().isEmpty() || email == null || email.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Input not valid!!!!!");
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } 
            else {
                url = "/thanks.jsp";
                UserDB.insert(user);
            }
            request.setAttribute("user", user);
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}