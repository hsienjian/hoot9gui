/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.ColorDA;
import da.ShoesDA;
import da.StaffDA;
import domain.Color;
import domain.Shoes;
import domain.Staff;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.*;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author j.chong
 */
@MultipartConfig
public class productManagement extends HttpServlet {

    private StaffDA staffDA;
    private ShoesDA shoesDA;
    private ColorDA colorDA;
    private HttpSession session;
    private RequestDispatcher rd;

    @Override
    public void init() throws ServletException {
        shoesDA = new ShoesDA();
        colorDA = new ColorDA();
        staffDA = new StaffDA();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        session = request.getSession();

//        if (session.getAttribute("activeStaff")) {
//            response.setHeader("cache-Control", "no-cache,no-store,must-revalidate");
//            response.setHeader("Pragma", "no-cache");
//            response.setHeader("Expires", "0");
//            response.sendRedirect("/hoot9gui/staff_login.jsp");
//        } else {
        switch (action) {
            case "retrieveAll":
                ArrayList<Shoes> shoes = new ArrayList<Shoes>();
                ArrayList<Color> colors = new ArrayList<Color>();
                ArrayList<Staff> staffs = new ArrayList<Staff>();
                ArrayList<Color> colorsType = new ArrayList<Color>();

                try {
                    colorsType = colorDA.listAllColor();
                    shoes = shoesDA.getAllShoes();
                    for (Shoes s : shoes) {
                        colors.add(colorDA.getColor(s.getColorID()));
                        staffs.add(staffDA.getStaff(s.getStaffID()));
                    }
                    request.setAttribute("shoes", shoes);
                    request.setAttribute("colors", colors);
                    request.setAttribute("staffs", staffs);
                    request.setAttribute("colorsType", colorsType);
                    rd = request.getRequestDispatcher("productManagement.jsp");
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    request.getRequestDispatcher("getShoes_error.html");
                }
                break;
            case "deleteShoes":
                Integer shoes_id = Integer.parseInt(request.getParameter("id"));
                Shoes delete_shoes;

                try {
                    delete_shoes = shoesDA.getShoes(shoes_id);
                    shoesDA.deleteShoes(shoes_id);
                    session.setAttribute("deleteShoes_status", "Shoes Deleted : " + delete_shoes.getProdName() + ", " + colorDA.getColor(delete_shoes.getColorID()).getColorName() + ", " + delete_shoes.getSize());
                } catch (SQLException ex) {
                    session.setAttribute("deleteShoes_status", "Failed to Delete Shoes : " + shoes_id + ".");
                } finally {
                    response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=retrieveAll");
                }
                break;
            case "shoesDetails":
                Integer product_id = Integer.parseInt(request.getParameter("id"));
                String destination = request.getParameter("destination");
                try {
                    Shoes selected_shoes = shoesDA.getShoes(product_id);
                    Color selected_color = colorDA.getColor(selected_shoes.getColorID());
                    Staff selected_staff = staffDA.getStaff(selected_shoes.getStaffID());
                    colorsType = colorDA.listAllColor();
                    request.setAttribute("selected_shoes", selected_shoes);
                    request.setAttribute("selected_color", selected_color);
                    request.setAttribute("selected_staff", selected_staff);
                    request.setAttribute("colorsType", colorsType);
                    rd = request.getRequestDispatcher(destination);
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    session.setAttribute("getShoesDetails_status", "Failed to Obtain Details of Shoes : " + product_id + " .");
                    response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=retrieveAll");
                }
                break;

            case "restock":
                Integer prodID = Integer.parseInt(request.getParameter("product_id"));
                Integer new_stock = Integer.parseInt(request.getParameter("restock_amount"));

                try {
                    Integer current_stock = shoesDA.getShoes(prodID).getStock();
                    if (current_stock > new_stock) {
                        session.setAttribute("restock_status", "Illogical New Total Stock Amount Entered.");
                        response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=shoesDetails&id=" + prodID + "&destination=restockProduct.jsp");
                    } else {
                        shoesDA.restock(prodID, new_stock);
                        session.setAttribute("restock_status", "Shoes : " + prodID + " has Updated from " + current_stock + " to " + new_stock + ".");
                        response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=retrieveAll");
                    }
                } catch (SQLException ex) {
                    session.setAttribute("restock_status", "Failed to Restock Shoes : " + prodID + ".");
                    response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=retrieveAll");
                }
                break;
            case "createColor":
                String name = request.getParameter("name");
                String code = request.getParameter("code");

                Color newColor = new Color(name, code);
                try {
                    colorDA.addColor(newColor);
                    response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=retrieveAll");
                } catch (SQLException ex) {
                }
        }
//    }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        ShoesDA shoesDA = new ShoesDA();
        ColorDA colorDA = new ColorDA();
        StaffDA staffDA = new StaffDA();
        HttpSession session = request.getSession();

        switch (action) {
            case "addShoes":
                String product_name = request.getParameter("product_name");
                String brand = request.getParameter("brand");
                String season = request.getParameter("season");
                String size = request.getParameter("size");
                Double price = Double.parseDouble(request.getParameter("price"));
                Integer stock = Integer.parseInt(request.getParameter("stock"));
                String colorCode = request.getParameter("color");
                String staff_email = request.getParameter("staff");
                Part img = request.getPart("img");
                String path = "/Users/j.chong/NetBeansProjects/GUI_asgm/hoot9gui/web/images/";
                String fileName = img.getSubmittedFileName();
                InputStream is = img.getInputStream();
                String imgLocation = "";

                try {
                    Color color = colorDA.getColor(colorCode);
                    Staff staff = staffDA.getStaff(staff_email);
                    ArrayList<Shoes> sameNameProd = shoesDA.getRecord(product_name);
                    Integer hasIdentical = 0;

                    for (Shoes s : sameNameProd) {
                        String dbShoes_size = s.getSize().replaceAll(" ", "");
                        if (dbShoes_size.equals(size) && s.getColorID().equals(color.getColorID())) {
                            hasIdentical = 1;
                            break;
                        } else {
                            hasIdentical = 0;
                        }
                    }

                    if (hasIdentical == 1) {
                        session.setAttribute("addShoes_status", product_name + " Identical product Found !");
                    } else {
                        if (!img.getSubmittedFileName().equals("")) {
                            imgLocation = fileName;
                            File file = new File(path + fileName);
                            if (file.exists() == false) {
                                Files.copy(is, Paths.get(path + fileName), StandardCopyOption.REPLACE_EXISTING);
                            }
                        }
                        Shoes new_shoes = new Shoes(size, product_name, brand, price, stock, season, imgLocation, color.getColorID(), staff.getStaffID());
                        shoesDA.addShoes(new_shoes);
                        session.setAttribute("addShoes_status", "Successful added a pair of New Shoes : " + product_name + ".");
                    }

                } catch (SQLException ex) {
                    session.setAttribute("addShoes_status", "Failed Add Shoes : " + product_name + ".");
                } finally {
                    response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=retrieveAll");
                }
                break;

            case "updateShoes":
                Integer edited_product_id = Integer.parseInt(request.getParameter("product_id"));
                String edited_product_name = request.getParameter("product_name");
                String edited_brand = request.getParameter("brand");
                String edited_season = request.getParameter("season");
                String edited_size = request.getParameter("size");
                Double edited_price = Double.parseDouble(request.getParameter("price"));
                String edited_color = request.getParameter("color");
                String edited_staff_email = request.getParameter("staff");
                Part edited_img = request.getPart("img");
                String edited_path = "/Users/j.chong/NetBeansProjects/GUI_asgm/hoot9gui/web/images/";
                String edited_fileName = edited_img.getSubmittedFileName();
                InputStream edited_is = edited_img.getInputStream();
                String edited_imgLocation = "";

                try {
                    Color color = colorDA.getColor(edited_color);
                    Staff staff = staffDA.getStaff(edited_staff_email);
                    if (!edited_img.getSubmittedFileName().equals("")) {
                        edited_imgLocation = edited_fileName;
                        File file = new File(edited_path + edited_fileName);
                        if (file.exists() == false) {
                            Files.copy(edited_is, Paths.get(edited_path + edited_fileName), StandardCopyOption.REPLACE_EXISTING);
                        }
                    } else {
                        Shoes temp = shoesDA.getShoes(edited_product_id);
                        edited_imgLocation = temp.getImg();
                    }
                    Shoes new_shoes = new Shoes(edited_product_id, edited_size, edited_product_name, edited_brand, edited_price, shoesDA.getShoes(edited_product_id).getStock(), edited_season, edited_imgLocation, color.getColorID(), staff.getStaffID());
                    shoesDA.updateShoes(new_shoes);
                    session.setAttribute("editShoes_status", "Shoes : " + edited_product_id + " Successfully Edited.");
                } catch (SQLException ex) {
                    session.setAttribute("editShoes_status", "Failed to Update Shoes : " + edited_product_id + " Details.");
                } finally {
                    response.sendRedirect("http://localhost:8080/hoot9gui/productManagement?action=retrieveAll");
                }
                break;
        }
    }
}
