<%-- 
    Document   : index
    Created on : 07-May-2023, 4:18:28 pm
    Author     : ROHIT
--%>
<%@page import="com.learn.mycartcopy.helper.Helper"%>
<%@page import="com.learn.mycartcopy.entities.Category"%>
<%@page import="com.learn.mycartcopy.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycartcopy.entities.Product"%>
<%@page import="com.learn.mycartcopy.dao.ProductDao"%>
<%@page import="com.learn.mycartcopy.helper.FactoryProvider"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OurShop - Home</title>
        <%@include file ="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">

            <%  
                String cat = request.getParameter("category");
//                out.println(cat);
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list =dao.getAllProducts();
                if(cat == null || cat.trim().equals("all"))
                {
                list = dao.getAllProducts();
            }else {
            int cid=Integer.parseInt(cat.trim());
            list=dao.getAllProductsById(cid);
            
            }
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>
            <!--show category-->
            <div class ="col-md-2">
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>
                </div>

                <%
                    for (Category c : clist) {

                %>
                
                
                <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTit()%></a>                    

                <%
                    }
                %>
                <div  class="container mt-2">
                    <button type="button" class="btn btn-primary "  onclick="goToCheckout()">Your cart</button></div>
 
            </div>
            
            <!--go to cart-->
            
            <!--show products-->
            <div class="col-md-10">
                <!--row-->
                <div class="row mt-4">
                   
                    <div class="col-md-12">
                        <div class="card-columns">
                            
                            <!--traversing products-->
                            <%
                                for(Product p:list){
                                
                                
                                %>
                                <!--product card-->
                                <div class="card product-card">
                                    <div class="container text-center" onclick="">
                                     <img class="card-img-top m-2" src="img/products/<%= p.getpPhoto() %>" style="max-height : 200px;max-width: 100%;width :auto;">

                                    </div>
                                    <div class="card-body">
                                        
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
                                        
                                        
                                    </div>
                                        <div class="card-footer text-center">
                                            <button class="btn btn-success" onclick="add_to_cart(<%= p.getpId() %>,'<%=p.getpName() %>',<%= p.getPriceAfterApplyDiscount()%>)">Add to Cart</button>
                                            <button class="btn btn-outline-primary "> &#8377; <%= p.getPriceAfterApplyDiscount() %>/-<span class ="text-secondary discount-label"> <%= p.getpPrice() %> ,<%= p.getpDiscount() %> off</span></button>
                                        </div>
                                </div>
                                
                                
                                
                                
                                <% }

                                if(list.size()==0)
{

out.println("No item in this category");
}
                                %>
                            
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                
    <%@include file="components/common_models.jsp" %>              
    </body>
</html>
