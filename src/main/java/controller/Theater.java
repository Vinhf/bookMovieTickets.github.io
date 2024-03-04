/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author QuocHai
 */
public class Theater {
    private int TheaterID;
    private String Name;
    private String Address;
    private int Seatcout;

    public Theater() {
    }

    public Theater(int ThearterID, String Name, String Address, int Seatcout) {
        this.TheaterID = ThearterID;
        this.Name = Name;
        this.Address = Address;
        this.Seatcout = Seatcout;
    }

    public int getThearterID() {
        return TheaterID;
    }

    public void setThearterID(int ThearterID) {
        this.TheaterID = ThearterID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getSeatcout() {
        return Seatcout;
    }

    public void setSeatcout(int Seatcout) {
        this.Seatcout = Seatcout;
    }
    
    
}
