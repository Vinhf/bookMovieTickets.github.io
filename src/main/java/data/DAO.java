/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import com.mycompany.pro.SignUp;
import com.mycompany.pro.login;
import controller.Booking;
import controller.JunkFood;
import controller.Movie;
import controller.Seat;
import controller.Showtime;
import controller.Theater;
import java.text.SimpleDateFormat;
import java.util.Date;
import controller.Users;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuocHai
 */
public class DAO extends userContext {

    private static final String SELECT_ALL_ACCOUNTS = "SELECT * FROM [Users]";
    private Connection conn;

    public DAO() {
        this.conn = userContext.connect();
    }

    public ResultSet getAllaccount() {
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(SELECT_ALL_ACCOUNTS);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    public ResultSet getAllShowtimes() {
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from Showtimes");
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    public ResultSet getAllTheaters() {
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from Theaters");
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    public ResultSet getIDTheaters(int id) {
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement("select * from Theaters where TheaterID = " + id + "");
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    public ResultSet getNameUser(String User) {
        ResultSet rs = null;
        PreparedStatement ps = null;
        String sql = "SELECT * FROM [Users] where Username = '" + User + "'";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    //doc tat ca cac ban ghi table
    public List<Users> getUser() {
        List<Users> listUsers = new ArrayList<>();
        String sql = "select * from Users";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString("Username"), rs.getString("Password"), rs.getInt("UserType"), rs.getString("Email"), rs.getString("Phone"), rs.getString("BirthDay"), rs.getString("Gender"), rs.getString("Region"), rs.getString("FavoriteCinema"));
                listUsers.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listUsers;
    }

    public List<Movie> getMovie() {
        List<Movie> listMovie = new ArrayList<>();
        String sql = "select * from Movie";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie m = new Movie(rs.getInt("MovieId"), rs.getString("Title"), rs.getString("Description"), rs.getString("ReleaseDate"), rs.getString("Genre"), rs.getString("ImageUrl"), rs.getInt("status"), rs.getInt("Evaluate"), rs.getString("ImageUrlBig"));
                listMovie.add(m);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listMovie;
    }

    public ResultSet getAllMovie() {
        String query = "select * from Movie";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }
    
    public ResultSet getAllJunkFoods() {
        String query = "select * from JunkFood";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }
    
    public ResultSet getIdJunkFoods(int id) {
        String query = "select * from JunkFood where JunkFoodID ="+id+"";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    public boolean signUp(String username, String hashedPassword, int userType, String email, String phone, String birthday, String gender, String region, String favoriteCinema) {
        String sql = "INSERT INTO [Users] (Username, Password, UserType, Email, Phone, BirthDay, Gender, Region, FavoriteCinema) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, hashedPassword);
            ps.setInt(3, userType);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, birthday);
            ps.setString(7, gender);
            ps.setString(8, region);
            ps.setString(9, favoriteCinema);

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            // Log và/hoặc xử lý lỗi ở đây
            ex.printStackTrace();
        }
        return false;
    }

    public ResultSet getName(int ShowtimeId) {
        String sql = "SELECT t.Name AS TheaterName, m.Title AS MovieTitle "
                + "FROM Theaters t "
                + "JOIN Showtimes s ON t.TheaterID = s.TheaterID "
                + "JOIN Movie m On s.MovieID = m.MovieID "
                + "WHERE s.ShowtimeID = " + ShowtimeId + "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    public ResultSet getMovieID(int id) {
        String query = "select * from Movie where MovieId = " + id + "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, "SQL Exception while fetching all accounts", ex);
        } finally {
            // Consider closing the PreparedStatement here if not used later
        }
        return rs;
    }

    // lay so ghe so hang 
    public List<Seat> getSeats() {
        List<Seat> ListSeat = new ArrayList<>();

        String query = "SELECT * FROM Seats";

        try {
            ResultSet rs = null;
            PreparedStatement ps = null;
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                Seat seat = new Seat();
                seat.setSeatID(rs.getInt("SeatID"));
                seat.setRow(rs.getInt("RowNumber"));
                seat.setSeatNumber(rs.getInt("SeatNumber"));
                seat.setSeatStatus(rs.getString("Status"));
                ListSeat.add(seat);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ListSeat;
    }

    public List<Seat> getAllSeatsWithStatus(int showtimeId) {
        List<Seat> allSeats = new ArrayList<>();
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String sql = "SELECT s.SeatID, s.RowNumber, s.SeatNumber, "
                    + "COALESCE(sb.Status, 'available') AS Status "
                    + "FROM [Database_movie].[dbo].[Seats] s "
                    + "LEFT JOIN [Database_movie].[dbo].[SeatBookings] sb ON s.SeatID = sb.SeatID AND sb.ShowtimeID = ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, showtimeId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Seat seat = new Seat();
                seat.setSeatID(rs.getInt("SeatID"));
                seat.setRow(rs.getInt("RowNumber"));
                seat.setSeatNumber(rs.getInt("SeatNumber"));
                seat.setSeatStatus(rs.getString("Status")); // trạng thái có thể là 'booked' hoặc 'available'
                allSeats.add(seat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return allSeats;
    }

    public boolean bookSeats(int seatIds, int showtimeId, int UserID) {
        ResultSet rs = null;
        PreparedStatement psSelect = null;
        PreparedStatement psInsert = null;

        try {
            // First, check if the combination of seatIds and showtimeId already exists
            psSelect = conn.prepareStatement("SELECT 1 FROM SeatBookings WHERE SeatID = ? AND ShowtimeID = ?");
            psSelect.setInt(1, seatIds);
            psSelect.setInt(2, showtimeId);

            rs = psSelect.executeQuery();

            // If the result set is not empty, the combination exists, so return false
            if (rs.next()) {
                return false;
            }

            // If we're here, the combination does not exist, so we can insert it
            psInsert = conn.prepareStatement("INSERT INTO SeatBookings (SeatID, ShowtimeID, [Status],UserID) VALUES (?, ?, 'booked',?)");
            psInsert.setInt(1, seatIds);
            psInsert.setInt(2, showtimeId);
            psInsert.setInt(3, UserID);
            psInsert.executeUpdate();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Close ResultSet and PreparedStatements to prevent memory leaks
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.close();
                }
                if (psSelect != null && !psSelect.isClosed()) {
                    psSelect.close();
                }
                if (psInsert != null && !psInsert.isClosed()) {
                    psInsert.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Showtime> getShowtimesByMovieID(int movieID, String date) {
        List<Showtime> showtimes = new ArrayList<>();

        // Kiểm tra xem ngày nhập vào có sau ngày hiện tại không
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(new Date());
        if (date.compareTo(today) < 0) {
            // Nếu ngày nhập vào là trước ngày hiện tại, không trả về suất chiếu nào
            return showtimes;
        } else {
            // Nếu ngày nhập vào là ngày hiện tại hoặc tương lai, thực hiện truy vấn SQL
            String query = "SELECT * FROM Showtimes WHERE DateAdded = ? AND MovieID = ?";

            try ( PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, date);
                ps.setInt(2, movieID);

                try ( ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Showtime showtime = new Showtime();
                        showtime.setShowtimeID(rs.getInt("ShowtimeID"));
                        showtime.setMovieID(rs.getInt("MovieID"));
                        showtime.setStartTime(rs.getString("StartTime"));
                        showtime.setEndTime(rs.getString("EndTime"));
                        showtime.setTheaterID(rs.getInt("TheaterID"));
                        showtime.setTicketPrice(rs.getInt("TicketPrice"));
                        showtime.setDateAdded(rs.getString("DateAdded"));
                        showtimes.add(showtime);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return showtimes;
        }
    }

    public List<Showtime> getShowtimes(int showid) {
        List<Showtime> showtimes = new ArrayList<>();

        String query = "SELECT * FROM Showtimes WHERE ShowtimeID = ? ;";

        try {
            ResultSet rs = null;
            PreparedStatement ps = null;
            ps = conn.prepareStatement(query);
            ps.setInt(1, showid);
            rs = ps.executeQuery();

            while (rs.next()) {
                String StartTimeOnly = rs.getString("StartTime");
                String EndTimeOnly = rs.getString("EndTime");
                Showtime showtime = new Showtime();
                showtime.setShowtimeID(rs.getInt("ShowtimeID"));
                showtime.setStartTime(StartTimeOnly);
                showtime.setEndTime(EndTimeOnly);
                showtime.setMovieID(rs.getInt("MovieID"));
                showtime.setTheaterID(rs.getInt("TheaterID"));
                showtime.setTicketPrice(rs.getInt("TicketPrice"));
                showtime.setDateAdded(rs.getString("DateAdded"));
                showtimes.add(showtime);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return showtimes;
    }

    public int getSeatID(int row, int colum) {

        String query = "select SeatID from Seats where RowNumber = " + row + " and SeatNumber = " + colum + "";
        int ID = 0;
        try {
            ResultSet rs = null;
            PreparedStatement ps = null;
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                ID = rs.getInt("SeatID");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ID;
    }

    public boolean isSeatAvailable(int seatId, int showtimeId) {
        // Assume conn is a valid and open database connection
        try ( PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM SeatBookings WHERE SeatID = ? AND ShowtimeID = ?")) {
            ps.setInt(1, seatId);
            ps.setInt(2, showtimeId);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0; // Seat is available if count is 0
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with proper logging
            return false; // If there's an error, treat it as if the seat is not available
        }
        return false;
    }

    public List<JunkFood> getAllJunkFood() {
        List<JunkFood> junkFoods = new ArrayList<>();
        String sql = "SELECT * FROM JunkFood";
        try {
            ResultSet rs = null;
            PreparedStatement ps = null;
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                JunkFood junkFood = new JunkFood();
                junkFood.setJunkFoodID(rs.getInt("JunkFoodID"));
                junkFood.setName(rs.getString("Name"));
                junkFood.setPrice(rs.getDouble("Price"));
                junkFood.setImageUrl(rs.getString("ImageUrl"));
                junkFoods.add(junkFood);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return junkFoods;
    }

    public boolean insertBooking(int userId, int showtimeId, int ticketCount, double totalPrice, String junkFood, int MovieID, String seat) {
        boolean insertSuccess = false;
        String sql = "INSERT INTO Bookings (UserID, ShowtimeID, TicketCount, TotalPrice, JunkFood, MovieID,Seats) VALUES (?, ?, ?, ?, ?,?,?)";

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, showtimeId);
            pstmt.setInt(3, ticketCount);
            pstmt.setDouble(4, totalPrice);
            pstmt.setString(5, junkFood);
            pstmt.setInt(6, MovieID);
            pstmt.setString(7, seat);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                insertSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return insertSuccess;
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings";

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingID(rs.getInt("BookingID"));
                booking.setUserID(rs.getInt("UserID"));
                booking.setShowtimeID(rs.getInt("ShowtimeID"));
                booking.setTicketCount(rs.getInt("TicketCount"));
                booking.setTotalPrice(rs.getDouble("TotalPrice"));
                booking.setJunkFood(rs.getString("JunkFood"));
                booking.setBookingDate(rs.getString("BookingTime"));

                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    // Function để thực hiện truy vấn và trả về ResultSet
    public ResultSet getUserBookings(int userId) throws SQLException {
        String query = "SELECT "
                + "b.BookingID, "
                + "u.Username, "
                + "u.Phone, "
                + "th.Name AS TheaterName, "
                + "m.Title AS MovieTitle, "
                + "st.StartTime, "
                + "b.Seats, " // Assuming you've already added this column to your Bookings table
                + "b.BookingTime, " // Including the BookingTime column
                + "b.TicketCount, "
                + "b.TotalPrice, "
                + "b.JunkFood "
                + "FROM [Database_movie].[dbo].[Bookings] b "
                + "INNER JOIN [Database_movie].[dbo].[Users] u ON b.UserID = u.UserID "
                + "INNER JOIN [Database_movie].[dbo].[Showtimes] st ON b.ShowtimeID = st.ShowtimeID "
                + "INNER JOIN [Database_movie].[dbo].[Movie] m ON st.MovieID = m.MovieID "
                + "INNER JOIN [Database_movie].[dbo].[Theaters] th ON st.TheaterID = th.TheaterID "
                + "WHERE u.UserID = ? " // The user ID condition
                + "ORDER BY b.BookingTime DESC"; // Ordering by BookingTime in descending order
        PreparedStatement pstmt = conn.prepareStatement(query);

        // Set the value for the query parameter (UserID)
        pstmt.setInt(1, userId);

        return pstmt.executeQuery(); // Execute the query and return the result
    }

    public boolean deleteMovie(int movieId) {
        String sql = "DELETE FROM [dbo].[Movie] WHERE MovieID = ?";

        try (
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);

            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean insertMovie(Movie movie) {
        String sql = "INSERT INTO [dbo].[Movie] "
                + "(Title, Description, ReleaseDate, Genre, ImageUrl, status, Evaluate, ImageUrlBig) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, movie.getTitle());
            pstmt.setString(2, movie.getDescription());
            pstmt.setString(3, movie.getReleaseDate());
            pstmt.setString(4, movie.getGenre());
            pstmt.setString(5, movie.getImageUrl());
            pstmt.setInt(6, movie.getStatus());
            pstmt.setInt(7, movie.getEvaluate());
            pstmt.setString(8, movie.getImageUrlBig());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteShowtime(int showtimeId) {
        String sql = "DELETE FROM [dbo].[Showtimes] WHERE ShowtimeID = ?";

        try (
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, showtimeId);

            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateShowtime(Showtime showtime) {
        String sql = "UPDATE [dbo].[Showtimes] SET MovieID = ?, StartTime = ?, EndTime = ?, TheaterID = ?, TicketPrice = ?, DateAdded = ? WHERE ShowtimeID = ?";

        try (
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, showtime.getMovieID());
            pstmt.setString(2, showtime.getStartTime());
            pstmt.setString(3, showtime.getEndTime());
            pstmt.setInt(4, showtime.getTheaterID());
            pstmt.setDouble(5, showtime.getTicketPrice());
            pstmt.setString(6, showtime.getDateAdded());
            pstmt.setInt(7, showtime.getShowtimeID());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean deleteTheater(int theaterId) {
        String sql = "DELETE FROM [dbo].[Theater] WHERE TheaterID = ?";

        try (
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, theaterId);

            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addShowtime(Showtime showtime) {
        String sql = "INSERT INTO [dbo].[Showtimes] (MovieID, StartTime, EndTime, TheaterID, TicketPrice, DateAdded) VALUES (?, ?, ?, ?, ?, ?)";

        try (  PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, showtime.getMovieID());
            pstmt.setString(2, showtime.getStartTime());
            pstmt.setString(3, showtime.getEndTime());
            pstmt.setInt(4, showtime.getTheaterID());
            pstmt.setDouble(5, showtime.getTicketPrice());
            pstmt.setString(6, showtime.getDateAdded());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addTheater(Theater theater) {
    String sql = "INSERT INTO Theaters (Name, Address, SeatCount) VALUES (?, ?, ?)";

    try (
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
         
        pstmt.setString(1, theater.getName());
        pstmt.setString(2, theater.getAddress());
        pstmt.setInt(3, theater.getSeatcout());

        int rowsInserted = pstmt.executeUpdate();
        return rowsInserted > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}


    public boolean updateTheater(Theater theater) {
        String sql = "UPDATE Theaters  SET Name = ?, Address = ?, SeatCount = ? WHERE TheaterID = ?";

        try ( PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, theater.getName());
            pstmt.setString(2, theater.getAddress());
            pstmt.setInt(3, theater.getSeatcout());
            pstmt.setInt(4, theater.getThearterID());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateMovie(Movie movie) {
        String sql = "UPDATE [dbo].[Movie] SET Title = ?, Description = ?, ReleaseDate = ?, Genre = ?, ImageUrl = ?, status = ?, Evaluate = ?, ImageUrlBig = ? WHERE MovieID = ?";

        try ( PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, movie.getTitle());
            pstmt.setString(2, movie.getDescription());
            pstmt.setString(3, movie.getReleaseDate());
            pstmt.setString(4, movie.getGenre());
            pstmt.setString(5, movie.getImageUrl());
            pstmt.setInt(6, movie.getStatus());
            pstmt.setInt(7, movie.getEvaluate());
            pstmt.setString(8, movie.getImageUrlBig());
            pstmt.setInt(9, movie.getMovieId());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public void addJunkFood(JunkFood junkFood) throws SQLException {
        String sql = "INSERT INTO dbo.JunkFood (Name, Price, ImageUrl) VALUES (?, ?, ?)";
        try (
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, junkFood.getName());
            pstmt.setDouble(2, junkFood.getPrice());
            pstmt.setString(3, junkFood.getImageUrl());
            pstmt.executeUpdate();
        }
    }

    public void deleteJunkFood(int junkFoodID) throws SQLException {
        String sql = "DELETE FROM dbo.JunkFood WHERE JunkFoodID = ?";
        try (
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, junkFoodID);
            pstmt.executeUpdate();
        }
    }

    public void updateJunkFood(JunkFood junkFood) throws SQLException {
        String sql = "UPDATE JunkFood SET Name = ?, Price = ?, ImageUrl = ? WHERE JunkFoodID = ?";
        try (
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, junkFood.getName());
            pstmt.setDouble(2, junkFood.getPrice());
            pstmt.setString(3, junkFood.getImageUrl());
            pstmt.setInt(4, junkFood.getJunkFoodID());
            pstmt.executeUpdate();
        }
    }

    public static void main(String[] args) throws SQLException {
        DAO dao = new DAO();
//        System.out.println(dao.getSeatID(2, 6));
    ResultSet rsm = dao.getAllMovie();
        while (rsm.next()) {            
            rsm.getString("MovieID");
            rsm.getString("Title");
            rsm.getString("MovieID");
            rsm.getString("MovieID");
            rsm.getInt("Evaluate");
            
        }
    
        ResultSet rsJ = dao.getAllJunkFoods();
        while (rsJ.next()) {
           
            rsJ.getString("JunkFoodID");
            rsJ.getString("Name");
            rsJ.getString("Price");
            rsJ.getString("ImageUrl");

            System.out.println(rsJ.getString("JunkFoodID"));
        }

//        List<JunkFood> junkFoodList = dao.getAllJunkFood();
//        for (JunkFood food : junkFoodList) {
//
//        }
//
//        // Tạo một đối tượng SimpleDateFormat với định dạng mong muốn
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date now = new Date();
//
//        // Format ngày giờ
//        String strDate = formatter.format(now);
//
//// In ra ngày giờ đã format
//        System.out.println("Formatted Date and Time: " + strDate);
//        
//        List<Booking> listB = dao.getAllBookings();
//        for (Booking booking : listB) {
//            System.out.println(booking.getBookingID());
//        }
    }

}
