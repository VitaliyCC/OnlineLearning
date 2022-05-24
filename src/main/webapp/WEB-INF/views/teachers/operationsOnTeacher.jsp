<%@ page import="com.learning.spring.models.Teacher" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Teachers</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/templates/navAdmin.jsp"/>

<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-sm-7">
                <h2>Search in the table</h2>
                <p>Search for symbols in all columns:</p>
                <input class="form-control" id="myInput" type="text" placeholder="Search..">
                <br>
            </div>
            <div class="col-sm-4">
                <h2>Operation on teacher</h2>
                <br>

                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#new">
                    Add new teacher
                </button>
                <br>
            </div>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Teacher id (click to see full info)</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Patronymic</th>
                <th>Salary</th>
                <th>Click to edit</th>
            </tr>
            </thead>
            <tbody id="myTable">
            <%List<Teacher> list = ((List<Teacher>)request.getAttribute("teachers"));
                for (Teacher teacher : list) {
            %>
            <tr>
                <th><a class="link-secondary" href="/operation/teacher/show?id=<%=teacher.getTeacherId()%>"
                ><%=teacher.getTeacherId()%></a>
                </th>
                <th ><%=teacher.getName()%></th>
                <th ><%=teacher.getSurname()%></th>
                <th ><%=teacher.getPatronymic()%></th>
                <th ><%=teacher.getSalary()%></th>
                <th><a class="link-secondary" href="/operation/teacher/edit?id=<%=teacher.getTeacherId()%>"
                >Edit</a>
                </th>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
    <br>
    <br>
    <br>


    <!-- The Modal -->
    <div class="modal" id="new">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">New Teacher</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form method="POST" action="/operation/teacher/add"
                           class="needs-validation" novalidate>
                        <div class="form-group">
                            <label for="name" class="form-label">Enter name: </label>
                            <input type="text" name="name" id="name" class="form-control" required minlength="4"
                                   maxlength="15"/>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill this field correctly.</div>
                        </div>
                        <div class="form-group">
                            <label for="surname" class="form-label">Enter surname: </label>
                            <input type="text" name="surname" id="surname" class="form-control" required
                                   minlength="4" maxlength="15"/>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill this field correctly.</div>
                        </div>
                        <div class="form-group">
                            <label for="patronymic" class="form-label">Enter patronymic: </label>
                            <input type="text" name="patronymic" id="patronymic" class="form-control" required
                                   minlength="4" maxlength="20"/>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill this field correctly.</div>
                        </div>
                        <div class="form-group">
                            <label for="salary" class="form-label">Enter salary: </label>
                            <input type="text" name="salary" id="salary" class="form-control" required
                                   min="1000" max="100000"/>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill this field correctly.</div>
                        </div>
                        <div class="form-group">
                            <label for="login" class="form-label">Enter login: </label>
                            <input type="text" name="login" id="login" class="form-control" required
                                   minlength="5" maxlength="20"/>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill this field correctly.</div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="form-label">Enter password: </label>
                            <input type="password" name="password" id="password" class="form-control" required
                                   minlength="5" maxlength="20"/>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill this field correctly.</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Create</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<jsp:include page="/WEB-INF/views/templates/footer.jsp"/>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

<script>
    // Disable form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Get the forms we want to add validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
