package com.cognizant.moviecruiser.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cognizant.moviecruiser.model.Movie;


public class MovieDaoSqlImpl implements MovieDao {

	@Override
	public List<Movie> getMovieListAdmin() {
		List<Movie> movieList = new ArrayList<>();
		Movie ma;
		try {
			Connection con = ConnectionHandler.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from movie");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				long id = rs.getInt("m_id");
				String title = rs.getString("m_title");
				long boxOffice = rs.getLong("m_boxOffice");
				boolean active = false;
				if (rs.getString("m_active").equalsIgnoreCase("YES")) {
					active = true;
				}
				Date dateOfLaunch = rs.getDate("m_dateOfLaunch");
				String genre = rs.getString("m_genre");
				boolean hasTeaser = false;
				if (rs.getString("m_hasTeaser").equalsIgnoreCase("YES")) {
					hasTeaser = true;
				}
				ma = new Movie(id, title, boxOffice, active, dateOfLaunch, genre, hasTeaser);
				movieList.add(ma);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return movieList;
	}

	@Override
	public List<Movie> getMovieListCustomer() {
		List<Movie> customerList = new ArrayList<>();
		Movie mc;
		try {
			Connection con = ConnectionHandler.getConnection();
			String sql = "Select * from movie where m_active='yes' and m_dateOfLaunch <= current_date()";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				long id = rs.getInt("m_id");
				String title = rs.getString("m_title");
				long boxOffice = rs.getLong("m_boxOffice");
				boolean active = false;
				if (rs.getString("m_active").equalsIgnoreCase("YES")) {
					active = true;
				}
				Date dateOfLaunch = rs.getDate("m_dateOfLaunch");
				String genre = rs.getString("m_genre");
				boolean hasTeaser = false;
				if (rs.getString("m_hasTeaser").equalsIgnoreCase("YES")) {
					hasTeaser = true;
				}
				mc = new Movie(id, title, boxOffice, active, dateOfLaunch, genre, hasTeaser);
				customerList.add(mc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerList;
	}

	@Override
	public void modifyMovie(Movie movie) {
		Connection con = ConnectionHandler.getConnection();
		try {
			String sql = "update movie set m_title=?,m_boxOffice=?,m_active=?,m_dateOfLaunch=?,m_genre=?,m_hasTeaser=? where m_id=?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, movie.getTitle());
			preparedStatement.setFloat(2, movie.getBoxOffice());
			if (movie.isActive()) {
				preparedStatement.setString(3, "Yes");
			} else {
				preparedStatement.setString(3, "No");
			}
			preparedStatement.setDate(4, new java.sql.Date(movie.getDateOfLaunch().getTime()));
			preparedStatement.setString(5, movie.getGenre());
			if (movie.isHasTeaser()) {
				preparedStatement.setString(6, "Yes");
			} else {
				preparedStatement.setString(6, "No");
			}

			preparedStatement.setLong(7, movie.getId());
			preparedStatement.executeUpdate();
		} catch (SQLException sq) {
			sq.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public Movie getMovie(long movieId) {
		Connection con = ConnectionHandler.getConnection();
		ResultSet resultSet;
		Movie movie = null;
		if (con != null) {
			try {
				String sql = "select * from movie where m_id=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setLong(1, movieId);
				resultSet = ps.executeQuery();
				boolean activeVg, hasTeaserVg;
				Date dateOfLaunch;
				while (resultSet.next()) {
					String title = resultSet.getString(2);
					long boxOffice = resultSet.getLong(3);
					String active = resultSet.getString(4);
					dateOfLaunch = resultSet.getDate(5);
					String genre = resultSet.getString(6);
					String hasTeaser = resultSet.getString(7);
					if (active != null && active.equals("Yes"))
						activeVg = true;
					else
						activeVg = false;
					if (hasTeaser != null && hasTeaser.equals("Yes"))
						hasTeaserVg = true;
					else
						hasTeaserVg = false;
					movie = new Movie(movieId, title, boxOffice, activeVg, dateOfLaunch, genre,
							hasTeaserVg);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return movie;
	}

}
