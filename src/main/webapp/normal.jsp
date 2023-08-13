<%-- 
    Document   : normal
    Created on : 08-May-2023, 8:57:03 pm
    Author     : ROHIT
--%>


<%@page import="com.learn.mycartcopy.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "you are not a normal user !! Do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="text-center ">
            <h1>Welcome <%= user.getUserName()%> to MyCart </h1>
        </div>
        <div class="row">
            <!--// for visting home page-->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">

                        <h3>To explore our new products kindly visit our home page </h3>
                        <button type="button" class="btn btn-primaryś"  onclick="goToHome()">Continue your shopping</button>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3>For placing the order of products present in cart kindly visit Checkout page  </h3>
                        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">checkout</button>                        
                    </div>
                </div>
            </div>
        </div>




    </body>
</html>
