<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>movie-list-admin</title>
<link rel="stylesheet" type="text/css" href="/final-check/WebContent/style/style.css" />
</head>
<body>
	<header> <span id="head">Movie Cruiser</span> <img
		src="./images/logo.png" /> <a id="nav-menu" href="ShowMovieListAdmin">Movies</a>
	</header>
	<div>
		<h2 class="content">Movies</h2>
		<table class="content">
			<tr>
				<th class="title-name">Title</th>
				<th class="box-office">Box Office</th>
				<th class="title-text">Active</th>
				<th class="title-text">Date of Launch</th>
				<th class="title-text">Genre</th>
				<th class="title-text">Has Teaser</th>
				<th class="title-text">Action</th>
			</tr>

			<c:forEach items="${movieList}" var="movieList">
				<tr>
					<td class="title-name">${movieList.title}</td>
					<td class="box-office"><fmt:formatNumber type="currency"
							value="${movieList.boxOffice}" var="formatNumber" />${formatNumber}</td>
					<td class="title-text"><c:if test="${movieList.active}">Yes</c:if>
						<c:if test="${!movieList.active}">No</c:if></td>
					<td class="title-text"><fmt:formatDate pattern="dd/MM/yyyy"
							value="${movieList.dateOfLaunch}" /></td>
					<td class="title-text">${movieList.genre}</td>
					<td class="title-text"><c:if test="${movieList.hasTeaser}">yes</c:if>
						<c:if test="${!movieList.hasTeaser}">No</c:if></td>
					<td class="title-text"><a
						href="ShowEditMovie?id=${movieList.id}">Edit</a></td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<footer> <span id="text-margin">Copyright at 2019</span> </footer>
</body>
</html>
