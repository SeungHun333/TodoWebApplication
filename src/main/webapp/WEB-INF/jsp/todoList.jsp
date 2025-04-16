<%@ include file="common/header.jspf"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>3269+
3.012
0
<body>
<%@ include file="common/navigation.jspf"%>
<div class="container">
    <h1>Your Todos are</h1>
    <table class="table">
        <thead>
            <th>Description</th>
            <th>Target Date</th>
            <th>Is Done?</th>
            <th></th>
            <th></th>
        </thead>
        <tbody>
        <c:forEach items="${todos}" var="todo">
            <tr>
                <td>${todo.description}</td>
                <td>${todo.targetDate}</td>
                <td>${todo.done}</td>
                <td><a href="delete-todo?UUID=${todo.UUID}" class="btn btn-warning" onclick="return confirm('정말 삭제하시겠습니까?');">Delete</a></td>
                <td>
                    <button type="button" class="btn btn-success" onclick="toggleUpdateForm('${todo.UUID}')">Update</button>
                </td>
            </tr>
            <!-- 업데이트 폼 -->
            <tr id="updateForm-${todo.UUID}" style="display: none;">
                <td colspan="5">
                    <form:form action="update-todo" modelAttribute="todo" method="post">
                        <form:hidden path="UUID" value="${todo.UUID}" />
                        <div class="mb-3">
                            <label for="description-${todo.UUID}" class="form-label">Description</label>
                            <form:input path="description" id="description-${todo.UUID}" cssClass="form-control" value="${todo.description}" />
                        </div>
                        <div class="mb-3">
                            <label for="targetDate-${todo.UUID}" class="form-label">Target Date</label>
                            <form:input path="targetDate" id="targetDate-${todo.UUID}" cssClass="form-control" type="date" value="${todo.targetDate}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Is Done?</label>
                            <form:checkbox path="done" checked="${todo.done}" />
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Add Todo 버튼 -->
    <button class="btn btn-success" onclick="toggleForm()">Add Todo</button>

    <!-- 숨겨진 Todo 등록 폼 -->
    <div id="todoForm" style="display:none; margin-top: 20px;">
        <form:form action="add-todo" modelAttribute="todo" method="post">
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <form:input type="text" cssClass="form-control" path="description" id="description" required="required" />
            </div>
            <div class="mb-3">
                <label for="targetDate" class="form-label">Target Date</label>
                <form:input type="date" cssClass="form-control" path="targetDate" id="targetDate" required="required" />
            </div>
            <button type="submit" class="btn btn-primary">Save Todo</button>
        </form:form>
    </div>
</div>
<%@ include file="common/footer.jspf"%>

<script>
    function toggleForm() {
        const form = document.getElementById("todoForm");
        form.style.display = (form.style.display === "none") ? "block" : "none";
    }

    function toggleUpdateForm(uuid) {
        const formRow = document.getElementById("updateForm-" + uuid);
        if (formRow) {
            formRow.style.display = (formRow.style.display === "none") ? "table-row" : "none";
        }
    }
</script>
</body>
</html>
