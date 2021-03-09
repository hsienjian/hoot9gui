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
public class Color {

    private int colorID;
    private String colorName;
    private String colorCode;
    private String image;

    public Color() {

    }

    public Color(int colorID, String colorName, String colorCode, String image) {
        this.colorID = colorID;
        this.colorName = colorName;
        this.colorCode = colorCode;
        this.image = image;
    }

    public int getColorID() {
        return colorID;
    }

    public String getColorName() {
        return colorName;
    }

    public String getColorCode() {
        return colorCode;
    }

    public String getImage() {
        return image;
    }

    public void setColorID(int colorID) {
        this.colorID = colorID;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public void setColorCode(String colorCode) {
        this.colorCode = colorCode;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Color{" + "colorID=" + colorID + ", colorName=" + colorName + ", colorCode=" + colorCode + ", image=" + image + '}';
    }

}
