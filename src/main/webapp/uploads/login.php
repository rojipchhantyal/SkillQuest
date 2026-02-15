<?php require_once 'config.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Cotton Cloud</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:Arial,sans-serif; }
        body { 
            background: linear-gradient(135deg, #eff6ff, #fff); 
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        /* Navbar (same as index) */
        .navbar {
            background: white;
            border-bottom: 1px solid #ddd;
            padding: 12px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav-left, .nav-center, .nav-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .nav-center {
            font-size: 24px;
            font-weight: bold;
            color: #1e3a8a;
        }
        .avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            object-fit: cover;
        }
        .user-name {
            font-weight: 500;
            color: #333;
        }
        .btn {
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn-login { background: #2563eb; color: white; }
        .btn-register { background: #e2e8f0; color: #333; }
        .btn-dashboard { background: #e2e8f0; color: #333; }
        .btn-logout { background: #ef4444; color: white; }

        /* Login card */
        .login-card {
            width: 360px;
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            margin: 40px auto;
            flex: 1;
        }
        h1 { text-align:center; color:#1e3a8a; margin-bottom:20px; }
        .form-group { margin-bottom:15px; display:flex; flex-direction:column; gap:5px; }
        label { font-size:14px; color:#374151; }
        input { 
            padding:10px; 
            border:1px solid #d1d5db; 
            border-radius:8px; 
            outline:none; 
            width: 100%;
        }
        input:focus { 
            border-color:#2563eb; 
            box-shadow:0 0 0 2px rgba(37,99,235,0.15); 
        }
        button { 
            width:100%; 
            padding:12px; 
            background:#2563eb; 
            color:white; 
            border:none; 
            border-radius:10px; 
            font-weight:bold; 
            cursor:pointer; 
        }
        button:hover { background:#1e40af; }
        .error { color:#dc2626; font-size:13px; margin-top:5px; text-align:center; }
        .success { color:#16a34a; font-size:13px; margin-top:5px; text-align:center; }
        .register-link { text-align:center; margin-top:15px; font-size:14px; }

        /* Footer */
        .footer {
            background: #1e3a8a;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<nav class="navbar">
    <?php if (isset($_SESSION['user_id'])): ?>
        <!-- Left: Avatar + Name -->
        <div class="nav-left">
            <img src="uploads/<?= htmlspecialchars($_SESSION['user_avatar'] ?? 'default.png') ?>" alt="avatar" class="avatar">
            <span class="user-name"><?= htmlspecialchars($_SESSION['user_name']) ?></span>
        </div>
        <!-- Center: Logo -->
        <div class="nav-center">☁️ Cotton Cloud</div>
        <!-- Right: Dashboard + Logout -->
        <div class="nav-right">
            <a href="dashboard.php" class="btn btn-dashboard">Dashboard</a>
            <a href="logout.php" class="btn btn-logout">Logout</a>
        </div>
    <?php else: ?>
        <!-- Left: Logo -->
        <div class="nav-left" style="font-size:24px; font-weight:bold; color:#1e3a8a;">☁️ Cotton Cloud</div>
        <!-- Center: empty -->
        <div class="nav-center"></div>
        <!-- Right: Login (current) + Register -->
        <div class="nav-right">
            <a href="login.php" class="btn btn-login" style="background:#2563eb; color:white;">Login</a>
            <a href="register.php" class="btn btn-register">Register</a>
        </div>
    <?php endif; ?>
</nav>

<div class="login-card">
    <h1>Login</h1>
    <?php if (isset($_GET['registered'])): ?>
        <div class="success">Registration successful! Please login.</div>
    <?php endif; ?>
    <?php if (isset($_GET['error'])): ?>
        <div class="error">Invalid credentials. Try again.</div>
    <?php endif; ?>
    <form action="login_process.php" method="post">
        <div class="form-group">
            <label>Username or Email</label>
            <input type="text" name="username" required>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>
        <button type="submit">Login</button>
        <div class="register-link">
            Don't have an account? <a href="register.php">Register here</a>
        </div>
    </form>
</div>

<footer class="footer">
    ☁️ cotton-cloud bca 4th sem project
</footer>

</body>
</html>