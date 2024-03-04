/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author QuocHai
 */
public class Users {

    private String IdUser;
    private String Username;
    private String Password;
    private int UserType;
    private String email;
    private String Phone;
    private String BirthDay;
    private String Gender;
    private String Region;
    private String FavoriteCinema;

    public Users() {
    }

    public Users(String Username, String Password, int UserType, String email, String Phone, String BirthDay, String Gender, String Region, String FavoriteCinema) {

        this.Username = Username;
        this.Password = Password;
        this.UserType = UserType;
        this.email = email;
        this.Phone = Phone;
        this.BirthDay = BirthDay;
        this.Gender = Gender;
        this.Region = Region;
        this.FavoriteCinema = FavoriteCinema;
    }

    public String getIdUser() {
        return IdUser;
    }

    public void setIdUser(String IdUser) {
        this.IdUser = IdUser;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getUserType() {
        return UserType;
    }

    public void setUserType(int UserType) {
        this.UserType = UserType;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getBirthDay() {
        return BirthDay;
    }

    public void setBirthDay(String BirthDay) {
        this.BirthDay = BirthDay;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getRegion() {
        return Region;
    }

    public void setRegion(String Region) {
        this.Region = Region;
    }

    public String getFavoriteCinema() {
        return FavoriteCinema;
    }

    public void setFavoriteCinema(String FavoriteCinema) {
        this.FavoriteCinema = FavoriteCinema;
    }

    
    
    

}
