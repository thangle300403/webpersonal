<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <section class = "glass">
    <form action="emailList" method="post">
        <img src = "./images/murachlogo.jpg" width="100" height="100"/>
        <h1>Survey</h1>
        <p>If you have a moment, we'd appreciate it if you would fill out this survey.</p>
        <h2>Your information:</h2>
        <input type="hidden" name="action" value="add">        
        <label class="pad_top">Email:</label>
        <input type="email" name="email" 
               value="${user.email}"><br>
        <label class="pad_top">First Name:</label>
        <input type="text" name="firstName" 
               value="${user.firstName}"><br>
        <label class="pad_top">Last Name:</label>
        <input type="text" name="lastName" 
               value="${user.lastName}"><br>   
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
            <label>&nbsp;</label>
            <input type="submit" value="Join Now" class="margin_left">
          
    </form>
</section>

</body>
</html>