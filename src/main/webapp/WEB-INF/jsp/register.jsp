<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .register-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .error {
            color: red;
            font-size: 0.9em;
        }

        .check-status {
            font-size: 1.1em;
            padding-left: 10px !important;
        }

        .check-status.valid {
            color: green;
        }

        .check-status.invalid {
            color: red;
        }

        .btn-login {
            margin-top: 10px;
        }

        .help-text {
            font-size: 0.9em;
            color: #6c757d;
        }
    </style>
</head>
<body>
<%@ include file="common/navigation.jspf"%>
<div class="container">
    <div class="register-container">
        <h2 class="text-center mb-4">회원가입</h2>

        <form:form method="post" modelAttribute="user" action="/register">
            <!-- 아이디 -->
            <div class="mb-3">
                <label for="userId" class="form-label">아이디</label>
                <div class="input-group">
                    <form:input path="userId" id="userId" cssClass="form-control" />
                    <button class="btn btn-outline-secondary" type="button" onclick="checkUserId()">중복확인</button>
                    <span id="userIdStatus" class="check-status"></span>
                </div>
                <form:errors path="userId" cssClass="error" />
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <form:password path="password" cssClass="form-control" />
                <form:errors path="password" cssClass="error" />
                <small class="help-text">비밀번호는 최소 4글자 이상이어야 합니다.</small>
            </div>

            <!-- 이메일 -->
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <div class="input-group">
                    <form:input path="email" id="email" cssClass="form-control" />
                    <button class="btn btn-outline-secondary" type="button" onclick="checkEmail()">중복확인</button>
                    <span id="emailStatus" class="check-status"></span>
                </div>
                <form:errors path="email" cssClass="error" />
                <small class="help-text">이메일 형식에 맞춰 입력해주세요.</small>
            </div>

            <button type="submit" class="btn btn-primary w-100" id="submitBtn" disabled>가입하기</button>
        </form:form>

        <a href="/login" class="btn btn-outline-secondary w-100 btn-login">로그인으로 돌아가기</a>
    </div>
</div>

<%@ include file="common/footer.jspf"%>
<script>
    let isUserIdAvailable = false;
    let isEmailAvailable = false;
    let isPasswordValid = false;

    document.getElementById('userId').addEventListener('input', function() {
        isUserIdAvailable = false;
        updateSubmitButtonState();
    });

    document.getElementById('email').addEventListener('input', function() {
        isEmailAvailable = false;
        updateSubmitButtonState();
    })

    function checkUserId() {
        const userId = document.getElementById('userId').value;
        if (userId.length < 2) {
            alert("아이디는 최소 2글자 이상이어야 합니다.");
            return;
        }
        fetch('/checkUserId?userId=' + encodeURIComponent(userId))
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                    return response.json();
                })
            .then(data => {
                const status = document.getElementById('userIdStatus');
                if (data) {
                    status.textContent = '✔';
                    status.className = 'check-status valid';
                    isUserIdAvailable = true;
                } else {
                    status.textContent = '❌';
                    status.className = 'check-status invalid';
                    isUserIdAvailable = false;
                }
                updateSubmitButtonState();
            })
            .catch(error => {
                console.error('Fetch error:', error);
            });
    }

    function checkEmail() {
        const email = document.getElementById('email').value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
           if (!emailRegex.test(email)) {
               alert("이메일 형식이 잘못되었습니다.");
               return;
           }
           isEmailAvailable = true;
        fetch('/checkEmail?email=' + encodeURIComponent(email))
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                    return response.json();
                })
            .then(data => {
                const status = document.getElementById('emailStatus');
                console.log(data);
                if (data) {
                    status.textContent = '✔';
                    status.className = 'check-status valid';
                    isUserIdAvailable = true;
                } else {
                    status.textContent = '❌';
                    status.className = 'check-status invalid';
                    isUserIdAvailable = false;
                }
                updateSubmitButtonState();
            })
            .catch(error => {
                console.error('Fetch error:', error);
            });
    }

    function updateSubmitButtonState() {
        const btn = document.getElementById('submitBtn');
        btn.disabled = !(isUserIdAvailable && isEmailAvailable && isPasswordValid);
    }

    document.getElementById('password').addEventListener('input', function() {
        const password = this.value;
        if (password.length >= 4) {
            isPasswordValid = true;
        } else {
            isPasswordValid = false;
        }
        updateSubmitButtonState();
    });
</script>
</body>
</html>
