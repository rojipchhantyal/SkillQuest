<?php
require_once 'config.php';

$username = $_POST['username'];
$password = $_POST['password']; // plain text

// Try to find user by name or email
$query = "SELECT * FROM users WHERE (name = '$username' OR email = '$username') AND password = '$password'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) === 1) {
    $user = mysqli_fetch_assoc($result);
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['user_name'] = $user['name'];
    $_SESSION['user_email'] = $user['email'];
    $_SESSION['user_avatar'] = $user['avatar'];
    header('Location: dashboard.php');
} else {
    header('Location: login.php?error=1');
}