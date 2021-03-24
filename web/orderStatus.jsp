<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order Status</title>
        <link rel="stylesheet" href="console.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="overflow-auto">
            <div class="row" style="width:100%">
                <div class="col-12">
                    <button type="button" class="btn btn-info">Add new employee</button>
                    <div class="table-responsive" style="width:102%">
                        <table class="table table-striped table-hover ">

                        <thead class="table-success">
                            <tr>
                                <th scope="col" class="align-middle">Customer ID</th>
                                <th scope="col" class="align-middle">First Name</th>
                                <th scope="col" class="align-middle">Last Name</th>
                                <th scope="col" class="align-middle">Phone No</th>
                                <th scope="col" class="align-middle">Date Ordered</th>     
                                <th scope="col" class="align-middle">Update Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for(int i= 0; i<3; i++){ %>
                            <tr>
                                <td>12345</td>
                                <td>lim</td>
                                <td>kee</td>
                                <td>0123456789</td>
                                <td>11-03-2021</td>
                                <td>
                                    <form action='' method='POST' name='myform' onsubmit='myFunction()'>
                                        <input type='hidden' name='id' value=  />
                                        <select id='available' name='available[]' required='value'>
                                            <option value=''>Status</option>
                                            <option value='Packaging'>Packaging</option>
                                            <option value='Shipping'>Shipping</option>
                                            <option value='Delivered'>Delivered</option>
                                        </select> &nbsp;
                                        <input type='submit' name='update' value='Submit'>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
