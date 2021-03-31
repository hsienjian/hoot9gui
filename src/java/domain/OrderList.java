/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author Admin-jiahie
 */
public class OrderList {

    private Integer prodID;
    private Integer orderID;
    private Integer qty;
    private double subTtlPrice;

    public OrderList() {

    }

    public OrderList(Integer prodID, Integer orderID, Integer qty, double subTtlPrice) {
        this.prodID = prodID;
        this.orderID = orderID;
        this.qty = qty;
        this.subTtlPrice = subTtlPrice;
    }

    public Integer getProdID() {
        return prodID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public Integer getQty() {
        return qty;
    }

    public double getSubTtlPrice() {
        return subTtlPrice;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public void setProdID(Integer prodID) {
        this.prodID = prodID;
    }

    public void setSubTtlPrice(double subTtlPrice) {
        this.subTtlPrice = subTtlPrice;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    @Override
    public String toString() {
        return "OrderList{" + "prodID=" + prodID + ", orderID=" + orderID + ", subTtlPrice=" + subTtlPrice + ", qty=" + qty + '}';
    }
}