package com.cognizant.moviecruiser.dao;

public class FavoriteEmptyException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2830888677509067652L;

	public FavoriteEmptyException() {
		super("Favorite Empty");

	}

	public FavoriteEmptyException(String message) {
		super(message);

	}

}
