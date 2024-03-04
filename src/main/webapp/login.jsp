<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-center">Login</h5>
                            <h3 style="color: red">${requestScope.error}</h3>
                            <form action="login" method="post">
                                <div class="mb-3">
                                    <label for="username" class="form-label">User Name:</label>
                                    <input type="username" class="form-control" id="username" name ="username" value="${useranme}">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name ="password" value="${password}">
                                </div>



                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Login</button>
                            </form >
                            <div class="mt-3">
                                <a href="Forgetpassword.jsp" class="text-decoration-none">Forgot Password?</a>
                            </div>
                            <div class="mt-3 text-center">
                                <span>Don't have an account? </span>
                                <a href="signUp.jsp" class="text-decoration-none">Sign Up</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS (optional) -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <script>
            // Khi tài li?u ???c t?i xong, th?c hi?n các hàm bên trong
            document.addEventListener('DOMContentLoaded', (event) => {
                const loginForm = document.querySelector('form[action="login"]');
                const usernameInput = document.getElementById('username');
                const passwordInput = document.getElementById('password');
                const loginButton = document.querySelector('button[type="submit"]');

                // Hàm ki?m tra form h?p l?
                function validateForm() {
                    let isValid = true;
                    // Ki?m tra username
                    if (usernameInput.value.trim() === '') {
                        isValid = false;
                        usernameInput.classList.add('is-invalid');
                    } else {
                        usernameInput.classList.remove('is-invalid');
                    }

                    // Ki?m tra password
                    if (passwordInput.value.trim() === '') {
                        isValid = false;
                        passwordInput.classList.add('is-invalid');
                    } else {
                        passwordInput.classList.remove('is-invalid');
                    }

                    return isValid;
                }

                // S? ki?n khi form ???c submit
                loginForm.addEventListener('submit', function (event) {
                    // Ki?m tra form
                    if (!validateForm()) {
                        // N?u không h?p l?, ng?n không cho form ???c submit
                        event.preventDefault();
                    }
                });

                // S? ki?n khi nh?n nút Login
                loginButton.addEventListener('click', function (event) {
                    // Ki?m tra form
                    if (!validateForm()) {
                        // N?u không h?p l?, ng?n không cho th?c hi?n s? ki?n click
                        event.preventDefault();
                    }
                });
            });
        </script>

    </body>
</html>
