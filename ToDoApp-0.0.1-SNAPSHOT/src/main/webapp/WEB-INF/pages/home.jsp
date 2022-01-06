<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title><c:out value="${page}"></c:out></title>
</head>
<body>

	<div class="container mt-4">

		<h1 class="text-center">Welcome to Todo Manager</h1>

		<c:if test="${not empty msg}">

			<div class="alert alert-success">
				<b> <c:out value="${msg}">
					</c:out></b>
			</div>

		</c:if>

		<div class="row mt-5">

			<div class="text-center col-md-2 ">


				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">
						Menu</button>
					<a href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action">Add-ToDo</a> <a
						href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action">View-Todo</a>
				</div>

			</div>
			<div class="col-md-10 text-center">
				<c:if test="${page=='home'}">
					<h1 class="text-center">All Todo</h1>

					<c:forEach items="${todos}" var="t">

						<div class="card">
							<div class="card-body">
								<h3>
									<c:out value="${t.todoTitle }"></c:out>
								</h3>
								<p>
									<c:out value="${t.todoContent }"></c:out>
								</p>

							</div>
						</div>

					</c:forEach>


				</c:if>
				<c:if test="${page =='add'}">
					<h1 class="text-center">Add Todo</h1>
					<br>
					<c:url var="post_url" value="/saveTodo" />
					<form:form action="${post_url}" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter Todo Title" />
						</div>
						<br>
						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Enter Todo Content" cssStyle="height:300px" />
						</div>
						<br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Todo</button>
						</div>
					</form:form>
				</c:if>
			</div>
		</div>

	</div>
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
</html>