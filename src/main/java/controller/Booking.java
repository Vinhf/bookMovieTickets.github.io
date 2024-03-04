/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author QuocHai
 */
public class Booking {
     private int BookingID;
    private int UserID;
    private int Movie;
    private int ShowtimeID;
    private String BookingDate;
    private int TicketCount;
    private double TotalPrice;
    private String JunkFood;
    private String Seat;
    
    public Booking() {
    }

    public Booking(int BookingID, int UserID, int Movie, int ShowtimeID, String BookingDate, int TicketCount, double TotalPrice, String JunkFood, String Seat) {
        this.BookingID = BookingID;
        this.UserID = UserID;
        this.Movie = Movie;
        this.ShowtimeID = ShowtimeID;
        this.BookingDate = BookingDate;
        this.TicketCount = TicketCount;
        this.TotalPrice = TotalPrice;
        this.JunkFood = JunkFood;
        this.Seat = Seat;
    }

    public String getSeat() {
        return Seat;
    }

    public void setSeat(String Seat) {
        this.Seat = Seat;
    }

   

    public int getMovie() {
        return Movie;
    }

    public void setMovie(int Movie) {
        this.Movie = Movie;
    }

   
    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getShowtimeID() {
        return ShowtimeID;
    }

    public void setShowtimeID(int ShowtimeID) {
        this.ShowtimeID = ShowtimeID;
    }

    public String getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(String BookingDate) {
        this.BookingDate = BookingDate;
    }

    public int getTicketCount() {
        return TicketCount;
    }

    public void setTicketCount(int TicketCount) {
        this.TicketCount = TicketCount;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public String getJunkFood() {
        return JunkFood;
    }

    public void setJunkFood(String JunkFood) {
        this.JunkFood = JunkFood;
    }
    
    
   
}
