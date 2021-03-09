/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.ShoesDA;
import domain.Shoes;

public class ShoesControl {

    private ShoesDA shoesDA;

    public ShoesControl() {
        shoesDA = new ShoesDA();
    }

    public Shoes selectRecord(int prodID) {
        return shoesDA.getRecord(prodID);
    }
}
