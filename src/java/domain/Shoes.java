/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author j.chong
 */
public class Shoes {

    private Integer prodID;
    private String size;
    private String prodName;
    private String brand;
    private Double price;
    private Integer stock;
    private String season;
    private String img;
    private Integer colorID;
    private Integer staffID;

    public Shoes() {
    }

    public Shoes(Integer prodID, String size, String prodName, Double price, Integer stock, String img, Integer colorID, Integer staffID) {
        this.prodID = prodID;
        this.size = size;
        this.prodName = prodName;
        this.price = price;
        this.stock = stock;
        this.img = img;
        this.colorID = colorID;
        this.staffID = staffID;
    }

    public Shoes(String size, String prodName, String brand, Double price, Integer stock, String season, String img, Integer colorID, Integer staffID) {
        this.size = size;
        this.prodName = prodName;
        this.brand = brand;
        this.price = price;
        this.stock = stock;
        this.season = season;
        this.img = img;
        this.colorID = colorID;
        this.staffID = staffID;
    }

    public Shoes(Integer prodID, String size, String prodName, String brand, Double price, Integer stock, String season, String img, Integer colorID, Integer staffID) {
        this.prodID = prodID;
        this.size = size;
        this.prodName = prodName;
        this.brand = brand;
        this.price = price;
        this.stock = stock;
        this.season = season;
        this.img = img;
        this.colorID = colorID;
        this.staffID = staffID;
    }

    public Integer getProdID() {
        return prodID;
    }

    public void setProdID(Integer prodID) {
        this.prodID = prodID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getColorID() {
        return colorID;
    }

    public void setColorID(Integer colorID) {
        this.colorID = colorID;
    }

    public Integer getStaffID() {
        return staffID;
    }

    public void setStaffID(Integer staffID) {
        this.staffID = staffID;
    }

    @Override
    public String toString() {
        return "domain.Shoes[ prodId=" + prodID + "size=" + size + "prodName=" + prodName + "brand=" + brand + "price=" + price + "stock=" + stock + "season=" + season + "img=" + img + "colorID=" + colorID + "staffID=" + staffID + " ]";
    }

}
