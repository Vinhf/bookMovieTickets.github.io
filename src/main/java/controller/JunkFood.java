/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author QuocHai
 */
public class JunkFood {
    private int junkFoodID;
    private String name;
    private double price;
    private String imageUrl;

    public JunkFood() {
    }

    public JunkFood(int junkFoodID, String name, double price, String imageUrl) {
        this.junkFoodID = junkFoodID;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public int getJunkFoodID() {
        return junkFoodID;
    }

    public void setJunkFoodID(int junkFoodID) {
        this.junkFoodID = junkFoodID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    
}
