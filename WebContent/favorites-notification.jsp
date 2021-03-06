<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>favorites-notification</title>
<link rel="stylesheet" type="text/CSS" href="./style/style.css" />
</head>
<body>
	<header> <span id="head">Movie Cruiser</span> <img
		src="./images/logo.png" /> <a id="nav-menu" href="favorites.html">Favorites</a>
	<a id="nav-menu" href="movie-list-customer.html">Movies</a> </header>
	<div>
		<h2 class="content">Favorites</h2>
		<p id=center>Movie removed from Favorites Successfully</p>
		<table class="content">
			<tr>
				<th class="title-name">Title</th>
				<th class="title-price">Box Office</th>
				<th class="title-text">Genre</th>
			</tr>
			<tr>
				<td class="title-name">Avatar</td>
				<td class="title-price">$2,787,965,087</td>
				<td class="title-text">Science Fiction</td>
				<td class="title-text"><a href="favorites-notification.html"
					class="link-color">Delete</a></td>
			</tr>
			<tr>
				<td class="title-name">The Avengers</td>
				<td class="title-price">$1,518,812,988</td>
				<td class="title-text">Superhero</td>
				<td class="title-text"><a href="favorites-notification.html"
					class="link-color">Delete</a></td>
			</tr>
		</table>
		<p class="content">
			<strong>No.of Favorites:</strong> 2
		</p>
	</div>
	<footer> <span id="text-margin">Copyright © 2019</span> </footer>
</body>
</html>
