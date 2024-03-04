/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author QuocHai
 */
public class Seat {
    private int SeatID;
    private int row;
    private int seatNumber;
    private String SeatStatus;

    public Seat() {
    }

    public Seat(int SeatID, int row, int seatNumber, String SeatStatus) {
        this.SeatID = SeatID;
        this.row = row;
        this.seatNumber = seatNumber;
        this.SeatStatus = SeatStatus;
    }

    public int getSeatID() {
        return SeatID;
    }

    public void setSeatID(int SeatID) {
        this.SeatID = SeatID;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getSeatStatus() {
        return SeatStatus;
    }

    public void setSeatStatus(String SeatStatus) {
        this.SeatStatus = SeatStatus;
    }

    
}
