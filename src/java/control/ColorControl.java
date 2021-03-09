/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.ColorDA;
import domain.Color;

public class ColorControl {

    private ColorDA colorDA;

    public ColorControl() {
        colorDA = new ColorDA();
    }

    public Color selectRecord(int colorID) {
        return colorDA.getRecord(colorID);
    }

}
