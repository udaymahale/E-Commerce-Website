<%-- 
    Document   : admin
    Created on : 08-May-2023, 8:56:00 pm
    Author     : ROHIT
--%>


<%@page import="java.util.Map"%>
<%@page import="com.learn.mycartcopy.helper.Helper"%>
<%@page import="com.learn.mycartcopy.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycartcopy.dao.CategoryDao"%>
<%@page import="com.learn.mycartcopy.helper.FactoryProvider"%>
<%@page import="com.learn.mycartcopy.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin !! Do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }


%>


<%    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();

    //getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
        <!--<link rel ="stylesheet" type="text/css" href="css/style.css">-->
    </head>
    <body>


        <%@include file="components/navbar.jsp" %>
        <div class ="container admin">

            <div class="container-fluid mt-3">
                <%@include file ="components/message.jsp" %>



                <div class="row mt-3">
                    <!--first col-->
                    <div class="col-md-4">
                        <div class ="card" data-toggle="tooltip" data-placement="top" title="Number of users in our website" style="border :1px solid #673ab7;">
                            <div class ="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/user.png" alt="alt"/>
                                </div>
                                <h1><%= m.get("userCount")%></h1>
                                <h1 class="text-uppercase text-muted">User</h1>
                            </div>
                        </div>

                    </div>
                    <!--second-->
                    <div class="col-md-4">
                        <div class ="card" data-toggle="tooltip" data-placement="top" title="Number of categories of product present in our website" style="border :1px solid #673ab7;">
                            <div class ="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="alt"/>
                                </div>
                                <h1><%= list.size()%></h1>
                                <h1 class="text-uppercase text-muted">Categories</h1>
                            </div>
                        </div>

                    </div>
                    <!--third-->
                    <div class="col-md-4">
                        <div class ="card" data-toggle="tooltip" data-placement="left" title="Number of Products available
 in our website" style="border :1px solid #673ab7;">
                            <div class ="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 125px" class="img-fluid " src="img/products.png" alt="alt"/>
                                </div>
                                <h1><%= m.get("productCount")%></h1>
                                <h1 class="text-uppercase text-muted">Products</h1>
                            </div>
                        </div>

                    </div>
                </div>

                <!--second row-->
                <div class="row mt-3">
                    <!--second row first col-->
                    <div class="col-md-6">
                        <!--<div class="col-md-4">-->
                        <div class ="card" style="border :1px solid #673ab7;">
                            <div class ="card-body text-center" data-toggle="modal" data-target="#add-category-model">
                                <div class="container">
                                    <img style="max-width: 125px" class="img-fluid " src="img/menu.png" alt="alt"/>
                                </div>
                                <p class="mt-2">Click here to add new category</p>
                                <h1 class="text-uppercase text-muted">Add Category</h1>
                            </div>
                            <!--</div>-->

                        </div>
                    </div>
                    <!--second row second column-->
                    <div class="col-md-6">
                        <!--<div class="col-md-4">-->
                        <div class ="card" style="border :1px solid #673ab7;">
                            <div class ="card-body text-center">
                                <div class="container" data-toggle="modal" data-target="#add-product-model" >
                                    <img style="max-width: 125px" class="img-fluid " src="img/add-product.png" alt="alt"/>
                                </div>
                                <p class="mt-2">Click here to add new product</p>
                                <h1 class="text-uppercase text-muted">Add Product</h1>
                            </div>
                        </div>

                    </div>
                </div>
                <!--            </div>-->

            </div>
            <!--add category model-->

            <!-- Button trigger modal -->

            <!-- Modal -->
            <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header  text-dark" style="background-color: #ca6107">
                            <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ProductOperationServlet" method="post">
                                <input type="hidden" name="operation" value="addcategory">

                                <div class="form-group">
                                    <input type="text" class="form-control" name ="catTitle" placeholder="Enter the category tittle" required />
                                </div>

                                <div class ="form-group">
                                    <textarea style="height:300px"  class="form-control" name="catDescription" placeholder="Enter category description"  required>
                      
                                    </textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success ">Add Category</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--end of category modal-->



            <!--Product model-->
            <div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-dark" style="background-color: #0441bc">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Product details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!--from-->
                            <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                                <input type="hidden" name="operation" value="addproduct" />

                                <!--product title-->
                                <div class="form-group">
                                    <input type="text" class="form-control" name ="pName" placeholder="Enter the Product tittle" required />
                                </div>

                                <!--product description-->
                                <div class ="form-group">
                                    <textarea style="height:150px"  class="form-control" name="pDesc" placeholder="Enter product description"  required>
                                    </textarea>
                                </div>

                                <!--product price-->
                                <div class="form-group">
                                    <input type="number" class="form-control" name ="pPrice" placeholder="Enter Product price" required />
                                </div>

                                <!--product discount-->
                                <div class="form-group">
                                    <input type="number" class="form-control" name ="pDiscount" placeholder="Enter Product discount" required />
                                </div>

                                <!--product quantity-->
                                <div class="form-group">
                                    <input type="number" class="form-control" name ="pQuantity" placeholder="Enter Product Quantity " required />
                                </div>

                                <!--product category-->

                                <div class="form-group">
                                    <select name="catId" class="form-control" id="catId">
                                        <%
                                            for (Category c : list) {
                                        %>
                                        <option value=" <%= c.getCategoryId()%> "> <%= c.getCategoryTit()%> 
                                        </option>

                                        <% }%>
                                    </select>

                                    <!--product file-->
                                    <div class="form-group">
                                        <label for="pPic"> Select Picture of product</label>
                                        <input type="file" id="pPic" name="pPic" required>
                                    </div>
                                </div>  
                                <!--submit button-->
                                <div class="container text-center">
                                    <button class="btn btn-outline-success ">Add Product</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>
                            </form>
                            <!--end of form-->
                        </div>
                    </div>
                </div>
            </div>

            <!--end of product model-->
            <%@include file="components/common_models.jsp" %>
            <script>
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })
            </script>
    </body>
</html>
