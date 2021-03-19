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
public class Orderlist {

    private Integer orderID;
    private Integer qty;
    private Double subtotal;
    private String status;
    private Integer custID;

    public Orderlist() {
    }

    public Orderlist(int orderID, int qty, Double subtotal, String status, int custID) {
        this.orderID = orderID;
        this.qty = qty;
        this.subtotal = subtotal;
        this.status = status;
        this.custID = custID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getCustID() {
        return custID;
    }

    public void setCustID(Integer custID) {
        this.custID = custID;
    }
}
