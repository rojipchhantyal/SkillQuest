<?php
session_start();

$host = 'localhost';
$user = 'root';
$pass = '';
$db   = 'cotton_cloud';
$port = '3307';

$conn = mysqli_connect($host, $user, $pass, $db, $port);

if (!$conn) {
    die('Database connection failed: ' . mysqli_connect_error());
}

// Set charset to UTF-8
mysqli_set_charset($conn, 'utf8');
?>