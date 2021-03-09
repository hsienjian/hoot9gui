/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author Asus
 */
public class Shoes {

    private int prodID;
    private String size;
    private String prodName;
    private String brand;
    private double price;
    private String stock;
    private String season;
    private Color colorID;
    private Staff staffID;

    public Shoes() {

    }

    public Shoes(int prodID, String size, String prodName, String brand, double price, String stock, String season, Color colorID, Staff staffID) {
        this.prodID = prodID;
        this.size = size;
        this.prodName = prodName;
        this.brand = brand;
        this.price = price;
        this.stock = stock;
        this.season = season;
        this.colorID = colorID;
        this.staffID = staffID;
    }

    public int getProdID() {
        return prodID;
    }

    public String getSize() {
        return size;
    }

    public String getProdName() {
        return prodName;
    }

    public String getBrand() {
        return brand;
    }

    public double getPrice() {
        return price;
    }

    public String getStock() {
        return stock;
    }

    public String getSeason() {
        return season;
    }

    public Color getColorID() {
        return colorID;
    }

    public Staff getStaffID() {
        return staffID;
    }

    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public void setColorID(Color colorID) {
        this.colorID = colorID;
    }

    public void setStaffID(Staff staffID) {
        this.staffID = staffID;
    }

    @Override
    public String toString() {
        return "Shoes{" + "prodID=" + prodID + ", size=" + size + ", prodName=" + prodName + ", brand=" + brand + ", price=" + price + ", stock=" + stock + ", season=" + season + ", colorID=" + colorID + ", staffID=" + staffID + '}';
    }

}
