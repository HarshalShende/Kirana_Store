<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en-US">
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
        <!-- bootstrap 3 -->
        <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"> -->
        
        <script>
        $(document).ready(function(){
        $("#myModals").modal('show');
        });
        </script>
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
                        <li><a href="#"><i class="fa fa-sign-out-alt fa-fw"></i> Logout</a></li>
                    </div>
                </div>
                
            </div>
        </nav>
        <div class="wrapper" >
            <!-- Sidebar  -->
            <nav id="sidebar" class="bg-white text-dark" style="border-right: 2px solid black;">
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
                        <a href="#">
                            <i class="fa fa-user fa-fw" ></i> Customer
                        </a>
                    </li>
                    <li>
                        <a href="adminSupplier.jsp">
                            <i class="fa fa-truck fa-fw" ></i> Supplier
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
              <!----------------------------------------->
                <div class="row" style="text-align:right;">
                    <div class="col-lg-4 col-sm-4">
                        <div class="dataTables_length" id="dataTables-example_length">
                            <label>Show entries</label>
                            <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">    <option value="10">10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-4" >
                    <div id="dataTables-example_filter" class="dataTables_filter">
                        <label>Search:</label>
                        <input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example">
                    </div>
                </div>
            </div><br>
            <!----------------------------------------->
            
                <div class="container-fluid">
                    <h4 class="text-primary"><i class="fa fa-th-list fa-fw"></i> Product List</h4>
                    <button type="submit" class="btn btn-primary " data-target="#addProdModal" data-toggle="modal">
                    <i class="fa fa-plus"></i>Add Products
                    </button>&nbsp;&nbsp;
                    <button type="submit" class="btn btn-primary " data-target="#addCatModal" data-toggle="modal">
                    <i class="fa fa-plus"></i>Add Category
                    </button>&nbsp;&nbsp;
                </div>
                <br>
                <div class="container" style="overflow:scroll;">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th> Code </th>
                                <th> Brand Name </th>
                                <th> Description </th>
                                <th> Category </th>
                                <th> Cost </th>
                                <th> SRP </th>
                                <th> Supplier </th>
                                <th witdh = "10%"> Quantity Left </th>
                                <th witdh = "10%"> Product Unit </th>
                                <th> Action </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="record">
                                <td>P-08</td>
                                <td>Century Tuna</td>
                                <td>ADOBO</td>
                                <td>Noodles</td>
                                <td align="right">30.00</td>
                                <td align="right">33.00</td>
                                <td>Consuelo</td>
                                <td align="right">99</td>
                                <td >Per Pieces</td>
                                <td><a rel="facebox" class = "btn btn-primary" href="editproduct.php?id=1">
                                    <i class="fa fa-pencil"></i>
                                </a>
                                <!--   <a href="#" id="1" class="btn btn-danger delbutton" title="Click To Delete">
                                    <i class="fa fa-trash"></i>
                                </a> -->
                            </td>
                        </tr>
                        
</tbody>
</table>

</div>

<a href="" onclick="window.print()" class="btn btn-primary"><i class="fa fa-print"></i> Print</a>
                    <a href= "product_exp.php" class = "btn btn-primary">View Product Expiration</a>
                        <div class="clearfix"></div>


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
<form action="addProducts.jsp" method="post" class = "form-group" >
    <div id="ac">
    
    	<span>Product Code : </span><input type="text" name="code" value = "P-23300" class = "form-control" />
    	
        <span>Category: </span>
        <select name="categ" class = "form-control" >
            <%
            String connectionURL = "jdbc:mysql://localhost:3306/kiranastore";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(connectionURL, user, pass);
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from categories");
            while(rs.next()){
            %>
            <option><%= rs.getString(2) %></option>
            <%
            }
            %>
        </select>
       
        <span>Brand Name : </span><input type="text" name="bname" class = "form-control" />
        
        <span>Description Name : </span><input type="text" name="dname" class = "form-control" />
        
        <span>Product Unit : </span>
        <select name="unit" class = "form-control" >
            <option>Select Product Unit</option>
            <option>Per Pieces</option>
            <option>Per Box</option>
            <option>Per Pack</option>
            <option>Per KG</option>
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
    </form>
</div>
<div class="modal-footer">
</div>
</div>
<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- modal end  -->



 <!-- Add Category Modal -->
<div class="modal fade" id="addCatModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
    <h4 class="modal-title" id="myModalLabel">Add Category</h4>
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
</div>
<div class="modal-body">
    <form action="addCategory.jsp" method="post" class = "form-group" >
        <div id="ac">
            <span>Category : </span>
            <input type="text" name="category" class = "form-control" />
            <span>&nbsp;</span>
            <input class="btn btn-primary btn-block" type="submit" class ="form-control" value="Save" />
        </div>
    </form>
    </div>
    
    <div class="modal-footer">
    </div>
</div>
<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- Modal -->
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