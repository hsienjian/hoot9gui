/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.sql.Date;

public class Order {

    private int orderID;
    private Date date;
    private double ttlPrice;
    private String status;
    private Customer custID;

    public Order() {

    }

    public Order(int orderID, Date date, double ttlPrice, String status, Customer custID) {
        this.orderID = orderID;
        this.date = date;
        this.ttlPrice = ttlPrice;
        this.status = status;
        this.custID = custID;
    }

    public int getOrderID() {
        return orderID;
    }

    public Date getDate() {
        return date;
    }

    public double getTtlPrice() {
        return ttlPrice;
    }

    public String getStatus() {
        return status;
    }

    public Customer getCustID() {
        return custID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setTtlPrice(double ttlPrice) {
        this.ttlPrice = ttlPrice;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCustID(Customer custID) {
        this.custID = custID;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", date=" + date + ", ttlPrice=" + ttlPrice + ", status=" + status + ", custID=" + custID + '}';
    }

}
