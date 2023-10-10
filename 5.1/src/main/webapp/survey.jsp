<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>

<body>
    <h1>Thanks for taking our survey!</h1>

    <p>Here is the information that you entered:</p>

    <label>Email:</label>
    <span>${user.email}</span><br>
    <label>First Name:</label>
    <span>${user.firstName}</span><br>
    <label>Last Name:</label>
    <span>${user.lastName}</span><br>
    <label>Heard From:</label>
    <span>${user.heardFrom}</span><br>
    <label>Updates:</label>
    <span>${user.wantsUpdates}</span><span>${user.wantsUpdates2}</span><br>
    <c:if test="${user.wantsUpdates == 'Yes' || user.wantsUpdates2 == 'Yes'}">
        <label>Contact Via:</label>
        <span>${user.contactVia}</span>
    </c:if>  
    <p>To enter another email address, button in your browser or the
		Return button shown below.</p>
	click on the Back
	<form action="survey" method="post">
		<input type="hidden" name="action" value="join">
		<input type="submit" value="Return">
	</form>  
</body>
</html>