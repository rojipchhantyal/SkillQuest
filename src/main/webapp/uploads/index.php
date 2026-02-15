<?php
require_once 'config.php';

// Fetch all posts with like count
$posts_query = "
    SELECT p.*, 
           (SELECT COUNT(*) FROM likes WHERE post_id = p.id) AS like_count
    FROM posts p
    ORDER BY p.created_at DESC
";
$posts_result = mysqli_query($conn, $posts_query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cotton Cloud</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
        body { 
            background: #f9fafb; 
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
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
        
        .container { 
            max-width: 700px; 
            margin: 30px auto; 
            padding: 0 20px; 
            flex: 1; 
        }
        .post-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            overflow: hidden;
        }
        .post-header {
            display: flex;
            align-items: center;
            padding: 15px;
            gap: 12px;
        }
        .post-avatar { width: 45px; height: 45px; border-radius: 50%; object-fit: cover; }
        .post-meta { flex: 1; }
        .post-meta h4 { font-size: 16px; margin-bottom: 4px; }
        .post-meta small { color: #666; font-size: 12px; }
        .post-image img { width: 100%; max-height: 450px; object-fit: cover; }
        .post-body { padding: 15px; }
        .post-title { font-size: 18px; font-weight: bold; margin-bottom: 8px; }
        .post-desc { color: #444; font-size: 14px; line-height: 1.5; }
        .post-actions {
            padding: 10px 15px;
            border-top: 1px solid #eee;
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .like-btn {
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            color: #666;
        }
        .like-btn.liked { color: #e11d48; }
        .like-btn:disabled { opacity: 0.5; cursor: not-allowed; }
        .comments-section {
            padding: 15px;
            background: #fafafa;
            border-top: 1px solid #eee;
        }
        .comment-form {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .comment-form input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
        }
        .comment-form button {
            background: #2563eb;
            color: white;
            border: none;
            padding: 0 18px;
            border-radius: 20px;
            cursor: pointer;
        }
        .comment-item {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
            font-size: 14px;
        }
        .comment-author { 
            font-weight: bold; 
            color: #1e3a8a; 
        }
        .comment-text { 
            color: #333; 
        }
        .comment-time { 
            color: #999; font-size: 11px; 
        }

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
        <!-- Right: Login + Register -->
        <div class="nav-right">
            <a href="login.php" class="btn btn-login">Login</a>
            <a href="register.php" class="btn btn-register">Register</a>
        </div>
    <?php endif; ?>
</nav>

<div class="container">
    <?php if (mysqli_num_rows($posts_result) == 0): ?>
        <!-- No posts: show call to action -->
        <div style="text-align: center; padding: 60px 20px; background: white; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
            <div style="font-size: 48px; margin-bottom: 20px;">☁️</div>
            <h2 style="color: #1e3a8a; margin-bottom: 15px;">No posts yet... be the first!</h2>
            <p style="color: #666; margin-bottom: 25px; font-size: 16px;">Share your vision with the Cotton Cloud community.</p>
            <?php if (isset($_SESSION['user_id'])): ?>
                <a href="dashboard.php" style="background: #2563eb; color: white; padding: 12px 28px; border-radius: 30px; text-decoration: none; font-weight: bold;">Go to Dashboard & Upload</a>
            <?php else: ?>
                <a href="register.php" style="background: #2563eb; color: white; padding: 12px 28px; border-radius: 30px; text-decoration: none; font-weight: bold;">Join now & start posting</a>
            <?php endif; ?>
        </div>
    <?php else: ?>
        <!-- Display posts -->
        <?php while ($post = mysqli_fetch_assoc($posts_result)): 
            // Check if current user liked this post
            $user_liked = false;
            if (isset($_SESSION['user_id'])) {
                $user_id = $_SESSION['user_id'];
                $check_like = mysqli_query($conn, "SELECT id FROM likes WHERE post_id = {$post['id']} AND user_id = $user_id");
                $user_liked = mysqli_num_rows($check_like) > 0;
            }

            // Fetch comments for this post
            $comments_query = mysqli_query($conn, "SELECT * FROM comments WHERE post_id = {$post['id']} ORDER BY created_at DESC");
        ?>
            <div class="post-card" data-post-id="<?= $post['id'] ?>">
                <!-- Post Header -->
                <div class="post-header">
                    <img src="uploads/<?= htmlspecialchars($post['poster_avatar'] ?: 'default.png') ?>" alt="" class="post-avatar">
                    <div class="post-meta">
                        <h4><?= htmlspecialchars($post['poster_name']) ?></h4>
                        <small><?= date('F j, Y', strtotime($post['created_at'])) ?></small>
                    </div>
                </div>

                <!-- Post Image -->
                <?php if (!empty($post['file'])): ?>
                <div class="post-image">
                    <img src="uploads/<?= htmlspecialchars($post['file']) ?>" alt="">
                </div>
                <?php endif; ?>

                <!-- Post Body -->
                <div class="post-body">
                    <div class="post-title"><?= htmlspecialchars($post['title']) ?></div>
                    <div class="post-desc"><?= nl2br(htmlspecialchars($post['description'] ?? '')) ?></div>
                </div>

                <!-- Like & Comment Actions -->
                <div class="post-actions">
                    <button class="like-btn <?= $user_liked ? 'liked' : '' ?>" 
                            data-post-id="<?= $post['id'] ?>" 
                            <?= !isset($_SESSION['user_id']) ? 'disabled title="Login to like"' : '' ?>>
                        <span class="like-icon"><?= $user_liked ? '❤️' : '🤍' ?></span>
                        <span class="like-count"><?= $post['like_count'] ?></span>
                    </button>
                    <span>💬 Comments</span>
                </div>

                <!-- Comments Section -->
                <div class="comments-section">
                    <?php if (isset($_SESSION['user_id'])): ?>
                    <form class="comment-form" data-post-id="<?= $post['id'] ?>">
                        <input type="text" name="comment" placeholder="Write a comment..." required>
                        <button type="submit">Post</button>
                    </form>
                    <?php else: ?>
                    <p style="font-size:13px; color:#666;">Please <a href="login.php">login</a> to comment.</p>
                    <?php endif; ?>

                    <div class="comments-list" id="comments-<?= $post['id'] ?>">
                        <?php while ($comment = mysqli_fetch_assoc($comments_query)): ?>
                        <div class="comment-item">
                            <span class="comment-author"><?= htmlspecialchars($comment['user_name']) ?></span>
                            <span class="comment-text"><?= htmlspecialchars($comment['comment_text']) ?></span>
                            <span class="comment-time"><?= date('M j', strtotime($comment['created_at'])) ?></span>
                        </div>
                        <?php endwhile; ?>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
    <?php endif; ?>
</div>

<footer class="footer">
    ☁️ cotton-cloud bca 4th sem project
</footer>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Like button AJAX
    document.querySelectorAll('.like-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            if (this.disabled) return;
            
            const postId = this.dataset.postId;
            const icon = this.querySelector('.like-icon');
            const countSpan = this.querySelector('.like-count');
            
            fetch('like_ajax.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'post_id=' + postId
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    countSpan.textContent = data.like_count;
                    if (data.liked) {
                        this.classList.add('liked');
                        icon.textContent = '❤️';
                    } else {
                        this.classList.remove('liked');
                        icon.textContent = '🤍';
                    }
                }
            });
        });
    });

    // Comment form AJAX
    document.querySelectorAll('.comment-form').forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            const postId = this.dataset.postId;
            const input = this.querySelector('input[name="comment"]');
            const commentText = input.value.trim();
            if (!commentText) return;

            fetch('comment_ajax.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'post_id=' + postId + '&comment=' + encodeURIComponent(commentText)
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    const commentsList = document.getElementById('comments-' + postId);
                    const newComment = document.createElement('div');
                    newComment.className = 'comment-item';
                    newComment.innerHTML = `
                        <span class="comment-author">${data.user_name}</span>
                        <span class="comment-text">${data.comment_text}</span>
                        <span class="comment-time">just now</span>
                    `;
                    commentsList.prepend(newComment);
                    input.value = '';
                }
            });
        });
    });
});
</script>

</body>
</html>