/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.OrderDA;
import domain.Order;

public class OrderControl {

    private OrderDA orderDA;

    public OrderControl() {
        orderDA = new OrderDA();
    }

    public Order selectRecord(int orderID) {
        return orderDA.getRecord(orderID);
    }
}
