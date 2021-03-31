<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="form-row-last">
            <button type="submit" class="register" name="addprod">Add New Staff</button>
        </div>
         <form action="" method="post" class="form-search">
            <input type="search" name="search_id" class="search-item1" placeholder="Enter Staff ID" value="" required="number"/>&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="submit" name="searchprod">Search Staff</button>
        </form>
        <form class="form-detail" action="" method="post" enctype="multipart/form-data">                       
            <div class="form-left">
                <h2>Edit Product</h2>
                <input type="hidden" id="first_name" name="first_name" value="">
                <input type="hidden" id="last_name" name="last_name" value="">
                <div class="form-row">
                   <label for="first_name">First Name :</label>
                </div>
                <div class="form-row">
                   <label for="last_name">Last Name :</label>
                </div>
                <div class="form-row">
                   <label for="age">Age :</label>
                </div>
               <div class="form-row">
                    <label for="email">Email :</label>
                </div>
                <div class="form-row">
                    <label for="password">Password :</label>
                </div>
                <div class="form-row">
                    <label for="gender">Gender :</label>
                </div>
                <div class="form-row">
                    <label for="address">Address :</label>
                </div>
                <div class="form-row">
                    <label for="phone_no">Phone Number :</label>
                </div>
                <div class="form-row">
                    <label for="position">Position :</label>
                </div>
                <div class="form-row-last" style="margin-bottom: 40px">
                   <button type="submit" class="register" name="updateprod">Update Staff Info</button>
                   <button type="submit" class="register" name="delprod" onclick="return confirm('Do you want to delete this sub product');">Delete Staff</button>
                </div>
            </div>
        </form>
    </body>
</html>
