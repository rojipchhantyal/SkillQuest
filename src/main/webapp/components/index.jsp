<%@ page import="com.skillquest.DTOs.TasksDTOs" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillQuest</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/honePage.css">
    <link
        href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css"
        rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans+Code:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
</head>
<body>
    <main>
        <%
            String message = (String) request.getAttribute("message");
            String error = (String) request.getAttribute("error");

            if (message != null && !message.isEmpty()) {
            %>
                <p style="position: fixed; top: 12px; left: 50%; transform: translateX(-50%); translate z-index: 9999999999; color:green">
                    <%= message %>
                </p>
            <%
                } else if (error != null && !error.isEmpty()) {
            %>
                <p style="position: fixed; top: 12px; left: 50%; transform: translateX(-50%); z-index: 9999999999; color:red">
                    <%= error %>
                </p>
            <%
            }
        %>
        <nav>
            <div class="nav-logo">
                <span class="logo-circle">SQ</span>
                <span class="logo">SkillQuest</span>
            </div>
            <ul class="nav-navigation">
                <li>
                    <a href="<%= application.getContextPath() %>/components/login.jsp">
                        <span>Post Tasks</span>
                    </a>
                </li>
                <li>
                    <a href="<%= application.getContextPath() %>/components/login.jsp">
                        <span>Login</span>
                    </a>
                </li>
                <li>
                    <a href="<%= application.getContextPath() %>/components/getStarted.jsp">
                        <span>Get Started</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="home-first-page">
            <h1>Find Your Next Quest</h1>
            <p>Discover opportunities, showcase your skills, and earn while you learn. Join thousands of <br>students and businesses.</p>
            <div class="home-first-page-last">
                <a href="<%= application.getContextPath() %>/components/getStarted.jsp">Get Started</a>
                <a href="<%= application.getContextPath() %>/components/login.jsp">Login</a>
            </div>
        </div>
        <div class="home-available-task-page">
            <form class="home-available-task-page-search" action="<%= application.getContextPath() %>/searchTasks" method="get">
                <div class="home-available-task-page-search-inners">
                    <i class="ri-search-line"></i>
                    <input type="text" name="tittle" id="" placeholder="Search tasks..">
                </div>
                <div class="home-available-task-page-search-inners">
                    <i class="ri-map-pin-line"></i>
                    <input type="text" name="location" id="" placeholder="Location..">
                </div>
                <div class="home-available-task-page-search-inners">
                    <i class="ri-recycle-line"></i>
                    <select name="type" id="">
                        <option value="all type" selected>All Types</option>
                        <option value="Design">Design</option>
                        <option value="Writing">Writing</option>
                        <option value="Video Editing">Video Editing</option>
                        <option value="Development">Development</option>
                    </select>
                </div>
                <button style="border: none;" type="submit">
                    <i id="last-search-icon" class="ri-search-line"></i>
                </button>
            </form>
            <div class="home-available-task-page-tasks">
                <div class="home-available-task-page-tasks-tittle">
                    <h2>Available Tasks</h2>
                    <span>
                    <%
                     Integer totalTaskCounter = (Integer)request.getAttribute("taskCounter");
                     if( totalTaskCounter != null){
                        out.print(totalTaskCounter);
                     }
                     else{
                        out.print(0);
                     }
                     %>
                      tasks found</span>
                </div>
                <div class="home-available-task-page-tasks-list">
                    <!-- lists of the tasks -->
                    <%
                        List<TasksDTOs>  allTasks = (List<TasksDTOs>) request.getAttribute("allTasks");

                        if(allTasks != null){
                            for(TasksDTOs tasks : allTasks){
                               %>
                               <div class="home-available-task-page-tasks-list-inners">
                                   <h3><%= tasks.getTitle() %> .</h3>
                                   <p><%= tasks.getDescription() %> .</p>
                                   <ul>
                                       <li>
                                           <i class="ri-file-list-line"></i>
                                           <span><%= tasks.getBusinessName() %></span>
                                       </li>
                                       <li>
                                           <i class="ri-map-pin-line"></i>
                                           <span><%= tasks.getLocation() %></span>
                                       </li>
                                       <li>
                                           <i class="ri-cash-line"></i>
                                           <span><%= tasks.getBudget() %></span>
                                       </li>
                                       <li>
                                           <i class="ri-calendar-event-line"></i>
                                           <span>Deadline: <%= tasks.getDeadline() %></span>
                                       </li>
                                   </ul>
                                   <div class="home-available-task-page-tasks-list-inners-button">
                                       <span><%= tasks.getTask_type() %></span>
                                       <button><a style="text-decoration: none; color: oklch(0.145 0 0);" href="<%= application.getContextPath() %>/components/login.jsp">Claim Task</a></button>
                                   </div>
                               </div>
                            <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="home-register-page">
            <div class="home-register-page-inner">
                <h2>Ready to Start Your Quest?</h2>
                <p>Join SkillQuest today and connect with opportunities that match your skills. Students earn, <br>businesses grow.</p>
                <a href="<%= application.getContextPath() %>/components/getStarted.jsp">
                    <button>Register Now</button>
                </a>
            </div>
        </div>
    </main>
    <footer>
        <p> SkillQuest. </p>
    </footer>
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
    nav{
        height: 11vh;
        width: 100%;
        background-color: var(--background);
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .nav-logo{
        height: 100%;
        width: 28%;
        display: flex;
        align-items: center;
        gap: 6px;
        font-size: 20px;
    }
    .logo-circle{
        font-size: 16px;
        background-color: var(--green-bgc);
        padding: 6px 6px;
        border-radius: 12px;
    }
    .logo{
        color: var(--white);
    }
    .nav-navigation{
        height: 100%;
        width: 68%;
        display: flex;
        align-items: center;
        justify-content: end;
        gap: 22px;
    }
    .nav-navigation li a{
        text-decoration: none;
        color: var(--white);
        transition: all ease-in-out 0.3s;
    }
    .nav-navigation li{
        list-style: none;
    }
    .nav-navigation li:last-child a{
        background-color: var(--green-bgc);
        font-size: 14px;
        font-weight: 600;
        padding: 8px 18px;
        border-radius: 16px;
        color: var(--background);
    }
    .nav-navigation li a:hover{
        color: var(--green-bgc);
    }
    .nav-navigation li:last-child a:hover{
        background-color: var(--dark-green);
        color: var(--background);
    }

    /* for home first page */
    .home-first-page{
        height: 72vh;
        width: 100%;
        background-color: var(--background);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        gap: 20px;
        line-height: 1.6;
    }
    .home-first-page h1{
        color: var(--white);
        font-size: 48px;
        font-weight: 700;
        color: var(--green-bgc);
        margin-bottom: -6px;
    }
    .home-first-page p{
        font-size: 16px;
        font-weight: 400;
        color: var(--gray);
        margin-bottom: 6px;
    }
    .home-first-page-last{
        font-size: 18px;
        height: 11vh;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 24px;
    }
    .home-first-page-last a{
        text-decoration: none;
        padding: 12px 32px;
        border-radius: 12px;
        font-weight: 600;
        box-sizing: border-box;
    }
    .home-first-page-last a:first-child{
        background-color: var(--green-bgc);
        color: var(--background);
        transition: all ease-in-out 0.3s;
    }
    .home-first-page-last a:last-child{
        background-color: var(--background);
        color: var(--green-bgc);
        border: 2px solid var(--green-bgc);
        transition: all ease-in-out 0.3s;
    }
    .home-first-page-last a:first-child:hover{
        background-color: var(--dark-green);
    }
    .home-first-page-last a:last-child:hover{
        background-color: var(--green-bgc);
        color: var(--white);
    }
    /* for and available task */
    .home-available-task-page{
        min-height: 40vh;
        background-color: var(--background);
        padding: 32px 24px;
        display: flex;
        flex-direction: column;
        gap: 24px;
    }
    .home-available-task-page-search{
        height: 15vh;
        width: 100%;
        background-color: var(--lightter-background);
        border-radius: 12px;
        box-sizing: border-box;
        padding: 24px 32px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    #last-search-icon{
        font-size: 24px;
        font-weight: 800;
        color: var(--gray);
        background-color: var(--background);
        padding: 8px;
        border-radius: 8px;
        transition: all ease-in-out 0.3s;
    }
    #last-search-icon:hover{
        color: var(--dark-green);
        background-color: var(--gray);
    }
    .home-available-task-page-search-inners{
        background-color: var(--background);
        height: 100%;
        width: 32%;
        border-radius: 8px;
        display: flex;
        align-items: center;
        box-sizing: border-box;
        padding: 8px;
        gap: 8px;
    }
    .home-available-task-page-search-inners i{
        font-size: 20px;
        font-weight: 500;
        color: var(--gray);
    }
    .home-available-task-page-search-inners input,
    .home-available-task-page-search-inners select{
        border: none;
        outline: none;
        height: 100%;
        width: 90%;
        background-color: var(--background);
        color: var(--gray);
        font-size: 16px;
    }
    .home-available-task-page-tasks{
        display: flex;
        flex-direction: column;
        gap: 24px;
        background-color: var(--background);
    }
    .home-available-task-page-tasks-tittle{
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .home-available-task-page-tasks-tittle h2{
        font-size: 32px;
        font-weight: 600;
        color: var(--white);
    }
    .home-available-task-page-tasks-tittle span{
        color: var(--gray);
        font-size: 16px;
        font-weight: 500;
    }
    .home-available-task-page-tasks-list{
        min-height: 20vh;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        gap: 24px;
    }
    .home-available-task-page-tasks-list-inners{
        height: 354px;
        width: 386.7px;
        background-color: var(--lightter-background);
        border-radius: 12px;
        box-sizing: border-box;
        padding: 24px;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .home-available-task-page-tasks-list-inners h3{
        font-size: 24px;
        font-weight: 600;
        color: var(--dark-green);
        line-height: 1.5;
        margin-bottom: 6px;
    }
    .home-available-task-page-tasks-list-inners p{
        line-height: 1.6;
        font-size: 16px;
        font-weight: 450;
        color: var(--gray);
        margin-bottom: 8px;
    }
    .home-available-task-page-tasks-list-inners ul{
        line-height: 1.6;
    }
    .home-available-task-page-tasks-list-inners ul li{
        list-style: none;
        font-size: 14px;
        color: var(--gray);
        line-height: 1.6;
        font-weight: 400;
        display: flex;
        gap: 6px;
    }
    .home-available-task-page-tasks-list-inners ul li i{
        font-size: 16px;
    }
    .home-available-task-page-tasks-list-inners-button{
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 16px;
    }
    .home-available-task-page-tasks-list-inners-button span{
        background-color: var(--green-bgc);
        font-size: 12px;
        color: var(--background);
        padding: 2px 12px;
        border-radius: 12px;
    }
    .home-available-task-page-tasks-list-inners-button button{
        font-size: 16px;
        font-weight: 600;
        padding: 6px 16px;
        background-color: var(--green-bgc);
        color: var(--background);
        border-radius: 12px;
        border: none;
        transition: all ease-in-out 0.3s;
    }
    .home-available-task-page-tasks-list-inners-button button:hover{
        background-color: var(--dark-green);
    }
    /* for the home second page */
    .home-register-page{
        height: 64vh;
        padding: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: var(--background);
        line-height: 1.6;
        text-align: center;
    }
    .home-register-page-inner{
        width: 100%;
        height: 74%;
        border-radius: 12px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 20px;
        background-color: var(--lightter-background);
    }
    .home-register-page h2{
        font-size: 32px;
        color: var(--white);
        font-weight: 600;
        margin-bottom: -8px;
    }
    .home-register-page p{
        font-size: 16px;
        font-weight: 450;
        color: var(--gray);
        margin-bottom: 4px;
    }
    .home-register-page button{
        color: var(--background);
        font-size: 16px;
        font-weight: 600;
        padding: 12px 32px;
        border-radius: 12px;
        background-color: var(--green-bgc);
        border: none;
        transition: all ease-in-out 0.3s;
    }
    .home-register-page button:hover{
        background-color: var(--dark-green);
    }

    /* for footer section */
    footer{
        height: 16vh;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        background-color: var(--background);
    }
    footer::before{
        content: " ";
        height: 0.2px;
        width: 96%;
        background-color: var(--dark-gray);
        position: absolute;
        top: 0;
    }
    footer p{
        font-size: 14px;
        color: var(--gray);
    }
</style>