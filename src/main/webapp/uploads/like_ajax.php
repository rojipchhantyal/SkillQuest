<?php
require_once 'config.php';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'error' => 'Not logged in']);
    exit;
}

$post_id = (int)$_POST['post_id'];
$user_id = $_SESSION['user_id'];

// Check if already liked
$check = mysqli_query($conn, "SELECT id FROM likes WHERE post_id = $post_id AND user_id = $user_id");
$liked = mysqli_num_rows($check) > 0;

if ($liked) {
    // Unlike
    mysqli_query($conn, "DELETE FROM likes WHERE post_id = $post_id AND user_id = $user_id");
    $new_liked = false;
} else {
    // Like
    mysqli_query($conn, "INSERT INTO likes (post_id, user_id) VALUES ($post_id, $user_id)");
    $new_liked = true;
}

// Get updated like count
$count_result = mysqli_query($conn, "SELECT COUNT(*) AS cnt FROM likes WHERE post_id = $post_id");
$count_row = mysqli_fetch_assoc($count_result);
$like_count = $count_row['cnt'];

echo json_encode([
    'success' => true,
    'liked' => $new_liked,
    'like_count' => $like_count
]);