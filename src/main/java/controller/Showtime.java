/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author QuocHai
 */
public class Showtime {
    private int ShowtimeID;
    private int MovieID;
    private String StartTime;
    private String EndTime;
    private int TheaterID;
    private int TicketPrice;
    private String DateAdded;
    public Showtime() {
    }

    public Showtime(int ShowtimeID, int MovieID, String StartTime, String EndTime, int TheaterID, int TicketPrice, String DateAdded) {
        this.ShowtimeID = ShowtimeID;
        this.MovieID = MovieID;
        this.StartTime = StartTime;
        this.EndTime = EndTime;
        this.TheaterID = TheaterID;
        this.TicketPrice = TicketPrice;
        this.DateAdded = DateAdded;
        
    }

    public Showtime(int MovieID, String StartTime, String EndTime, int TheaterID, int TicketPrice, String DateAdded) {
        this.MovieID = MovieID;
        this.StartTime = StartTime;
        this.EndTime = EndTime;
        this.TheaterID = TheaterID;
        this.TicketPrice = TicketPrice;
        this.DateAdded = DateAdded;
    }

    

    public String getDateAdded() {
        return DateAdded;
    }

    public void setDateAdded(String DateAdded) {
        this.DateAdded = DateAdded;
    }

   

    

    public int getShowtimeID() {
        return ShowtimeID;
    }

    public void setShowtimeID(int ShowtimeID) {
        this.ShowtimeID = ShowtimeID;
    }

    public int getMovieID() {
        return MovieID;
    }

    public void setMovieID(int MovieID) {
        this.MovieID = MovieID;
    }

    public String getStartTime() {
        return StartTime;
    }

    public void setStartTime(String StartTime) {
        this.StartTime = StartTime;
    }

    public String getEndTime() {
        return EndTime;
    }

    public void setEndTime(String EndTime) {
        this.EndTime = EndTime;
    }

    public int getTheaterID() {
        return TheaterID;
    }

    public void setTheaterID(int TheaterID) {
        this.TheaterID = TheaterID;
    }

    public int getTicketPrice() {
        return TicketPrice;
    }

    public void setTicketPrice(int TicketPrice) {
        this.TicketPrice = TicketPrice;
    }
    
    
}
