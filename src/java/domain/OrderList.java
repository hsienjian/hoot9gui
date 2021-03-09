/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

public class OrderList {

    private Shoes prodID;
    private Order orderID;
    private int qty;
    private double subtotal;

    public OrderList() {

    }

    public OrderList(Shoes prodID, Order orderID, int qty, double subtotal) {
        this.prodID = prodID;
        this.orderID = orderID;
        this.qty = qty;
        this.subtotal = subtotal;
    }

    public Shoes getProdID() {
        return prodID;
    }

    public Order getOrderID() {
        return orderID;
    }

    public int getQty() {
        return qty;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setProdID(Shoes prodID) {
        this.prodID = prodID;
    }

    public void setOrderID(Order orderID) {
        this.orderID = orderID;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "OrderList{" + "prodID=" + prodID + ", orderID=" + orderID + ", qty=" + qty + ", subtotal=" + subtotal + '}';
    }

}
