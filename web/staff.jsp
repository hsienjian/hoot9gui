<%-- 
    Document   : staff
    Created on : 14-Mar-2021, 13:52:15
    Author     : Forge-15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="console.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <title>Staff information</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="console.html" %>
            <table>
                
                <div class="overflow-auto">

                    <div class="row">
                        
                        <div class="col-12">
                            <!--<button type="button" class="btn btn-info">Add new employee</button>-->
                            <div class="table-responsive">
                                    <table class="table table-striped table-hover ">
                                        
                                        <thead class="table-success">
                                            <tr>
                                                <th scope="col" class="align-middle">Staff ID</th>
                                                <th scope="col" class="align-middle">First Name</th>
                                                <th scope="col" class="align-middle">Last Name</th>
                                                <th scope="col" class="align-middle">Age</th>
                                                <th scope="col" class="align-middle">gender</th>
                                                <th scope="col" class="align-middle">Phone No</th>
                                                <th scope="col" class="align-middle">Position</th>
                                                <th scope="col" class="align-middle">Join Date</th>
                                                <th scope="col" class="align-middle">Working Days</th>
                                                <th scope="col" class="align-middle" >Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                                <tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary" style="width: 80px">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger" style="width: 80px">Delete</a> 
                                                    </td>



                                                </tr>

                                                <tr>
                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr>

                                                <tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr><tr>

                                                    <td>12345</td>
                                                    <td>puah</td>
                                                    <td>hj</td>
                                                    <td>21</td>
                                                    <td>male</td>
                                                    <td>019321340</td>
                                                    <td>manager</td>
                                                    <td>5</td>
                                                    <td>12-12-1212</td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-primary">Edit</a> 
                                                        <a href="#" type="button" class="btn btn-danger">Delete</a> 
                                                    </td>



                                                </tr>





                                        </tbody>
                            </div>
                        </div>
                    </div>           
                </div>              
            </table>
        </div>
    </body>
</html>
