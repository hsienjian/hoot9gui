<%--
    Document   : Cust_record
    Created on : 22-Mar-2021, 17:25:59
    Author     : Forge-15
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="domain.Customer" %>
<%@page import="da.CustomerDA" %>

<jsp:useBean id="customer" class="domain.Customer" ></jsp:useBean>
<jsp:useBean id="customerDA" class="da.CustomerDA" ></jsp:useBean>

    <!DOCTYPE html>
<%
    //redirect user back to staff_login.jsp if no user session found
    String staffEmail = (String) session.getAttribute("activeStaff");
    response.setHeader("cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (staffEmail == null) {
        response.sendRedirect("/hoot9gui/staff_login.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Customer Record</title>
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>
            .product-control-panel{
                display: flex;
                float: right;
                transform: translateY(-25px);
                margin-right: 10px;
            }
            .product-control-panel>input[type="text"]{
                border-radius: 0.15rem;
                float: right;
                width: 210px;
                background-color: unset;
                padding: 0.5px 1px;
            }
            .row {
                display:block !important;
            }
        </style>
        <script>
            function search(e) {
                var i = 0;
                var rowID = new Array();
                var hittedRowID = new Array();
                var search = e.target.value;
                search = search.replaceAll(" ", "_");
                //search = search.toUpperCase();

                $("#recordTable tr").each(function () {
                    var id = (this.id).split("-");
                    rowID[i] = id;
                    i++;
                });

                console.log(rowID)
                if (search.length > 0) {
                    for (i = 0; i < rowID.length; i++) {
                        var x = rowID[i];
                        var exist;
                        for (var l = 0; l < x.length; l++) {
                            var y = x[l];
                            for (var j = 0; j < search.length; j++) {
                                var z = y[j];
                                if (z.toLowerCase() === search[j].toLowerCase()) {
                                    exist = 1;
                                } else {
                                    exist = 0;
                                    break;
                                }
                            }
                            if (exist === 1) {
                                break;
                            }
                        }

                        // check if the hittedRow is already listed or not
                        for (var l = 0; l < hittedRowID.length; l++) {
                            if (rowID[i] === hittedRowID[l]) {
                                exist = 0;
                                break;
                            }
                        }
                        // if the hittedRow is not listed yet, then will pust to the listed array
                        if (exist === 1) {
                            hittedRowID.push(rowID[i]);
                        }
                    }
                } else {
                    hittedRowID = rowID;
                }

                //check the hittedRowID to be displayed
                if (hittedRowID.length > 0) {
                    for (i = 0; i < rowID.length; i++) {
                        var row = rowID[i].join("-");
                        for (var l = 0; l < hittedRowID.length; l++) {
                            var hittedID = hittedRowID[l].join("-");
                            if (hittedID === row) {
                                $("#" + row).css("display", "table-row");
                                break;
                            } else {
                                $("#" + row).css("display", "none");
                            }
                        }
                    }
                }
            }
        </script>
    </head>
    <body>

        <jsp:include page="/components/backendHeader.jsp" />
        <h3 class="title">Customer Record</h3>
        <div class="product-control-panel">
            <input onKeyUp="search(event)" class="form-control mr-sm-2" type="text" name="search" placeholder="Search"></input>
        </div>

        <%
            CustomerDA customerDa = new CustomerDA();
            ArrayList<Customer> Customer = customerDa.getCustomer();
        %>
        <div class="wrap-content">
            <div class="mb-3">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover ">
                                <thead class="table-success">
                                    <tr>
                                        <th scope="col" class="align-middle">Total Customer</th>
                                        <th scope="col" class="align-middle">Customer Id</th>
                                        <th scope="col" class="align-middle">First Name</th>
                                        <th scope="col" class="align-middle">Last Name</th>
                                        <th scope="col" class="align-middle">Age</th>
                                        <th scope="col" class="align-middle">Email</th>
                                        <th scope="col" class="align-middle">Gender</th>
                                        <th scope="col" class="align-middle">Address</th>
                                        <th scope="col" class="align-middle">Phone No</th>
                                        <th scope="col" class="align-middle">Reward Point</th>
                                        <th scope="col" class="align-middle">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="recordTable">
                                    <%for (int i = 0; i < Customer.size(); i++) {
                                            String fn, ln, gender, age;
                                            fn = Customer.get(i).getFirstName();
                                            ln = Customer.get(i).getLastName();
                                            gender = Customer.get(i).getGender();
                                            fn = fn.replaceAll(" ", "_");
                                            ln = ln.replaceAll(" ", "_");
                                            gender = gender.replaceAll(" ", "");
                                    %>
                                    <tr id="<%=fn%>-<%=ln%>-<%=gender%>-<%=Customer.get(i).getAge()%>">
                                        <td><%= i + 1%></td>
                                        <td><%=Customer.get(i).getCustID()%></td>
                                        <td><%=Customer.get(i).getFirstName()%></td>
                                        <td><%=Customer.get(i).getLastName()%></td>
                                        <td><%=Customer.get(i).getAge()%></td>
                                        <td><%=Customer.get(i).getEmail()%></td>
                                        <td><%=Customer.get(i).getGender()%></td>
                                        <td><%=Customer.get(i).getAddress()%></td>
                                        <td><%=Customer.get(i).getPhoneNo()%></td>
                                        <td><%=Customer.get(i).getRewardPoint()%></td>

                                        <td>
                                            <a href="CustomerControl?option=1&custID=<%=Customer.get(i).getCustID()%> " type="button" class="btn btn-primary" >Edit</a>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                        </div>
                    </div>
                </div>
            </div>

        </table>
    </div>
</div>
</div>
</div>

</div>



</div>
</body>
</html>
