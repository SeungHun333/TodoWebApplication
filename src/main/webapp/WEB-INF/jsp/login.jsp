<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .btn-signup {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h2 class="text-center mb-4">로그인</h2>
        <form method="post" action="/login">
            <div class="mb-3">
                <label for="username" class="form-label">아이디</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="아이디 입력" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">로그인</button>
        </form>

        <a href="register" class="btn btn-outline-secondary w-100 btn-signup">회원가입</a>
    </div>
</div>
<!-- Bootstrap JS (Optional for interactivity) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
