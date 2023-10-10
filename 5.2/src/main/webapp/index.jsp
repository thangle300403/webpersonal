<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Murach's Java Servlets and JSP</title>
        <link rel="stylesheet" href="styles/main.css">
        
    </head>
    <body>
    <main>
      <section class="glass">
        <form action="test" method="post">
            <img src = "./images/murachlogo.jpg" width="100" height="100"/>
            <h1>Survey</h1>
            <p>If you have a moment, we'd appreciate it if you would fill out this survey.</p>
            <h2>Your information:</h2>
            <label class="pad_top">First Name</label>
            <input type="text" name="firstName" ><br>
            <label class="pad_top">Last Name</label>
            <input type="text" name="lastName" ><br>
            <label class="pad_top">Email</label>
            <input type="email" name="email" ><br>
            <label for="DOB">Date of birth:</label>
            <input type="date" id="DOB" name="DOB"><br>

            <h2>How did you hear about us?</h2>
            <p><input type=radio name="heardFrom" value="Search Engine">Search engine
               <input type=radio name="heardFrom" value="Friend">Word of mouth
               <input type=radio name="heardFrom" value="Friend">Social media
               <input type=radio name="heardFrom" value="Other">Other</p>

            <h2>Would you like to receive announcements about new CDs and special offers?</h2>
            <p><input type="checkbox" name="wantsUpdates" checked>YES, I'd like that.
               <input type="checkbox" name="wantsUpdates2" checked>YES, please send me email announcements.</p>

            <p>Please contact me by:
                <select name="contactVia">
                    <option value="Both" selected>Email or postal mail</option>
                    <option value="Email">Email only</option>
                    <option value="Postal Mail">Postal mail only</option>
                </select>
            </p>

            <br><button
            type="submit"
            value="Submit"
            class="text-white bg-gradient-to-r from-teal-500 via-teal-600 to-teal-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-300 dark:focus:ring-teal-800 font-medium rounded-lg text-xl px-5 py-3 text-center mr-2 mb-2"
          >
            Submit
          </button>
          <%
          String errorMessage = (String) request.getAttribute("errorMessage");
          if(errorMessage != null){
              %>
          <div class = "error-message"><%=errorMessage%></div>
          <%
          }
          %>
         
        </form>
    </section>
    </main>
    </body>
</html>