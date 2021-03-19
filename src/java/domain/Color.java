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
public class Color {

    private Integer colorID;
    private String colorName;
    private String colorCode;

    public Color() {
    }

    public Color(Integer colorID, String colorName, String colorCode) {
        this.colorID = colorID;
        this.colorName = colorName;
        this.colorCode = colorCode;
    }

    public Integer getColorID() {
        return colorID;
    }

    public void setColorID(Integer colorID) {
        this.colorID = colorID;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public String getColorCode() {
        return colorCode;
    }

    public void setColorCode(String colorCode) {
        this.colorCode = colorCode;
    }

    public String toString() {
        return "domain.Color[ colorId=" + colorID + " ]";
    }

}
