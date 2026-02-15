<?php
require_once 'config.php';
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$post_id = (int)$_GET['id'];
$user_id = $_SESSION['user_id'];

// Ensure the post belongs to the user
$post = mysqli_query($conn, "SELECT * FROM posts WHERE id = $post_id AND user_id = $user_id");
if (mysqli_num_rows($post) == 0) {
    die('Post not found or you do not have permission.');
}
$row = mysqli_fetch_assoc($post);

// Handle update
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = mysqli_real_escape_string($conn, $_POST['title']);
    $desc = mysqli_real_escape_string($conn, $_POST['description']);

    // Check if a new image is uploaded
    if (!empty($_FILES['image']['name']) && $_FILES['image']['error'] === 0) {
        $ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $file_name = time() . '_' . uniqid() . '.' . $ext;
        $target = 'uploads/' . $file_name;

        if (move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
            // Delete old image (optional)
            $old_file = $row['file'];
            if ($old_file && file_exists('uploads/' . $old_file) && $old_file != 'default.png') {
                unlink('uploads/' . $old_file);
            }
            // Update with new image
            mysqli_query($conn, "UPDATE posts SET title = '$title', description = '$desc', file = '$file_name' WHERE id = $post_id");
        } else {
            echo 'Image upload failed.';
            exit;
        }
    } else {
        // No new image, update only text
        mysqli_query($conn, "UPDATE posts SET title = '$title', description = '$desc' WHERE id = $post_id");
    }
    header('Location: dashboard.php?updated=1');
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:Arial,sans-serif; }
        body { background:#eff6ff; display:flex; justify-content:center; align-items:center; height:100vh; }
        .edit-card { width:500px; background:white; padding:30px; border-radius:14px; box-shadow:0 10px 25px rgba(0,0,0,0.08); }
        h2 { text-align:center; color:#1e3a8a; margin-bottom:20px; }
        .form-group { margin-bottom:15px; display:flex; flex-direction:column; gap:5px; }
        label { font-size:14px; color:#374151; }
        input, textarea { padding:10px; border:1px solid #d1d5db; border-radius:8px; outline:none; }
        textarea { min-height:80px; resize:vertical; }
        .current-image { margin-bottom:15px; }
        .current-image img { max-width:100%; max-height:150px; border-radius:8px; border:1px solid #ddd; }
        button { width:100%; padding:12px; background:#2563eb; color:white; border:none; border-radius:10px; font-weight:bold; cursor:pointer; }
        button:hover { background:#1e40af; }
        .back-link { display:block; text-align:center; margin-top:15px; font-size:14px; }
    </style>
</head>
<body>
    <div class="edit-card">
        <h2>Edit Post</h2>
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Title</label>
                <input type="text" name="title" value="<?= htmlspecialchars($row['title']) ?>" required>
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea name="description"><?= htmlspecialchars($row['description']) ?></textarea>
            </div>

            <!-- Current image preview -->
            <?php if (!empty($row['file'])): ?>
            <div class="current-image">
                <label>Current Image</label><br>
                <img src="uploads/<?= htmlspecialchars($row['file']) ?>" alt="Current image">
            </div>
            <?php endif; ?>

            <div class="form-group">
                <label>Change Image (optional)</label>
                <input type="file" name="image" accept="image/*">
            </div>

            <button type="submit">Update Post</button>
            <a href="dashboard.php" class="back-link">← Back to Dashboard</a>
        </form>
    </div>
</body>
</html>