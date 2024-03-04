/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author QuocHai
 */
public class Movie {
    private int MovieId;
    private String Title;
    private String Description;
    private String ReleaseDate;
    private String Genre;
    private String ImageUrl;
    private int status;
    private int Evaluate;
    private String ImageUrlBig;

    public Movie() {
    }

    public Movie(int MovieId, String Title, String Description, String ReleaseDate, String Genre, String ImageUrl, int status, int Evaluate, String ImageUrlBig) {
        this.MovieId = MovieId;
        this.Title = Title;
        this.Description = Description;
        this.ReleaseDate = ReleaseDate;
        this.Genre = Genre;
        this.ImageUrl = ImageUrl;
        this.status = status;
        this.Evaluate = Evaluate;
        this.ImageUrlBig = ImageUrlBig;
    }

    public String getImageUrlBig() {
        return ImageUrlBig;
    }

    public void setImageUrlBig(String ImageUrlBig) {
        this.ImageUrlBig = ImageUrlBig;
    }



    public int getEvaluate() {
        return Evaluate;
    }

    public void setEvaluate(int Evaluate) {
        this.Evaluate = Evaluate;
    }

    public int getMovieId() {
        return MovieId;
    }

    public void setMovieId(int MovieId) {
        this.MovieId = MovieId;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getReleaseDate() {
        return ReleaseDate;
    }

    public void setReleaseDate(String ReleaseDate) {
        this.ReleaseDate = ReleaseDate;
    }

    public String getGenre() {
        return Genre;
    }

    public void setGenre(String Genre) {
        this.Genre = Genre;
    }

    public String getImageUrl() {
        return ImageUrl;
    }

    public void setImageUrl(String ImageUrl) {
        this.ImageUrl = ImageUrl;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
