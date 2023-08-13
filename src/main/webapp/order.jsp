<%-- 
    Document   : order.jsp
    Created on : 11-May-2023, 11:53:06 pm
    Author     : ROHIT
--%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    %>
    
    <%
//    } else {
////        if (user.getUserType().equals("admin")) {
////            session.setAttribute("message", "you are not a normal user !! Do not access this page");
////            response.sendRedirect("login.jsp");
////
////            return;
//        }
//    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        
                    <!--card--> 
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                <!--</div>-->
        <div class="card">
            <div class="card-body text-center">
                <h1>Congratulations <%= user.getUserName()%> your order get place successfully</h1>
                <p></p>
                <h4>Your Payment Mode is cash on Delivery kindly check your product and then perform the transaction</h4>
                <h6>For canceling the order just remove Your selected items </h6>
                <button type="button" class="btn btn-primary checkout-btn mt-3" onclick="goToHome()">Continue your shopping</button>

            </div>
        </div>
    </body>
</html>
