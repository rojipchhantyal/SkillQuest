<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillQuest</title>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
</head>
<body>
    <main>
        <div class="skillquest-logo">
            <span class="logo-circle">SQ</span>
            <span class="logo">SkillQuest</span>
        </div>
        <form action="<%= application.getContextPath() %>/login" method="post">
            <div class="form-tittle">
                <h1>Welcome Back</h1>
                <span>Login to your account</span>
            </div>
            <div class="form-fields">
                <label for="choose">I am a</label>
                <select name="choose" id="choose">
                    <option value="student" selected>Student</option>
                    <option value="business">Business</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <div class="form-fields">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Enter your email">
            </div>
            <div class="form-fields">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter your password">
            </div>
            <a class="form-forgot" href="">Forgot password?</a>
            <button>Login</button>
            <div class="form-sign-up">
                <span>Don't have an account? </span>
                <a href="">Sign up</a>
            </div>
        </form>
    </main>
</body>
</html>
<style>
    *{
        padding: 0;
        margin: 0;
        font-family: ui-sans-serif, system-ui, sans-serif;
    }
    :root{
        --white: #FFF;
        --background: oklch(0.145 0 0);
        --lightter-background: #181818;
        --dark-gray: oklch(0.446 0.03 256.802);
        --green-bgc: #00C853;
        --dark-green: #009624;
        --light-green: oklch(0.726563 -0.177442 0.109428/0.1);
        --gray: oklch(0.707 0.022 261.325);
    }
    main{
        background-color: var(--background);
        height: 116vh;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 16px;
    }
    .skillquest-logo{
        height: 9%;
        width: 28%;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        font-size: 20px;
    }
    .logo-circle{
        font-size: 18px;
        background-color: var(--green-bgc);
        padding: 7px 8px;
        border-radius: 12px;
    }
    .logo{
        color: var(--white);
        font-size: 22px;
    }
    form{
        height: 90vh;
        width: 35.4%;
        border-radius: 16px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 14px;
        background-color: var(--lightter-background);
    }
    .form-tittle{
        text-align: center;
        line-height: 1.5;
        margin-bottom: 12px;
    }
    .form-tittle h1{
        font-size: 30px;
        font-weight: 489;
        color: var(--white);
    }
    .form-tittle span{
        color: var(--gray);
    }
    .form-fields{
        height: 10vh;
        width: 83%;
        display: flex;
        flex-direction: column;
        gap: 6px;
    }
    .form-fields label{
        color: var(--white);
        font-size: 14px;
    }
    .form-fields input,
    .form-fields select{
        height: 36px;
        border-radius: 12px;
        border: none;
        padding: 0 8px;
        outline: none;
        background-color: var(--background);
        border: 0.2px solid var(--dark-gray);
        color: var(--white);
        font-size: 14px;
    }
    input:focus,
    select:focus {
        outline: 3px groove var(--green-bgc);
    }
    /* option{
        background-color: red;
        padding: 10px;
    }
    option:hover{
        background-color: var(--green-bgc);
    } */
    .form-forgot{
        height: 7vh;
        width: 83%;
        display: flex;
        align-items: center;
        justify-content: end;
        text-decoration: none;
        font-size: 14px;
        color: var(--green-bgc);
    }
    .form-forgot:hover{
        text-decoration: underline;
    }
    form button{
        height: 46px;
        width: 83%;
        border-radius: 12px;
        background-color: var(--green-bgc);
        border: none;
        font-weight: 500;
        font-size: 14px;
        transition: all ease-in-out 0.3s;
    }
    form button:hover{
        background-color: var(--dark-green);
    }
    .form-sign-up{
        height: 7vh;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 4px;
    }
    .form-sign-up span{
        font-size: 14px;
        color: var(--gray);
    }
    .form-sign-up a{
        font-size: 14px;
        color: var(--green-bgc);
        text-decoration: none;
    }
    .form-sign-up a:hover{
        text-decoration: underline;
    }
</style>