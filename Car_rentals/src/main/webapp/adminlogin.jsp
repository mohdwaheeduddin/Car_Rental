<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #2c3e50, #3498db);
            color: white;
        }
        .login-box {
            background: rgba(0,0,0,0.6);
            padding: 30px;
            border-radius: 12px;
            width: 350px;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2 class="text-center">Admin Login</h2>
        <form action="admincontroller" method="post">
            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>
</body>
</html>
