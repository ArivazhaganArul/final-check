package com.cognizant.moviecruiser.dao;

import java.util.List;

import com.cognizant.moviecruiser.model.Movie;

public interface FavoriteDao {
	public void addFavorite(long userId, long movieId);

	public List<Movie> getAllFavorite(long userId) throws FavoriteEmptyException;

	public void deleteFavorite(long userId, long movieId);

}
