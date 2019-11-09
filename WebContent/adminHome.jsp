<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@page import="java.io.PrintWriter" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Kirana Store With GST</title>
        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style4.css">
        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-dark sticky-top">
            <div class="container-fluid">
                <h1><a href="#" class="navbar-brand font-weight-bold justify-content-start text-white"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;Kirana Store With GST</a></h1>
                <div class="dropdown dropleft float-right">
                    <button type="button" class="btn btn-primary dropdown-toggle bg-dark" data-toggle="dropdown">
                    <i class="fa fa-power-off"></i>
                    </button>
                    <div class="dropdown-menu">
                        <li><a href="logout.jsp"><i class="fa fa-sign-out-alt fa-fw"></i> Logout</a></li>
                    </div>
                </div>
                
            </div>
        </nav>
        <div class="wrapper" >
            <!-- Sidebar  -->
            <nav id="sidebar" class="bg-white text-dark overflow-auto" style="border-right: 2px solid black;">
                <div class="sidebar-header">
                    <button type="button" id="sidebarCollapse" class="btn btn-info align-content-center">
                    <i class="fa fa-bars fa-fw"></i>
                    <span></span>
                    </button>
                    <strong><i class="fa fa-shopping-cart"></i></strong>
                </div>
                <ul class="list-unstyled components">
                    <li class="">
                        <a href="adminHome.jsp">
                            <i class="fas fa-home fa-fw"></i> Home
                        </a>
                    </li>
                    <li>
                        <a href="adminProducts.jsp">
                            <i class="fa fa-table fa-fw" ></i> Products
                        </a>
                    </li>
                    
                    <li>
                        <a href="adminSupplier.jsp">
                            <i class="fa fa-truck fa-fw" ></i> Supplier
                        </a>
                    </li>
                    
                    <li>
                        <a href="#">
                            <i class="fa fa-user fa-fw" ></i> Customer
                        </a>
                    </li>
                    
                    <li>
                        <a href="#">
                            <i class="fa fa-list-alt fa-fw" ></i> Customer Ledger
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-list-alt fa-fw" ></i> Supplier Ledger
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-th-list fa-fw"></i> Purchase Order List
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-bars fa_custom"></i> Purchase Order Form
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-book fa-fw" ></i> Reports
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- Page Content  -->
            <div id="content">
                
                <div class="container-fluid">
                    <h4 class="text-primary page-item">
                    <img src="getAdminImage.jsp" class="rounded-circle rounded" alt="Admin Picture" height="65" width="65px">
                    &nbsp;&nbsp; Welcome Admin &nbsp;&nbsp;
                    <strong class="text-danger text-center"><%= session.getAttribute("name")%></strong>
                    </h4>
                    <br><br>
                    <div id="orayt">
                        <a class="list-group-item">
                            <font style = 'color:black;'>Total Sales For Today:  </font>
                            <span class="badge float-right">
                                <%= (new java.util.Date()).toLocaleString()%>
                            </span>
                        </a>
                        <a class="list-group-item" href ="view_productqty.php">Re-Order
                            <span class="badge float-right">
                                1
                            </span>
                        </a>
                        <a class="list-group-item" href ="view_customer.php">Credit
                            <span class="badge float-right">
                                [0]  2019-10-20
                            </span>
                        </a>
                        <a class="list-group-item" href ="view_exproduct.php">Product Expiration
                            <span class="badge float-right">
                                [0]  2019-10-20
                            </span>
                        </a>
                        <!--<a class="list-group-item"  href ="view_overdue.php">
                            Overdue <span class="badge">
                                [0]  2019-10-20
                            </span>
                        </a>-->
                    </div>
                </div>
                
            </div>
        </div>
        <div class="modal fade" id="addProdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Add Product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="saveproduct.php" method="post" class = "form-group" >
                            <div id="ac">
                                <span>Category: </span>
                                <select name="categ" class = "form-control" >
                                    <option>Select Category</option>
                                    <option>Noodles</option>
                                    <option>Canned Goods</option>
                                    <option>Shampoo</option>
                                    <option>Bath Soap</option>
                                    <option>Crackers</option>
                                </select>
                                <span>Product Code : </span><input type="text" name="code" value = "P-23300" class = "form-control" />
                                <span>Brand Name : </span><input type="text" name="bname" class = "form-control" />
                                <span>Description Name : </span><input type="text" name="dname" class = "form-control" />
                                <span>Product Unit : </span>
                                <select name="unit" class = "form-control" >
                                    <option>Select Product Unit</option>
                                    <option>Per Pieces</option>
                                    <option>Per Box</option>
                                    <option>Per Pack</option>
                                </select>
                                <span>Cost : </span><input type="text" name="cost" class = "form-control" />
                                <span>SRP : </span><input type="text" name="price"  class = "form-control" />
                                <span>Supplier : </span>
                                <select name="supplier" class = "form-control">
                                    <option>Unilever</option>
                                    <option>Consuelo</option>
                                </select>
                                <span>Quantity : </span><input type="text" name="qty" class = "form-control" />
                                <span>Date Delivered: </span><input type="date" name="date_del" class = "form-control" />
                                <span>Expiration Date: </span><input type="date" name="ex_date" class = "form-control" />
                                <span>&nbsp;</span><input class="btn btn-primary btn-block" type="submit" class = "form-control" value="Save" />
                            </div>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- modal end  -->
            <!-- jQuery CDN - Slim version (=without AJAX) -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <!-- Popper.JS -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
            <!-- Bootstrap JS -->
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
            <script type="text/javascript">
            $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            });
            });
            </script>
        </body>
    </html>